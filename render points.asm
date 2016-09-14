render_points:
        xor ax, ax
        mov byte al, [horizontal_current_option]
        dec ax


        mov bx, 5
        mul bl
        mov bx, ax
        mov ax, 159
        sub ax, bx


        push ax


        xor ax, ax
        mov byte al, [vertical_current_option]
        dec ax


        mov bx, 5
        mul bl
        mov bx, ax
        mov ax, 99
        sub ax, bx


        mov bx, 320
        mul bx


        pop bx


        add ax, bx
        mov word [current_first_point], ax
        mov di, ax


        mov ax, 0A000h
        mov es, ax


        draw_collums:
        xor cx, cx
        mov byte cl, [vertical_current_option]


        draw_line:
                push cx
                xor cx, cx
                mov byte cl, [horizontal_current_option]


                draw_one_point:
                        mov byte [es:di], 1
                        add di, 10


                        dec cx
                        cmp cx, 0
                        jne draw_one_point


                pop cx


        prepare_for_next_line:
                xor ax, ax
                mov byte al, [horizontal_current_option]
                mov bx, 10
                mul bl
                sub di, ax


                add di, 3200


        dec cx
        cmp cx, 0
        jne draw_line


        ret


; Strings
        current_first_point             dw 0
