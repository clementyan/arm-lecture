	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}	@依序將r3 r4 r5 lr的值存入堆疊

	subs r4,r0,#0	@ R4 = R0 - 0 (update flags)
	BLE .L3		@ if(R0 <= 0) goto .L3 (which returns 0)

	cmp r4,#1	@ Compare R4 wtih 1
	beq .L4		@ If R4 == 1 goto .L4 (which returns 1)

	sub r0,r4,#1	@ R0 = R4 - 1
		@ Recursive call to fibonacci with R4 - 1 as parameter

	mov r5,r0	@ R5 = R0
	sub r0,r4,#2	@ R0 = R4 - 2
		@ Recursive call to fibonacci with R4 - 2 as parameter

	adds r0,r0,r5	@ R0 = R5 + R0 (update flags)

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
