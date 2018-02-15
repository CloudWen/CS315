
	.text
	.globl	main
main:
	subu	$sp, $sp, 4 	        # Make additional stack space.
	sw	$ra, 0($sp)		# Save the return address
	
	addi $t0, $zero, 0		#int x=0.
	addi $t1, $zero, 0x7		#int y=0x7
	addi $t2, $zero, 0x6A		#int z=0x6A
	addi $t3, $t1, 0		#temp = y
	
	bgt $t3, $0, case1		#if temp>0
	
case1:	add $t0, $t0, $t1		#x=x+y
	add $t0, $t0, $t2		#x=x+z
	sub $t3, $t3, 1			#temp = temp-1
	bgt $t3, $0, case1
	ble $t3, $0, done
	
done:	li	$v0, 1
	move	$a0, $t0
	syscall
