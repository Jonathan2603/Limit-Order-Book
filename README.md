# Limit Order Book Reconstruction

## Project Overview

This project focuses on reconstructing a limit order book from order messages and computing quantities based on the limit order book. The aim is to provide a deeper understanding of market microstructure and its impact on trading.

## Table of Contents

- [Project Overview](#project-overview)
- [Folder Structure](#folder-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Input Files](#input-files)
- [Output Files](#output-files)
- [Scripts](#scripts)
- [Contact](#contact)
- [License](#license)

## Folder Structure

The project directory contains the following structure:

```bash
limit_order_book/
│
├── input/
│   ├── book_1.csv
│   ├── book_2.csv
│   ├── book_3.csv
│   ├── empty.txt
│   ├── message_a.txt
│   ├── message_ar.txt
│   ├── message_arc.txt
│   ├── message_ex_add.txt
│   ├── message_ex_cross.txt
│   ├── message_ex_reduce.txt
│   ├── message_ex_same_price.txt
│
├── output/
│   ├── book_1-message_a.out
│   ├── book_1-message_ar.out
│   ├── book_1-message_arc.out
│   ├── book_2-message_a.out
│   ├── book_2-message_ar.out
│   ├── book_2-message_arc.out
│   ├── book_3-message_a.out
│   ├── book_3-message_ar.out
│   ├── book_3-message_arc.out
│
├── .Rhistory
├── .DS_Store
├── common.R
├── main.R
└── solution.R
```

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/limit_order_book.git
    cd limit_order_book
    ```

2. **Install required R packages:**
   
   Make sure you have R installed on your system. You may need to install the required packages by running:

    ```R
    install.packages(c("dplyr", "readr"))
    ```

## Usage

To run the main script and process the input files, execute the following command in your R environment:

```R
source('main.R')
```

The script will read data from the input directory, process it according to the specified logic, and write the results to the output directory.

## Input Files

CSV Files:
 
	•	book_1.csv
	•	book_2.csv
	•	book_3.csv
 
Text Messages:

	•	empty.txt
	•	message_a.txt
	•	message_ar.txt
	•	message_arc.txt
	•	message_ex_add.txt
	•	message_ex_cross.txt
	•	message_ex_reduce.txt
	•	message_ex_same_price.txt

## Output Files

The output files are generated based on the processing of the input files. They are stored in the output directory with filenames indicating the input file and the type of processing applied. For example:

	•	book_1-message_a.out
	•	book_2-message_ar.out
	•	book_3-message_arc.out

## Scripts

	•	main.R: The main script to execute the processing.
	•	common.R: Contains common functions and utilities used by the main script.
	•	solution.R: Includes specific solutions and processing logic for the limit order book reconstruction.

## Contact

If you have any questions or suggestions, feel free to reach out:

- Jonathan Nazareth
- Email: jgnazareth26@gmail.com
- LinkedIn: https://www.linkedin.com/in/jonathan-nazareth/
- GitHub: https://github.com/Jonathan2603
