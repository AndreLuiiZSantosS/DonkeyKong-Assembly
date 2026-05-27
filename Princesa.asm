.data
        # ==================================================
        # 1. PALETA DE CORES (PRINCESA)
        # ==================================================
        cor_p_rosa:      .word 0x00ff66cc      # Rosa (Vestido)
        cor_p_loiro:     .word 0x00ffff00      # Amarelo (Cabelo e Coroa)
        cor_p_pele:      .word 0x00ffcc99      # Pele (Rosto e Mãos)
        cor_p_preto:     .word 0x00000000      # Preto (Olhos)
        cor_p_vermelho:  .word 0x00ff0000      # Vermelho (Sapatos)

.text
main:
        # ==================================================
        # 2. POSIÇÃO DA PRINCESA (CENTRO DO 5o ANDAR)
        # ==================================================
        # Topo da cabeça no Y=0, X=71
        # Cálculo: (0 * 512) + (71 * 4) = 284
        lui $a0, 0x1001
        addi $a0, $a0, 284
        
        jal draw_princesa

        # ==================================================
        # 3. ENCERRAMENTO
        # ==================================================
        li $v0, 10
        syscall

        # ==================================================
        # 4. SUB-ROTINA: PRINCESA ESTÁTICA (7x10 Pixels)
        # Proporção igual ao Mario (10 de altura)
        # ==================================================
draw_princesa:
        lw $t0, cor_p_rosa
        lw $t1, cor_p_loiro
        lw $t2, cor_p_pele
        lw $t3, cor_p_preto
        lw $t4, cor_p_vermelho

        # Linha 1 (Y=0) - Coroa (Amarelo)
        sw $t1, 8($a0)
        sw $t1, 12($a0)
        sw $t1, 16($a0)

        # Linha 2 (Y=1) - Cabelo e Rosto
        sw $t1, 516($a0)         # Cabelo
        sw $t1, 520($a0)         # Cabelo
        sw $t2, 524($a0)         # Rosto (Pele)
        sw $t2, 528($a0)         # Rosto (Pele)

        # Linha 3 (Y=2) - Cabelo, Olho e Rosto
        sw $t1, 1028($a0)        # Cabelo
        sw $t2, 1032($a0)        # Rosto
        sw $t3, 1036($a0)        # Olho (Preto)
        sw $t2, 1040($a0)        # Rosto

        # Linha 4 (Y=3) - Cabelo longo caindo e Pescoço
        sw $t1, 1536($a0)        # Cabelo
        sw $t1, 1540($a0)        # Cabelo
        sw $t1, 1544($a0)        # Cabelo
        sw $t2, 1548($a0)        # Pescoço (Pele)

        # Linha 5 (Y=4) - Topo do Vestido
        sw $t0, 2056($a0)        # Rosa
        sw $t0, 2060($a0)        # Rosa
        sw $t0, 2064($a0)        # Rosa

        # Linha 6 (Y=5) - Braços e Vestido
        sw $t2, 2564($a0)        # Mão Esquerda
        sw $t0, 2568($a0)        # Vestido
        sw $t0, 2572($a0)        # Vestido
        sw $t0, 2576($a0)        # Vestido
        sw $t2, 2580($a0)        # Mão Direita

        # Linha 7 (Y=6) - Vestido abrindo
        sw $t0, 3076($a0)
        sw $t0, 3080($a0)
        sw $t0, 3084($a0)
        sw $t0, 3088($a0)
        sw $t0, 3092($a0)

        # Linha 8 (Y=7) - Base larga do Vestido
        sw $t0, 3584($a0)
        sw $t0, 3588($a0)
        sw $t0, 3592($a0)
        sw $t0, 3596($a0)
        sw $t0, 3600($a0)
        sw $t0, 3604($a0)
        sw $t0, 3608($a0)

        # Linha 9 (Y=8) - Final do Vestido
        sw $t0, 4096($a0)
        sw $t0, 4100($a0)
        sw $t0, 4104($a0)
        sw $t0, 4108($a0)
        sw $t0, 4112($a0)
        sw $t0, 4116($a0)
        sw $t0, 4120($a0)

        # Linha 10 (Y=9) - Sapatos vermelhos tocando o chão (Y=10)
        sw $t4, 4616($a0)        # Sapato Esquerdo
        sw $t4, 4624($a0)        # Sapato Direito

        jr $31