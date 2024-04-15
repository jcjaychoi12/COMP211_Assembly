.data

pattern: 	.space 17	# array of 16 (1 byte) characters (i.e. string) plus one additional character to store the null terminator when N=16

N_prompt:	.asciiz "Enter the number of bits (N): "
newline: 	.asciiz "\n"
term:		.asciiz "\0"

.text

main:

#----------------------------------------------
#
# Fully Functional C Code for reference
#
# include<stdio.h>
# char pattern[17] = {0};
# void bingen( unsigned int N, unsigned int n );
#
# int main( int argc, char** argv ) {
#
#	 unsigned int N = 0;
#	 // You can assume the user enters a
#	 // value of N >= 1 and N <= 16.
#	 // i.e. no error checking is necessary
#	 printf( “Enter the number of bits (N): “);
#	 scanf(“%u�?, &N );
#
#	 unsigned int n = N;
#	 pattern[N] = ‘\0’; // Null terminate the string
#	 bingen( N, n );
#	 return 0;
# }
#
# void bingen( unsigned int N, unsigned int n ) {
#    if ( n > 0 ) {
#        pattern[N-n] = ‘0’;
#        bingen( N, n - 1 );
#        pattern[N-n] = ‘1’;
#        bingen( N, n - 1 );
#    } else printf( “%s\n�?, pattern );
# }
#
#----------------------------------------------

# TODO: Main Program

	# Print prompt
	addi $v0, $0, 4
	la $a0, N_prompt
	syscall
	
	# Read & Store N in $s1
	addi $v0, $0, 5
	syscall
	add $s1, $0, $v0
	
	# Create counter n in $s2
	add $s2, $0, $s1
	addi $s2, $s2, 1	# n + 1 so that recursive loop of n - 1 can work from the beginning
	
	# Terminate pattern array with \0
	la $s0, pattern		# Store address of pattern[] to $s0
	add $t5, $s0, $s1	# Address of pattern[N]
	addi $t4, $0, 0
	sb $t4, 0($t5)		# pattern[N] = "\0"
	
	# Call recursive()
	jal recursive
	
	# End program
	j exit

# TODO: Recursive Function

recursive: 

	# Save $sp & $fp
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $fp, 0($sp)
	addi $fp, $sp, 4
	
	# Store $s0, $s1, $s2 to memory
	addi $sp, $sp, -12
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	
	# Branch
	addi $s2, $s2, -1	# n - 1
	beq $s2, $0, else	# if (n == 0) --> else
	
	# If: Zero Pattern
	sub $t0, $s1, $s2	# N - n
	add $t2, $s0, $t0	# Address of pattern[N - n] = Address of pattern[] + Offset
	addi $t3, $0, 48
	sb $t3, 0($t2)		# pattern[N - n] = "0"
	jal recursive		# recursive(N, N - n)
	
	# If: One Pattern
	sub $t0, $s1, $s2	# N - n
	add $t2, $s0, $t0	# Address of pattern[N - n] = Address of pattern[] + Offset
	addi $t3, $0, 49
	sb $t3, 0($t2)		# pattern[N - n] = "0"
	jal recursive		# recursive(N, N - n)

	# Restore & Return
	lw $s0, -8($fp)
	lw $s1, -12($fp)
	lw $s2, -16($fp)
	addi $sp, $fp, 4
	lw $ra, 0($fp)
	lw $fp, -4($fp)
	jr $ra
	
else:
	
	# Print pattern
	addi $v0, $0, 4
	la $a0, 0($s0)
	syscall
	
	# Print newline
	addi $v0, $0, 4
	la $a0, newline
	syscall
	
	# Restore & Return
	lw $s0, -8($fp)
	lw $s1, -12($fp)
	lw $s2, -16($fp)
	addi $sp, $fp, 4
	lw $ra, 0($fp)
	lw $fp, -4($fp)
	jr $ra

exit:                     
  addi $v0, $0, 10      	# system call code 10 for exit
  syscall               	# exit the program
