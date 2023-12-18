.data
.balign 4
prompt1: .asciz "Enter the first number: "

.balign 4
prompt2: .asciz "Enter the second number: "

.balign 4
prompt3: .asciz "Enter the third number: "

.balign 4
pattern: .asciz "%d"

.balign 4
outprompt: .asciz "%d + %d + %d = %d"

.balign 4
number1: .word 0

.balign 4
number2: .word 0

.balign 4
number3: .word 0

.balign 4
lr_bu1: .word 0

.balign 4
lr_bu2: .word 0


.text
@this is a custom function that returns the sum of three numbers
sum_three:
@push {r4-r11}
ldr r4, addr_lr_bu1
str lr, [r4]

add r0, r0, r1
add r0, r0, r2

@pop {r4-r11}
ldr lr, addr_lr_bu1
ldr lr, [lr]
bx lr


addr_lr_bu1: .word lr_bu1

.global main
.func main


main:
ldr r1, addr_lr_bu2
str lr, [r1]

ldr r0, addr_prompt1
bl printf


ldr r0, addr_pattern
ldr r1, addr_number1
bl scanf

ldr r0, addr_prompt2
bl printf


ldr r0, addr_pattern
ldr r1, addr_number2
bl scanf

ldr r0, addr_prompt3
bl printf

ldr r0, addr_pattern
ldr r1, addr_number3
bl scanf

@pass the numbers to the custom function
ldr r0, addr_number1
ldr r0, [r0]
ldr r1, addr_number2
ldr r1, [r1]
ldr r2, addr_number3
ldr r2, [r2]
bl sum_three

@TODO: need to find a way to out the fifth arg

mov r4, r0
sub sp, sp, #4
str r4, [sp]


ldr r0, addr_outprompt
ldr r1, addr_number1
ldr r1, [r1]
ldr r2, addr_number2
ldr r2, [r2]
ldr r3, addr_number3
ldr r3, [r3]
bl printf

add sp, sp, #4


ldr lr, addr_lr_bu2
ldr lr, [lr]
bx lr



addr_prompt1: .word prompt1
addr_prompt2: .word prompt2
addr_prompt3: .word prompt3
addr_number1: .word number1
addr_number2: .word number2
addr_number3: .word number3
addr_pattern: .word pattern
addr_lr_bu2: .word lr_bu2
addr_outprompt: .word outprompt

.global printf
.global scanf


