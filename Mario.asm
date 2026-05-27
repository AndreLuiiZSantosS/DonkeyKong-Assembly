.data
        # ==================================================
        # 1. PALETA DE CORES (MARIO)
        # ==================================================
        cor_m_vermelho: .word 0x00ff0000      # Vermelho (Boné / Camisa)
        cor_m_azul:     .word 0x000000ff      # Azul (Macacão)
        cor_m_pele:     .word 0x00ffcc99      # Pele (Rosto)
        cor_m_marrom:   .word 0x008b4513      # Marrom (Cabelo / Botas)
        cor_m_preto:    .word 0x00000000      # Preto (Olho / Bigode)

.text
main:
        # ==================================================
        # 2. INICIALIZAÇÃO DE REGISTRADORES (BOAS PRÁTICAS)
        # ==================================================
        lw $s0, cor_m_vermelho
        lw $s1, cor_m_azul
        lw $s2, cor_m_pele
        lw $s3, cor_m_marrom
        lw $s4, cor_m_preto

        # ==================================================
        # 3. CHAMADA DO DESENHO (SPRITE 6x10)
        # ==================================================
        lui $8, 0x1001
        
        # Novo cálculo: Y=52, X=5
        # (52 * 512) + (5 * 4) = 26624 + 20 = 26644
        # Isso garante que o pixel 10 (pé) encoste exatamente no Y=62 (Viga)
        addi $8, $8, 26644      
        
        jal draw_mario

        # Encerramento seguro do programa
        li $v0, 10
        syscall

        # ==================================================
        # 4. SUB-ROTINA DO MARIO (10 Pixels de Altura)
        # ==================================================
draw_mario:
        # Linha 1 (Y=52): Topo do Boné (Vermelho)
        sw $s0, 4($8)
        sw $s0, 8($8)
        sw $s0, 12($8)
        
        # Linha 2 (Y=53): Aba do Boné (Vermelho)
        sw $s0, 4($8)
        sw $s0, 8($8)
        sw $s0, 12($8)
        sw $s0, 16($8)
        
        # Linha 3 (Y=54): Cabelo, Rosto e Olho
        sw $s3, 1028($8)        # Cabelo (Marrom)
        sw $s2, 1032($8)        # Rosto (Pele)
        sw $s2, 1036($8)        # Rosto (Pele)
        sw $s4, 1040($8)        # Olho (Preto)
        
        # Linha 4 (Y=55): Cabelo, Rosto e Bigode
        sw $s3, 1536($8)        # Cabelo
        sw $s2, 1540($8)        # Rosto
        sw $s2, 1544($8)        # Rosto
        sw $s4, 1548($8)        # Bigode (Preto)
        sw $s4, 1552($8)        # Bigode
        sw $s4, 1556($8)        # Bigode
        
        # Linha 5 (Y=56): Queixo (Pele)
        sw $s2, 2052($8)
        sw $s2, 2056($8)
        sw $s2, 2060($8)
        sw $s2, 2064($8)
        
        # Linha 6 (Y=57): Camisa e Início do Macacão
        sw $s0, 2564($8)        # Camisa (Vermelho)
        sw $s1, 2568($8)        # Macacão (Azul)
        sw $s1, 2572($8)        # Macacão (Azul)
        sw $s0, 2576($8)        # Camisa (Vermelho)
        
        # Linha 7 (Y=58): Braços e Corpo do Macacão
        sw $s0, 3072($8)        # Braço Esquerdo
        sw $s0, 3076($8)        # Braço Esquerdo
        sw $s1, 3080($8)        # Macacão
        sw $s1, 3084($8)        # Macacão
        sw $s0, 3088($8)        # Braço Direito
        sw $s0, 3092($8)        # Braço Direito
        
        # Linha 8 (Y=59): Cintura do Macacão
        sw $s1, 3592($8)        # Azul
        sw $s1, 3596($8)        # Azul
        
        # Linha 9 (Y=60): Pernas (Azul)
        sw $s1, 4100($8)        # Perna Esquerda
        sw $s1, 4112($8)        # Perna Direita
        
        # Linha 10 (Y=61): Botas (Marrom)
        sw $s3, 4608($8)        # Bota Esq
        sw $s3, 4612($8)        # Bota Esq
        sw $s3, 4624($8)        # Bota Dir
        sw $s3, 4628($8)        # Bota Dir
        
        jr $31