render_points:
        xor ax, ax					; Erase AX register
        mov byte al, [horizontal_current_option]	; Put number of colums in AX
        dec ax						; Decrease AX, because we wanna know how much spaces are between them


        mov bx, 5					; We want 4 pixels between two dots
        mul bl						; Get total width
        mov bx, ax					; Put width in BX, we will use AX
        mov ax, 159					; 
        sub ax, bx					;


        push ax						; Put it in the stack. We are gonna use it later


        xor ax, ax					; Clear AX
        mov byte al, [vertical_current_option]		; Put number of lines in AX
        dec ax						; We want the number of spaces in between


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
