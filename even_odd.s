.data
.balign 4
prompt: .asciz "Enter the number you want to check: "

.balign 4
number: .word 0

.balign 4
pattern: .asciz "%d"

.balign 4
odd: .asciz "%d is an odd number.\n"

.balign 4
even: .asciz "%d is an even number.\n"


.text
print_odd:
push {lr}
ldr r0, =odd
ldr r1, =number
ldr r1, [r1]
bl printf
pop {pc}


print_even:
push {lr}
ldr r0, =even
ldr r1, =number
ldr r1, [r1]
bl printf 
pop {pc}


check_even_odd:
push {lr}
mov r1, r0
eor r2, r0, #1

cmp r1, r2
bgt print_odd
bl print_even


pop {pc}


.global main
.func main


main:
push {lr}

ldr r0, =prompt
bl printf

ldr r0, =pattern
ldr r1, =number
bl scanf

ldr r0, =number
ldr r0, [r0]
bl check_even_odd

pop {pc}

end:
mov r7, #1
swi 0

.global printf
.global scanf
