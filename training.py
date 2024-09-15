import cv2
import numpy as np
from PIL import Image
import os

recognizer = cv2.face.LBPHFaceRecognizer_create()

path = "dataset"

def getImageID(path):
    imagePath = [os.path.join(path, f) for f in os.listdir(path)]
    faces = []
    ids = []
    names = []
    for imagePaths in imagePath:
        faceImage = Image.open(imagePaths).convert('L')
        faceNP = np.array(faceImage)
        fileName = os.path.split(imagePaths)[-1]
        Id = int(fileName.split(".")[1])
        name = (fileName.split(".")[2])
        faces.append(faceNP)
        ids.append(Id)
        names.append(name)
        cv2.imshow("Training", faceNP)
        cv2.waitKey(1)
    return ids, faces, names

IDs, facedata, names = getImageID(path)
recognizer.train(facedata, np.array(IDs))
recognizer.write("Trainer.yml")
cv2.destroyAllWindows()
print("Training Data Berhasil...")
print("Daftar nama yang telah dilatih: ", names)