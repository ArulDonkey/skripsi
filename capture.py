import cv2
import urllib.request
import numpy as np

#Server url dari esp 32 cam
url = "http://192.168.100.174/cam-hi.jpg"

#Memuat Haarcascade untuk deteksi wajah

face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades +'haarcascade_frontalface_default.xml')

id = input("Masukan ID Anda : ")
name = input("Masukan Nama Anda : ")
#id = int(id)
count=0

while True:
    img_resp=urllib.request.urlopen(url)
    imgnp=np.array(bytearray(img_resp.read()), dtype=np.uint8)
    img=cv2.imdecode(imgnp,-1)
    gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    face=face_cascade.detectMultiScale(gray, 1.3, 5)
    
    #Struktur Gambar persegi di sekitar area wajah yang terdeteksi 
    for (x, y, w, h) in face :
        count=count+1
        cv2.imwrite(f'dataset/User.{id}.{count}.{name}.jpg', gray[y:y+h, x:x+w])
        cv2.rectangle(img,(x,y),(x+w,y+h),(50,50,255),1)
        
    #Tampilan hasil 
    cv2.imshow('ESP 32-Cam Face Detection', img)
    
    
    #Keluar dengan menekan 'q'
    k=cv2.waitKey(1)
    if count>50:
        break
    
#Bersihkan jendela 
cv2.destroyAllWindows()
print("Data Collections Berhasil....")