.data
        # ==================================================
        # 1. PALETA DE CORES E CONSTANTES
        # ==================================================
        cor_vermelha: .word 0x00ff0000
        cor_preta:    .word 0x00000000
        qtd_blocos:   .word 103

.text
main:
        # ==================================================
        # 2. INICIALIZAÇÃO DE REGISTRADORES BASE
        # ==================================================
        lw $s0, cor_vermelha
        lw $s1, cor_preta
        lw $s5, qtd_blocos

        # ==================================================
        # 3. 2o ANDAR
        # ==================================================
        lui $s2, 0x1001
        addi $s2, $s2, 25088
        move $s3, $s5
        li $s4, 1
second_top_loop:
        beqz $s4, second_top_red
second_top_black:
        sw $s1, 0($s2)
        j second_top_next
second_top_red:
        sw $s0, 0($s2)
second_top_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, second_top_loop

        lui $s2, 0x1001
        addi $s2, $s2, 25600
        move $s3, $s5
        li $s4, 0
second_bottom_loop:
        beqz $s4, second_bottom_red
second_bottom_black:
        sw $s1, 0($s2)
        j second_bottom_next
second_bottom_red:
        sw $s0, 0($s2)
second_bottom_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, second_bottom_loop

        # ==================================================
        # 4. 4o ANDAR
        # ==================================================
        lui $s2, 0x1001
        addi $s2, $s2, 11776
        move $s3, $s5
        li $s4, 1
fourth_top_loop:
        beqz $s4, fourth_top_red
fourth_top_black:
        sw $s1, 0($s2)
        j fourth_top_next
fourth_top_red:
        sw $s0, 0($s2)
fourth_top_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, fourth_top_loop

        lui $s2, 0x1001
        addi $s2, $s2, 12288
        move $s3, $s5
        li $s4, 0
fourth_bottom_loop:
        beqz $s4, fourth_bottom_red
fourth_bottom_black:
        sw $s1, 0($s2)
        j fourth_bottom_next
fourth_bottom_red:
        sw $s0, 0($s2)
fourth_bottom_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, fourth_bottom_loop

        # ==================================================
        # 5. ENCERRAMENTO
        # ==================================================
        li $v0, 10
        syscall