# This program was 100% made by Rohan Mankame 

# Author: Rohan Mankame and Mete Elbeyli
# E-mail: rym5387@psu.edu and mbe5290@psu.edu
# Course: CMPSC 312
# Assignment: MIPS Programming Project 2
# Due date: 4/24/2023
# File: PrimeNumChecker.asm
# Purpose: check if a number is prime or not
# Simulator: MARS 4.5
# Operating system: MS Windows 11 Home
# References: Class demo programs, 
.data
	prompt: .asciiz "\n |Prime Number Checker|"
	
	Input: .asciiz "\n Enter number to check if its prime: "

	ISPrimePrompt: .asciiz "\n Number is Prime"
	
	ISNegative: .asciiz "\n Number entered is negative, please enter a positive number next time "

	NOTPrime: .asciiz "\n Number is not Prime "
	
	InvalidInput: .asciiz "\n Invalid input "
	
	ValidInput: .asciiz "\n Processing "
	
	EndOfProgram: .asciiz "\n Programe ended because you entered 0 "

.text

	###INITIAL CHECK OF NUMBER CODE###
	mian:				# initial number check
	li $v0, 4 			# print string (envoke print comand)
	la $a0, prompt			# (prompt)
	syscall
	li $v0,4			# print string
	la $a0, Input			# take input:
	syscall
	li $v0, 5
	syscall
	li $t1, 2			#$t1 set to 2
	li $t5, 1			#$t5 set to 1
	move $t0, $v0  			# move number to $t0 form $v0 
	beq $t0, $t5, NotPrime		#num is 1 so its not prime
	ble $t0, $zero, InputNotValid	# if num <= 0 then go to InputNotValid			
	bgt $t0, $zero, CheckPrime	# if num > 0 then go to InputVALID
	syscall
	
	###RUN FOR NEXT NUMBER TO CHECK CHECK### (SAME AS INITIAL CODE)###
	CheckNextNum:
	li $v0, 4 			# print string (envoke print comand)
	la $a0, prompt			# (prompt)
	syscall
	li $v0,4			# print string
	la $a0, Input			# take input:
	syscall
	li $v0, 5
	syscall
	li $t1, 2			#$t1 set to 2
	li $t5, 1			#$t5 set to 1
	move $t0, $v0  			# move number to $t0 form $v0 
	beq $t0, $t5, NotPrime		#num is 1 so its not prime
	ble $t0, $zero, InputNotValid	# if num <= 0 then go to InputNotValid			
	bgt $t0, $zero, CheckPrime	# if num > 0 then go to InputVALID
	syscall
	
	
	###NUMBER VALID OR NOT-VALID CODE - go to the correct case###
	InputNotValid:			#Num is not valid
	beq $t0, $zero, isZero		#if num is 0, go to end program in isZero
	blt $t0, $zero, NumNegitive	#if num was a negitive number go to NumNegativ
	syscall
	
	
	###NUMBER IS NEGATIVE OR ZERO###
	NumNegitive:
	li $v0,4
	la $a0, ISNegative		#output is negative message to ask user to enter positive num
	syscall
	ble $t0, $zero, CheckNextNum 	#go to get next number 
	syscall

	
	isZero: 			#num is 0 so end program
	li $v0,4
	la $a0, EndOfProgram
	syscall
	li $v0, 10   			#end program
	syscall 
	
	
	###CHECK IF NUMBER IS PRIME###
	CheckPrime:
	bne $t0, $zero, LoopCheckerHelper
	syscall
	
	LoopCheckerHelper:
	beq  $t0,$t1,IsPrime 	#if num inputed by user = to range num then num is prime
	div  $t0,$t1		#div and check if remainder is 0
	mfhi $t4
	beq $t4, $zero,NotPrime	#if mod is 0 then number is 0 not prime
	add  $t1,$t1,$t5 	# incriment $t1 by adding 1 from $t5 
	bgtz $t4,LoopCheckerHelper	#loop again
	syscall

	
	
	###NUMBER IS PRIME CODE###
	IsPrime:
	li $v0,4
	la $a0, ISPrimePrompt
	syscall
	beqz $t6,CheckNextNum

	
	###NUMBER IS PRIME CODE###
	NotPrime:
	li $v0,4
	la $a0, NOTPrime
	syscall
	beqz $t6,CheckNextNum
	
	

	
	
	
	
