def change_line(line: str) -> str:
    list_line = line.replace("\n", "").split(" ")

    return " ".join(list_line[:: -1]) + "\n"

def transc_invert(in_path: str, out_path: str):
    with open(out_path, "w") as out:
        with open(in_path, "r") as in_file:
            for line in in_file.readlines():
                out.write(change_line(line))


if __name__ == "__main__":
    transc_invert("./in_file.txt", "./out.txt")
