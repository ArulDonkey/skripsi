import cv2
import urllib.request
import numpy as np
import requests

# Server URL dari ESP32-CAM
url = "http://192.168.100.174/cam-mid.jpg"
solenoid_on_url = "http://192.168.100.174/unlock"
solenoid_off_url = "http://192.168.100.174/lock"

# Memuat Haarcascade untuk deteksi wajah
recognizer = cv2.face.LBPHFaceRecognizer_create()
recognizer.read('Trainer.yml')
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

# Inisialisasi variabel count
count = 0

while True:
    img_resp = urllib.request.urlopen(url)
    imgnp = np.array(bytearray(img_resp.read()), dtype=np.uint8)
    img = cv2.imdecode(imgnp, -1)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)
    
    # Struktur gambar persegi di sekitar area wajah yang terdeteksi 
    for (x, y, w, h) in faces:
        count += 1
        cv2.rectangle(img, (x, y), (x+w, y+h), (50, 50, 255), 1)
        id, confidence = recognizer.predict(gray[y:y+h, x:x+w])
        if confidence < 100:
            id = f"User {id}"
            requests.get(solenoid_on_url)  # Aktifkan solenoid
            confidence = f"  {round(100 - confidence)}%"
            
        else:
            id = "unknown"
            
        cv2.putText(img, str(id), (x+5, y-5), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        cv2.putText(img, str(confidence), (x+5, y+h-5), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 0), 1)

    # Tampilan hasil 
    cv2.imshow('ESP 32-Cam Face Detection', img)
    
    # Keluar dengan menekan 'q'
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
    
# Bersihkan jendela 
cv2.destroyAllWindows()