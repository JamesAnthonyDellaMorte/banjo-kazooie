import re
import os
import sys

def replace_bad_initializers_in_file(file_path):
    # Read the file contents
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Define the pattern to match bad initializers like 'u8 sp28[3] = D_803899F4;'
    pattern = re.compile(r'(\w+)\s+(\w+)\[(\d+)\]\s*=\s*(D_\w+);')

    new_lines = []
    changes_made = False

    for line_number, line in enumerate(lines, start=1):
        match = pattern.search(line)
        if match and re.match(r'D_\d+', match.group(4)):
            data_type = match.group(1)
            var_name = match.group(2)
            size = match.group(3)
            initializer = match.group(4)
            replacement = f"{data_type} {var_name}[{size}];\nmemcpy({var_name}, {initializer}, sizeof({var_name}));"
            new_lines.append(replacement + '\n')
            print(f"Bad initializer found and replaced in file '{file_path}' at line {line_number}")
            changes_made = True
        else:
            new_lines.append(line)

    # Only write back if changes were made
    if changes_made:
        with open(file_path, 'w') as file:
            file.writelines(new_lines)

def replace_bad_initializers_in_directory(directory):
    # Iterate over all files in the directory
    for root, _, files in os.walk(directory):
        for file in files:
            # Process only C files
            if file.endswith('.c'):
                file_path = os.path.join(root, file)
                replace_bad_initializers_in_file(file_path)

if __name__ == "__main__":
    # Check if the path is provided as an argument
    if len(sys.argv) != 2:
        print("Usage: python script.py <path_to_directory_or_file>")
        sys.exit(1)

    # Get the path from the arguments
    path = sys.argv[1]

    # Replace bad initializers in the specified file or directory
    if os.path.isdir(path):
        replace_bad_initializers_in_directory(path)
    elif os.path.isfile(path) and path.endswith('.c'):
        replace_bad_initializers_in_file(path)
    else:
        print("Invalid path provided. Please provide a valid C file or directory.")
        sys.exit(1)

    print("Bad initializers replaced successfully.")