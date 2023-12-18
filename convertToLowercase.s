.global _start

_start:
mov r7, #3 @systemcall keyboard
mov r0, #1 @set input stream Keyboard
mov r2, #1 @Read char of len 1
ldr r1, =char
svc 0

_lowercase:
ldr r1, =char
ldr r0, [r1]
EOR r0, r0, #32
str r0, [r1]

_write:
mov r7, #4 @systemcall output to screen
mov r0, #0 @set output to monitor
mov r2, #1 @output char of len 1
ldr r1, =char
svc 0

end:
mov r7, #1
svc 0


.data
char:
.ascii " "
