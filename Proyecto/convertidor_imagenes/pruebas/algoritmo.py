import numpy as np
import convertidor as c




## PASO 1

I = c.convert('../imagenes/marte.png').astype(int).tolist()
N = len(I)

## PASO 2

distribucion_pixeles = [0] * N

for row in I:
    for element in row:
        distribucion_pixeles[element] += 1


## PASO 3

frecuencia_acumulada = [0] * N

for index in range(N):
    frecuencia_acumulada[index] = distribucion_pixeles[index] + frecuencia_acumulada[index - 1]


## PASO 4

residuo = frecuencia_acumulada[N-1] % N
division = int(frecuencia_acumulada[N-1] / N)

frecuencia_distribuida = [division] * N
if residuo != 0:
    for i in range(residuo):
        frecuencia_distribuida[i] += 1


## PASO 5

frecuencia_distribuida_acumulada = [0] * N

for index in range(N):
    frecuencia_distribuida_acumulada[index] = frecuencia_distribuida[index] + frecuencia_distribuida_acumulada[index - 1]


## PASO 6

remapeo_final = [0] * N

for index in range(N):
    Cuf = frecuencia_acumulada[index]

    temp_index = 0
    menor = frecuencia_distribuida_acumulada[index] + 1

    for i in range(N):
        dif = abs(frecuencia_distribuida_acumulada[i] - Cuf)

        if dif < menor:
            temp_index = i
            menor = dif
    
    remapeo_final[index] = temp_index


## PASO 7

w, h = N, N
I_2 = [[0 for x in range(w)] for y in range(h)]

for row in range(len(I_2)):
    for index in range(len(I_2[row])):
        I_2[row][index] = I[row][index]


for row in range(len(I_2)):
    for index in range(len(I_2[row])):
        I_2[row][index] = remapeo_final[I[row][index]]



print(distribucion_pixeles)
print(frecuencia_acumulada)
print(frecuencia_distribuida)
print(frecuencia_distribuida_acumulada)
print(remapeo_final)

image_array = np.array(I_2)
c.save_grey_image(image_array, "resultado")

# imagen inicial
#print("\nimagen inicial")
#for row in I:
#    print(row)

# imagen final
string_datos = ""
for row in I_2:
    string_datos += str(row) + "\n"

with open("prueba.txt", "w") as txt_file:
        txt_file.write(string_datos)