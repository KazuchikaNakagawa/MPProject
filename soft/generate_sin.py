from math import sin
from math import pi

def generate_tan():
    f = open("sin_table.h", "w")
    f.write("#ifndef SIN_TABLE_H\n")
    f.write("#define SIN_TABLE_H\n\n")
    f.write("double sin_table[256] = {\n")
    for i in range(0, 256):
        f.write(str(int(sin((i - 128) * 2 * pi / 256) * 100)))
        if i != 255:
            f.write(", \n")
        else:
            f.write("\n")
    f.write("};\n\n")

    f.write("#endif\n")
    f.close()

generate_tan()