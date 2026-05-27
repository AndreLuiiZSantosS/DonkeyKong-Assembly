.data
        # ==================================================
        # 1. PALETA DE CORES E CONSTANTES
        # ==================================================
        cor_vermelha: .word 0x00ff0000
        cor_preta:    .word 0x00000000
        cor_marrom:   .word 0x008b4513
        cor_amarela:  .word 0x00ffff00
        qtd_103:      .word 103
        qtd_25:       .word 25

.text
main:
        # ==================================================
        # 2. INICIALIZAÇÃO DE REGISTRADORES BASE
        # ==================================================
        lw $s0, cor_vermelha
        lw $s1, cor_preta
        lw $s5, qtd_103
        lw $s6, qtd_25
        lw $s7, cor_marrom

        # ==================================================
        # 3. BASE / 1o ANDAR (INTEIRO)
        # ==================================================
        lui $s2, 0x1001
        addi $s2, $s2, 31744
        move $s3, $s5
        li $s4, 0
base_top_loop:
        beqz $s4, base_top_red
base_top_black:
        sw $s1, 0($s2)
        j base_top_next
base_top_red:
        sw $s0, 0($s2)
base_top_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, base_top_loop

        move $s3, $s6
base_top_tail_loop:
        beqz $s4, base_top_tail_red
base_top_tail_black:
        sw $s1, 0($s2)
        j base_top_tail_next
base_top_tail_red:
        sw $s0, 0($s2)
base_top_tail_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, base_top_tail_loop

        lui $s2, 0x1001
        addi $s2, $s2, 32256
        move $s3, $s5
        li $s4, 1
base_bottom_loop:
        beqz $s4, base_bottom_red
base_bottom_black:
        sw $s1, 0($s2)
        j base_bottom_next
base_bottom_red:
        sw $s0, 0($s2)
base_bottom_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, base_bottom_loop

        move $s3, $s6
base_bottom_tail_loop:
        beqz $s4, base_bottom_tail_red
base_bottom_tail_black:
        sw $s1, 0($s2)
        j base_bottom_tail_next
base_bottom_tail_red:
        sw $s0, 0($s2)
base_bottom_tail_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, base_bottom_tail_loop

        # ==================================================
        # 4. 2o ANDAR
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
        # 5. 3o ANDAR
        # ==================================================
        lui $s2, 0x1001
        addi $s2, $s2, 18532
        move $s3, $s5
        li $s4, 0
third_top_loop:
        beqz $s4, third_top_red
third_top_black:
        sw $s1, 0($s2)
        j third_top_next
third_top_red:
        sw $s0, 0($s2)
third_top_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, third_top_loop

        lui $s2, 0x1001
        addi $s2, $s2, 19044
        move $s3, $s5
        li $s4, 1
third_bottom_loop:
        beqz $s4, third_bottom_red
third_bottom_black:
        sw $s1, 0($s2)
        j third_bottom_next
third_bottom_red:
        sw $s0, 0($s2)
third_bottom_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, third_bottom_loop

        # ==================================================
        # 6. 4o ANDAR
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
        # 7. 5o ANDAR
        # ==================================================
        lui $s2, 0x1001
        addi $s2, $s2, 5220
        move $s3, $s5
        li $s4, 0
fifth_top_loop:
        beqz $s4, fifth_top_red
fifth_top_black:
        sw $s1, 0($s2)
        j fifth_top_next
fifth_top_red:
        sw $s0, 0($s2)
fifth_top_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, fifth_top_loop

        lui $s2, 0x1001
        addi $s2, $s2, 5732
        move $s3, $s5
        li $s4, 1
fifth_bottom_loop:
        beqz $s4, fifth_bottom_red
fifth_bottom_black:
        sw $s1, 0($s2)
        j fifth_bottom_next
fifth_bottom_red:
        sw $s0, 0($s2)
fifth_bottom_next:
        addi $s2, $s2, 4
        xori $s4, $s4, 1
        addi $s3, $s3, -1
        bgtz $s3, fifth_bottom_loop

        # ==================================================
        # 8. PORTA DE SAÍDA DE MADEIRA COM MAÇANETA
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
        # 9. ENCERRAMENTO
        # ==================================================
        li $v0, 10
        syscall