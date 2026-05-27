.data
        # ==================================================
        # ALOCAÇÃO DE MEMÓRIA FIXA (Variáveis e Constantes)
        # ==================================================
        cor_vermelha: .word 0x00ff0000  # Vermelho (Viga)
        cor_preta:    .word 0x00000000  # Preto (Fundo)
        qtd_blocos:   .word 103         # Quantidade de blocos lógicos por andar

.text
main:
        # ==================================================
        # 1. CARREGAR VARIÁVEIS DA MEMÓRIA PARA REGISTRADORES
        # ==================================================
        # Utilizando registradores $s (saved) para manter os dados seguros
        lw $s0, cor_vermelha     # $s0 = Vermelho
        lw $s1, cor_preta        # $s1 = Preto
        lw $s5, qtd_blocos       # $s5 = 103 (Constante para resetar o loop)

        # ==================================================
        # ANDARES ÍMPARES (BURACO DE 25 BLOCKS NA ESQUERDA)
        # ==================================================

        # --------------------------------------------------
        # 3o ANDAR (Y = 36 e 37)
        # --------------------------------------------------
        # Topo do 3o andar
        lui $s2, 0x1001          # $s2 será o ponteiro de endereço da tela
        addi $s2, $s2, 18532     # Endereço: (36 * 512) + 100 bytes de gap
        move $s3, $s5            # $s3 = 103 (Copia o valor da RAM para o contador)
        li $s4, 0                # $s4 = Toggle de cor (0 = Vermelho)
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

        # Fundo do 3o andar
        lui $s2, 0x1001
        addi $s2, $s2, 19044     # Endereço: (37 * 512) + 100 bytes de gap
        move $s3, $s5            # Reseta o contador para 103
        li $s4, 1                # Toggle de cor (1 = Preto)
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

        # --------------------------------------------------
        # 5o ANDAR (Y = 10 e 11)
        # --------------------------------------------------
        # Topo do 5o andar
        lui $s2, 0x1001
        addi $s2, $s2, 5220      # Endereço: (10 * 512) + 100 bytes de gap
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

        # Fundo do 5o andar
        lui $s2, 0x1001
        addi $s2, $s2, 5732      # Endereço: (11 * 512) + 100 bytes de gap
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

        # Encerramento seguro do programa (Usando nomenclatura canônica $v0)
        li $v0, 10
        syscall