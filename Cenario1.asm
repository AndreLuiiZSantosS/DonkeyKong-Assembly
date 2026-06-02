.text
main:
        # ==================================================
        # 1. CÉU NOTURNO (Degradê)
        # ==================================================
        # Faixa 1 (Y=0 a 20)
        li $a0, 0
        li $a1, 0
        li $a2, 128
        li $a3, 21
        li $t4, 0x0008081a       # Cor carregada direto, sem usar a RAM
        jal draw_rect

        # Faixa 2 (Y=21 a 40)
        li $a0, 0
        li $a1, 21
        li $a2, 128
        li $a3, 20
        li $t4, 0x000d0d2b
        jal draw_rect

        # Faixa 3 (Y=41 a 63)
        li $a0, 0
        li $a1, 41
        li $a2, 128
        li $a3, 23
        li $t4, 0x0012123d
        jal draw_rect

        # ==================================================
        # 2. ESTRELAS E LUA CHEIA
        # ==================================================
        li $t4, 0x00ffffff
        li $a0, 5
        li $a1, 5
        jal draw_pixel
        li $a0, 18
        li $a1, 12
        jal draw_pixel
        li $a0, 30
        li $a1, 4
        jal draw_pixel
        li $a0, 45
        li $a1, 15
        jal draw_pixel
        li $a0, 80
        li $a1, 6
        jal draw_pixel
        li $a0, 95
        li $a1, 18
        jal draw_pixel
        li $a0, 115
        li $a1, 8
        jal draw_pixel

        # Lua
        li $t4, 0x00fcfcda
        li $a0, 99
        li $a1, 4
        li $a2, 5
        li $a3, 1
        jal draw_rect
        li $a0, 98
        li $a1, 5
        li $a2, 7
        li $a3, 4
        jal draw_rect
        li $a0, 99
        li $a1, 9
        li $a2, 5
        li $a3, 1
        jal draw_rect

        # ==================================================
        # 3. PRÉDIOS - CAMADA 1 (Fundo Silhuetas)
        # ==================================================
        li $t4, 0x001a1a2e
        li $a0, 10
        li $a1, 20
        li $a2, 20
        li $a3, 44
        jal draw_rect
        
        li $a0, 50
        li $a1, 15
        li $a2, 25
        li $a3, 49
        jal draw_rect
        
        li $a0, 90
        li $a1, 25
        li $a2, 30
        li $a3, 39
        jal draw_rect

        # ==================================================
        # 4. PRÉDIOS - CAMADA 2 (Frente e Detalhes)
        # ==================================================
        # Prédio A
        li $t4, 0x00252542
        li $a0, 2
        li $a1, 30
        li $a2, 20
        li $a3, 34
        jal draw_rect
        
        # Antena Prédio A
        li $t4, 0x00ff3366
        li $a0, 12
        li $a1, 22
        li $a2, 1
        li $a3, 8
        jal draw_rect
        
        # Prédio B
        li $t4, 0x002b2d42
        li $a0, 30
        li $a1, 18
        li $a2, 25
        li $a3, 46
        jal draw_rect
        
        # Topo Prédio B
        li $a0, 35
        li $a1, 15
        li $a2, 15
        li $a3, 3
        jal draw_rect
        
        # Luz aviação
        li $t4, 0x00ff0000
        li $a0, 42
        li $a1, 14
        jal draw_pixel

        # Prédio C
        li $t4, 0x001f2030
        li $a0, 65
        li $a1, 10
        li $a2, 23
        li $a3, 54
        jal draw_rect
        
        # Antena Prédio C
        li $t4, 0x00ffffff
        li $a0, 76
        li $a1, 2
        li $a2, 1
        li $a3, 8
        jal draw_rect

        # Prédio D
        li $t4, 0x00302b3a
        li $a0, 98
        li $a1, 35
        li $a2, 27
        li $a3, 29
        jal draw_rect

        # ==================================================
        # 5. JANELAS E NEONS
        # ==================================================
        # Janelas A
        li $s0, 34
loop_winA_y:
        li $s1, 6
loop_winA_x:
        move $a0, $s1
        move $a1, $s0
        li $a2, 2
        li $a3, 1
        li $t4, 0x00ffcc00
        jal draw_rect
        addi $s1, $s1, 4
        ble $s1, 17, loop_winA_x
        addi $s0, $s0, 4
        ble $s0, 63, loop_winA_y

        # Janelas C
        li $s0, 14
