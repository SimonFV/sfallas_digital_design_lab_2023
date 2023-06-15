import numpy as np
from PIL import Image

with open("result.mem", "r") as mif_file:
    data = mif_file.read()

data = data.split("\n")[3:-1]
for i in range(len(data)):
    data[i] = int(data[i].strip())

data = np.array(data)

data = np.reshape(data, (256,256))


# Guarda el resultado
grey_image = Image.fromarray(data)
grey_image = grey_image.convert("L")
grey_image.save("imagen_de_memoria.png")