from math import cos
from math import pi

def generate_tan():
    f = open("cos_table.h", "w")
    f.write("#ifndef COS_TABLE_H\n")
    f.write("#define COS_TABLE_H\n\n")
    f.write("double cos_table[256] = {\n")
    for i in range(0, 256):
        f.write(str(cos((i - 128) * 2 * pi / 256)))
        if i != 255:
            f.write(", \n")
        else:
            f.write("\n")
    f.write("};\n\n")

    f.write("#endif\n")
    f.close()

generate_tan()