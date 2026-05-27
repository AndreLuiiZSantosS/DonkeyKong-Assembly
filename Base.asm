.data
        # ==================================================
        # 1. PALETA DE CORES E CONSTANTES
        # ==================================================
        cor_vermelha: .word 0x00ff0000
        cor_preta:    .word 0x00000000
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

        # ==================================================
        # 3. BASE / 1o ANDAR (INTEIRO)
        # ==================================================

        # --- Linha Superior (103 blocos) ---
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

        # --- Linha Superior (25 blocos) ---
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

        # --- Linha Inferior (103 blocos) ---
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

        # --- Linha Inferior (25 blocos) ---
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
        # 4. ENCERRAMENTO
        # ==================================================
        li $v0, 10
        syscall