
# Haskell Wordcount Project

This project implements a Haskell program to process text files, tokenize the words, and use a Red-Black Tree to sort the unique words. It also includes tests to verify the functionality.

# Start the Project
Run the following script to build, test and run the project:
```bash
./run.sh
```

## Requirements

- GHC (Glasgow Haskell Compiler)
- Cabal (Haskell build tool)
- hspec (for testing)

Ensure that GHC and Cabal are properly installed on your system. You can install them via GHCup:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

## Build the Project

Run the following command to build the project:
```bash
cabal build
```

## Run the Project

To execute the program, run:
```bash
cabal run wordcount
```

By default, the program expects an input file in `app/input/war-and-peace.txt` and outputs the sorted words to `app/output/output.txt`.

## Run the Tests

The project includes tests for key functionalities like file input/output. To run the tests:
```bash
cabal test
```

Make sure all test dependencies are installed, and the test suite should pass without errors.

## Easter Egg

The project includes tests for key functionalities like file input/output. To run the tests:
```bash
bash ./easterEgg/tree.sh Tree
```

# Project Description:

For the problem: Please create a program that reads the large text file "War and Peace" by Tolstoy and inserts each unique word (without punctuation or numbers) into a persistent red-black tree. After reading and inserting each unique word into the balanced tree, the sorted list of words should be written into a file named "output.txt".

Refer to the implementation guidelines in Bartosz Milewski's article: Functional Data Structures in C++: Trees.

A nice non-functional implementation can be found here: https://github.com/yassiommi/redblacktree

Create your solution in C++, Haskell, F#, Java, Python, Groovy, Scala, or Lisp using the following steps:

# Steps:
1) Include Necessary Headers and Set Up the Main Function:
- Include headers for file I/O, strings, vectors, and other required data structures.
- Set up the main function where the program will run.

2) Define the Red-Black Tree Data Structure:
- Implement the red-black tree data structure following the functional programming principles outlined in the referenced article. Ensure immutability and persistence.

3) Read the Text File:
- Create a function to read the text file and return its content as a string or a vector of strings.

4) Tokenize the Text:
- Create a function to tokenize the text into words. This function should handle punctuation and capitalization appropriately. Use functional programming techniques, such as higher-order functions and lambdas, for string manipulation and splitting.

5) Insert Words into the Red-Black Tree:
- Create a function to insert each unique word into the red-black tree. This function should ensure that duplicates are not inserted and that the tree remains balanced. Use functional programming techniques and immutability.

6) Traverse the Red-Black Tree:
- Create a function to traverse the red-black tree in order and collect the words in a sorted list. Use functional programming principles to ensure immutability and purity.

7) Write the Sorted List to a File:
- Create a function to write the sorted list of words to "output.txt".

8) Integrate All Functions:
- In the main function, integrate all the functions:
1) Read and tokenize the text file.
2) Insert each unique word into the red-black tree.
3) Traverse the tree to get the sorted list of words.
4) Write the sorted list to "output.txt".

9) Ensure Immutability and Functional Principles:
- Review all functions and data structures to ensure they follow functional programming principles, such as immutability, purity, and the use of higher-order functions.

10) Testing and Optimization:
- Test the program with the "War and Peace" text file.
- Optimize for performance, ensuring the red-black tree operations are efficient and the program can handle the large input size.
- Use doctest.h to test each function implemented.

11) Bonus Requirement (10% Extra Points): 
- Implement parallel execution to significantly improve performance (aim for at least double the speed). This can involve: 
1) Parallelizing the tokenization of the text. 
2) Parallelizing the insertion of words into the red-black tree. 
3) Using functional programming techniques and libraries that support parallel execution.
