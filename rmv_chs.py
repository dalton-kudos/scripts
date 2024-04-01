# Python script to remove "?: {" from each line in the input file

input_file_path = 'old_file.txt'  # Replace with the path to your input file
output_file_path = 'new_file.txt'  # Replace with the desired output file path

# with open(input_file_path, 'r') as infile, open(output_file_path, 'w') as outfile:
#     for line in infile:
#         # Remove "?: {" from each line
#         modified_line = line.rstrip('?: {') + '\n'
#         outfile.write(modified_line)

# print(f'Transformation complete. Output written to {output_file_path}')

with open(input_file_path, 'r') as infile, open(output_file_path, 'w') as outfile:
    for line in infile:
        # Remove the last 5 characters from each line
        modified_line = line[:-5] + '\n'
        outfile.write(modified_line)

print(f'Transformation complete. Output written to {output_file_path}')