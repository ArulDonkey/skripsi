#include <WiFi.h>
#include <WebServer.h>
#include <esp32cam.h>
#include "esp_camera.h"

const char* WIFI_SSID = "IYUS RUSTANDI";
const char* WIFI_PASS = "29022008";

#define relayPin 12
// #define flash_on 13

#define CAMERA_MODEL_AI_THINKER

WebServer server(80);

static auto loRes = esp32cam::Resolution::find(320, 240);
static auto midRes = esp32cam::Resolution::find(350, 530);
static auto hiRes = esp32cam::Resolution::find(800, 600);
static auto veryHiRes = esp32cam::Resolution::find(1024, 768);
static auto ultraRes = esp32cam::Resolution::find(1600, 1200);

void serveJpg() {
  auto frame = esp32cam::capture();
  if (frame == nullptr) {
    Serial.println("CAPTURE FAIL");
    server.send(503, "", "");
    return;
  }
  Serial.printf("CAPTURE OK %dx%d %db\n", frame->getWidth(), frame->getHeight(),
                static_cast<int>(frame->size()));

  server.setContentLength(frame->size());
  server.send(200, "image/jpeg");
  WiFiClient client = server.client();
  frame->writeTo(client);
}

void handleJpgLo() {
  if (!esp32cam::Camera.changeResolution(loRes)) {
    Serial.println("SET-LO-RES FAIL");
  }
  serveJpg();
}

void handleJpgHi() {
  if (!esp32cam::Camera.changeResolution(hiRes)) {
    Serial.println("SET-HI-RES FAIL");
  }
  serveJpg();
}

void handleJpgMid() {
  if (!esp32cam::Camera.changeResolution(midRes)) {
    Serial.println("SET-MID-RES FAIL");
  }
  serveJpg();
}

void handleJpgVeryHi() {
  if (!esp32cam::Camera.changeResolution(veryHiRes)) {
    Serial.println("SET-VERY-HI-RES FAIL");
  }
  serveJpg();
}

void handleJpgUltra() {
  if (!esp32cam::Camera.changeResolution(ultraRes)) {
    Serial.println("SET-ULTRA-RES FAIL");
  }
  serveJpg();
}

// Unlock System Door
void handleLock() {
  digitalWrite(relayPin, LOW);  // TUTUP KUNCI
  server.send(200, "text/plain", "Door Locked");
}

void handleUnlock() {
  digitalWrite(relayPin, HIGH);  // Buka Kunci
  delay(5000);
  digitalWrite(relayPin, LOW);
  server.send(200, "text/plain", "Door Unlocked");
}

// void handleFlash(){

// }

void setup() {
  Serial.begin(115200);
  pinMode(relayPin, OUTPUT);
  digitalWrite(relayPin, LOW);
  Serial.println();

  {
    using namespace esp32cam;
    Config cfg;
    cfg.setPins(pins::AiThinker);
    cfg.setResolution(hiRes);
    cfg.setBufferCount(2);
    cfg.setJpeg(80);

    bool ok = Camera.begin(cfg);
    Serial.println(ok ? "CAMERA OK" : "CAMERA FAIL");
  }

  // Start server
  WiFi.persistent(false);
  WiFi.mode(WIFI_STA);
  WiFi.begin(WIFI_SSID, WIFI_PASS);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  server.on("/cam-lo.jpg", handleJpgLo);
  server.on("/cam-hi.jpg", handleJpgHi);
  server.on("/cam-mid.jpg", handleJpgMid);
  server.on("/cam-veryhi.jpg", handleJpgVeryHi);
  server.on("/cam-ultra.jpg", handleJpgUltra);
  server.on("/unlock", handleUnlock);
  server.on("/lock", handleLock);

  server.begin();
  Serial.println("HTTP server started");
}

void loop() {
  server.handleClient();
}