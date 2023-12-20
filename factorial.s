.data
.balign 4
prompt1: .asciz "Enter the number you want factorial of: "

.balign 4
number: .word 0

.balign 4
pattern: .asciz "%d"

.balign 4
output: .asciz "Therefore, %d! = %d\n"

.balign 4
lr_bu1: .word 0


.text
calculate_factorial:
push {lr}

sub r1, r1, #1
mul r0, r0, r1

cmp r1, #1
bgt calculate_factorial

pop {pc}


.global main
.func main

main:
ldr r1, =lr_bu1
str lr, [r1]

@printing the prompt
ldr r0, =prompt1
bl printf

@scan the number
ldr r0, =pattern
ldr r1, =number
bl scanf

ldr r0, =number
ldr r0, [r0]
mov r1, r0
bl calculate_factorial

mov r2, r0

ldr r0, =output
ldr r1, =number
ldr r1, [r1]
bl printf


ldr lr, =lr_bu1
ldr lr, [lr]
bx lr

.global printf
.global scanf
 
