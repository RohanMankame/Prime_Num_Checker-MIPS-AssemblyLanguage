# Prime Number Checker in MIPS Assembly

This is a MIPS assembly language program that checks if a user-provided integer is a prime number. The program is designed to run in the MARS (MIPS Assembler and Runtime Simulator) environment. It handles various inputs, including positive integers, negative numbers, one, and zero, providing a continuous loop for checking multiple numbers until the user decides to exit.

## Features

* **Interactive Prompt**: The program prompts the user to enter a number.
* **Prime Number Verification**: It correctly determines if a number is prime using a division-based loop.
* **Robust Input Handling**:
    * Any integer greater than 1 is evaluated.
    * The number 1 is correctly identified as **not** a prime number.
    * Negative numbers are rejected with an error message.
    * The program can be terminated by entering 0.
* **Continuous Operation**: After checking a number, the program prompts for a new one, allowing for multiple checks in a single session.

## How to Use

1.  **Load the File**: Open the `PrimeNumChecker.asm` file in the MARS 4.5 simulator.
2.  **Assemble**: Use the "Assemble" feature (or press F3) to compile the code.
3.  **Run**: Open the "Execute" tab and click "Run" (or press F5).
4.  **Interact**: The console will prompt you to enter a number. Type a number and press Enter.
5.  **View Results**: The program will print whether the number is prime or not.
6.  **Exit**: To stop the program, enter `0` at the prompt.

## Code Explanation

The program is divided into data and text segments. The `.data` segment declares the strings used for user interaction, while the `.text` segment contains the main program logic.

### .data Segment

This section initializes the strings that will be displayed to the user.

```assembly
.data
	prompt: .asciiz "\n |Prime Number Checker|"
	Input: .asciiz "\n Enter number to check if its prime: "
	ISPrimePrompt: .asciiz "\n Number is Prime"
	ISNegative: .asciiz "\n Number entered is negative, please enter a positive number next time "
	NOTPrime: .asciiz "\n Number is not Prime "
	EndOfProgram: .asciiz "\n Programe ended because you entered 0 "
```
## Authors
Rohan Mankame and 
Mete Elbeyli