loop_winC_y:
        li $s1, 72
loop_winC_x:
        move $a0, $s1
        move $a1, $s0
        li $a2, 2
        li $a3, 3
        li $t4, 0x00ff9900
        jal draw_rect
        addi $s1, $s1, 3
        ble $s1, 81, loop_winC_x
        addi $s0, $s0, 6
        ble $s0, 63, loop_winC_y

        # Janelas D
        li $s0, 40
loop_winD_y:
        li $s1, 102
loop_winD_x:
        move $a0, $s1
        move $a1, $s0
        li $a2, 3
        li $a3, 1
        li $t4, 0x00ffffcc
        jal draw_rect
        addi $s1, $s1, 6
        ble $s1, 119, loop_winD_x
        addi $s0, $s0, 5
        ble $s0, 63, loop_winD_y

        # Neon C
        li $s0, 15
loop_neonC:
        li $a0, 67
        move $a1, $s0
        li $a2, 1
        li $a3, 2
        li $t4, 0x0000ffcc
        jal draw_rect
        addi $s0, $s0, 3
        ble $s0, 34, loop_neonC

        # ==================================================
        # Janelas Prédio B (Luzes Ciano com padrão irregular)
        # ==================================================
        li $s0, 22               # Y inicial = 22
loop_winB_y:
        li $s1, 34               # X inicial = 34
loop_winB_x:
        # Lógica para apagar algumas janelas: Se (X + Y) for múltiplo de 5, pula.
        add $t0, $s1, $s0        # $t0 = X + Y
        li $t1, 5
        div $t0, $t1             # Divide (X+Y) por 5
        mfhi $t2                 # Pega o resto da divisão (Resto no $t2)
        beqz $t2, skip_winB      # Se o resto for 0, a luz tá apagada (pula o desenho)
        
        move $a0, $s1
        move $a1, $s0
        li $t4, 0x0088ccff       # Cor Ciano (Luz de escritório)
        jal draw_pixel           # Usa draw_pixel porque é só 1 bloco lógico (4x4)
        
skip_winB:
        addi $s1, $s1, 2         # Avança o X (pula 1 bloco escuro entre as janelas)
        ble $s1, 50, loop_winB_x
        
        addi $s0, $s0, 3         # Avança o Y (pula 2 blocos entre os andares)
        ble $s0, 63, loop_winB_y

        # ==================================================
        # 6. PLATAFORMAS VERMELHAS
        # ==================================================
        # 1o Andar
        li $a0, 0
        li $a1, 62
        li $a2, 128
        li $a3, 2
        li $t4, 0x00ff0000
        jal draw_rect
        
        # 2o Andar
        li $a0, 0
        li $a1, 48
        li $a2, 103
        li $a3, 2
        li $t4, 0x00ff0000
        jal draw_rect
        
        # 3o Andar
        li $a0, 25
        li $a1, 36
        li $a2, 103
        li $a3, 2
        li $t4, 0x00ff0000
        jal draw_rect
        
        # 4o Andar
        li $a0, 0
        li $a1, 23
        li $a2, 103
        li $a3, 2
        li $t4, 0x00ff0000
        jal draw_rect
        
        # 5o Andar
        li $a0, 25
        li $a1, 10
        li $a2, 103
        li $a3, 2
        li $t4, 0x00ff0000
        jal draw_rect

        # ==================================================
        # ENCERRAMENTO
        # ==================================================
        li $v0, 10
        syscall

# =====================================================================
# SUB-ROTINAS DE DESENHO
# =====================================================================
draw_rect:
        move $t5, $a1
        move $t8, $a3
rect_y_loop:
        move $t6, $a0
        move $t7, $a2
rect_x_loop:
        lui $t9, 0x1001
        sll $t0, $t5, 9
        add $t9, $t9, $t0
        sll $t0, $t6, 2
        add $t9, $t9, $t0
        sw $t4, 0($t9)
        addi $t6, $t6, 1
        addi $t7, $t7, -1
        bgtz $t7, rect_x_loop
        addi $t5, $t5, 1
        addi $t8, $t8, -1
        bgtz $t8, rect_y_loop
        jr $31

draw_pixel:
        lui $t9, 0x1001
        sll $t0, $a1, 9
        add $t9, $t9, $t0
        sll $t0, $a0, 2
        add $t9, $t9, $t0
        sw $t4, 0($t9)
        jr $31
