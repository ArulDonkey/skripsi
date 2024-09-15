#ifndef CAMERA_PINS_H
#define CAMERA_PINS_H

#define CAMERA_MODEL_AI_THINKER

#if defined(CAMERA_MODEL_AI_THINKER)
  #define PWDN_GPIO_NUM    32
  #define RESET_GPIO_NUM   -1
  #define XCLK_GPIO_NUM    0
  #define SIOD_GPIO_NUM    26
  #define SIOC_GPIO_NUM    27
  #define Y2_GPIO_NUM      34
  #define Y3_GPIO_NUM      35
  #define Y4_GPIO_NUM      32
  #define Y5_GPIO_NUM      33
  #define Y6_GPIO_NUM      14
  #define Y7_GPIO_NUM      13
  #define PCLK_GPIO_NUM    22
  #define VSYNC_GPIO_NUM   25
  #define HREF_GPIO_NUM    23
#endif

#endif // CAMERA_PINS_H