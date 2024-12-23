from math import tan
from math import pi

def generate_tan():
    f = open("tan_table.h", "w")
    f.write("#ifndef TAN_TABLE_H\n")
    f.write("#define TAN_TABLE_H\n\n")
    f.write("double tan_table[256] = {\n")
    for i in range(0, 256):
        f.write(str(tan((i - 128) * 2 * pi / 256)))
        if i != 255:
            f.write(", \n")
        else:
            f.write("\n")
    f.write("};\n\n")

    f.write("#endif\n")
    f.close()

generate_tan()