.data
        # ==================================================
        # 1. PALETA DE CORES DA PORTA
        # ==================================================
        cor_marrom:   .word 0x008b4513
        cor_amarela:  .word 0x00ffff00

.text
main:
        # ==================================================
        # 2. INICIALIZAÇÃO DE REGISTRADORES
        # ==================================================
        lw $s7, cor_marrom

        # ==================================================
        # 3. PORTA DE SAÍDA DE MADEIRA COM MAÇANETA
        # ==================================================
        lui $s2, 0x1001
        addi $s2, $s2, 1496      # Offset: Y=2, X=118
        li $t0, 8
door_y_loop:
        li $t1, 5
        move $t2, $s2
door_x_loop:
        sw $s7, 0($t2)
        addi $t2, $t2, 4
        addi $t1, $t1, -1
        bgtz $t1, door_x_loop
        
        addi $s2, $s2, 512
        addi $t0, $t0, -1
        bgtz $t0, door_y_loop

        lui $s2, 0x1001
        addi $s2, $s2, 3548      # Offset maçaneta: Y=6, X=119
        lw $t3, cor_amarela
        sw $t3, 0($s2)

        # ==================================================
        # 4. ENCERRAMENTO
        # ==================================================
        li $v0, 10
        syscall