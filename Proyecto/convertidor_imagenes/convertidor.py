from PIL import Image
import numpy as np


## Genera el archivo .mif para cargar los datos de la imagen en la ROM
def generate_mif_file(grey_image_array):
    image_width = len(grey_image_array[0])
    image_depth = len(grey_image_array)

    string_datos = "WIDTH=" + str(8) + ";\n" + "DEPTH=" + str(image_width*image_depth) + ";\n\n"
    string_datos += "ADDRESS_RADIX=UNS;\nDATA_RADIX=HEX;\n\n"

    string_datos += "CONTENT BEGIN\n"

    for i in range(image_depth):
        string_datos += "[" + str(i*image_width) + ".." + str(i*image_width + image_width - 1) + "] : "
        
        for j in range(image_width):
            string_datos += format(int(grey_image_array[i][j]), '02x') + " "
        
        string_datos += "\n"

    string_datos += "END;\n"

    with open("image_hex_data.mif", "w") as mif_file:
        mif_file.write(string_datos)


## Guarda la matriz en una imagen en escala de grises
def save_grey_image(grey_image_array):
    grey_image = Image.fromarray(grey_image_array)
    grey_image = grey_image.convert("L")
    grey_image.save('grey_image.png')


## Convierte una imagen a una matriz de numpy en escala de grises, rango [0 (negro), 255 (blanco)]
def convert(file_name):
    image_array = np.array(Image.open(file_name))
    grey_image_array = np.empty([len(image_array), len(image_array[0])])

    for i in range(len(image_array)):
        for j in range(len(image_array[i])):
            blue = image_array[i, j, 0]
            green = image_array[i, j, 1]
            red = image_array[i, j, 2]

            grey_scale_value = blue * 0.114 + green * 0.587 + red * 0.299
            grey_image_array[i, j] = grey_scale_value
    
    return grey_image_array
    


    
grey_image_array = convert('imagenes/one_piece.png')

save_grey_image(grey_image_array)
generate_mif_file(grey_image_array)