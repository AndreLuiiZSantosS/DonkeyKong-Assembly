.data
        # ==================================================
        # 1. PALETA DE CORES (BARRIS)
        # ==================================================
        cor_b_arco:      .word 0x000000aa      # Azul escuro (Arcos de metal)
        cor_b_borda:     .word 0x00ff8c00      # Laranja escuro (Borda da madeira)
        cor_b_centro:    .word 0x008b4513      # Marrom (Centro da madeira)

.text
main:
        # ==================================================
        # 2. CHAMANDO OS 3 BARRIS (EMPILHADOS)
        # ==================================================
        
        # Barril 1 (Topo) -> Y=8, X=4
        lui $a0, 0x1001
        addi $a0, $a0, 4112
        jal draw_barril

        # Barril 2 (Meio) -> Y=13, X=4
        lui $a0, 0x1001
        addi $a0, $a0, 6672
        jal draw_barril

        # Barril 3 (Base) -> Y=18, X=4
        lui $a0, 0x1001
        addi $a0, $a0, 9232
        jal draw_barril

        # ==================================================
        # 3. ENCERRAMENTO (OBRIGATÓRIO AQUI)
        # ==================================================
        li $v0, 10
        syscall

        # ==================================================
        # 4. SUB-ROTINA: BARRIL ESTÁTICO (7x5 Pixels)
        # ==================================================
draw_barril:
        lw $t0, cor_b_arco
        lw $t1, cor_b_borda
        lw $t2, cor_b_centro

        # Linha 1 (Y=0) - Arco de metal superior
        sw $t0, 4($a0)
        sw $t0, 8($a0)
        sw $t0, 12($a0)
        sw $t0, 16($a0)
        sw $t0, 20($a0)

        # Linha 2 (Y=1) - Madeira
        sw $t1, 512($a0)         # Borda Esquerda
        sw $t2, 516($a0)         # Centro
        sw $t2, 520($a0)         # Centro
        sw $t2, 524($a0)         # Centro
        sw $t2, 528($a0)         # Centro
        sw $t2, 532($a0)         # Centro
        sw $t1, 536($a0)         # Borda Direita

        # Linha 3 (Y=2) - Madeira
        sw $t1, 1024($a0)
        sw $t2, 1028($a0)
        sw $t2, 1032($a0)
        sw $t2, 1036($a0)
        sw $t2, 1040($a0)
        sw $t2, 1044($a0)
        sw $t1, 1048($a0)

        # Linha 4 (Y=3) - Madeira
        sw $t1, 1536($a0)
        sw $t2, 1540($a0)
        sw $t2, 1544($a0)
        sw $t2, 1548($a0)
        sw $t2, 1552($a0)
        sw $t2, 1556($a0)
        sw $t1, 1560($a0)

        # Linha 5 (Y=4) - Arco de metal inferior
        sw $t0, 2052($a0)
        sw $t0, 2056($a0)
        sw $t0, 2060($a0)
        sw $t0, 2064($a0)
        sw $t0, 2068($a0)

        jr $31