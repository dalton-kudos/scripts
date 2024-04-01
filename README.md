# Script Files

Welcome to the Git Branch Manager & File Transformer repository! This collection of scripts enhances your Git workflow and file processing with stylish command-line interfaces and useful automation. Dive into an easier way to manage your Git branches and transform files with simple, yet powerful tools.

## Features

- **Git Branch Manager**: Navigate and operate on your Git branches with ease. Our script supports branch selection, deletion, rebasing, squashing, and switching, all within a visually appealing command-line interface.
- **File Transformer**: Effortlessly modify files based on your needs. The included Python script allows for quick removal or transformation of specific parts of each line in a file.

## Getting Started

### Prerequisites

- Git
- Python 3.x
- [Gum](https://github.com/charmbracelet/gum) for enhanced CLI experiences

### Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/dalton-kudos/scripts.git
cd scripts
```

Ensure you have `gum` installed for the best experience:
```bash
brew install gum
```

## Usage
### Git Branch Manager
Navigate to your Git repository and execute the script:
```bash
./gbm.sh
```
Follow the interactive CLI prompts to manage your Git branches.

### File Transformer
```bash
python3 rmv_chs.py
```
Make sure to update the input_file_path and output_file_path variables in the script to match your file paths

### Customization
- Modify the Git Branch Manager script's GIT_COLOR to change the CLI highlight color to fit your preference.
- Adjust the Python script to transform files according to your specific requirements, whether it's removing certain characters or processing lines differently.

Acknowledgments
[Charm.sh](https://charm.sh) for creating Gum, and a host of other great tools for shell scripting.
