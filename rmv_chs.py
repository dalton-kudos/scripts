"""
Python script to remove 'n' characters from
the end of each line in the input text file
"""
in_fp = './in_file.txt'  # input file path, replace with the path to your input file
out_fp = './out_file.txt'  # replace with the desired output file path

with open(in_fp, 'r') as in_file, open(out_fp, 'w') as out_file:
    for line in in_file:
        # Remove the last 5 characters from each line
        mod_line = line[:-5] + '\n'
        out_file.write(mod_line)

print(f'Transformation complete. Output written to {out_fp}')
