select_point:
        call show_current_point_selection


select_point_loop:
        call os_wait_for_key
        cmp ah, KEY_RIGHT
        je select_point_right
        cmp ah, KEY_UP
        je select_point_up
        cmp ah, KEY_LEFT
        je select_point_left
        cmp ah, KEY_DOWN
        je select_point_down
        cmp al, KEY_ENTER
        je select_line_direction
        jmp select_point_loop


show_current_point_selection:
        xor ax, ax
        mov byte al, [current_point_line]
        mov bx, 3200
        mul bx


        push ax


        xor ax, ax
        mov byte al, [current_point_collum]
        mov bx, 10
        mul bl


        pop bx


        add ax, bx
        mov word di, [current_first_point]
        add di, ax


        mov ax, 0A000h
        mov es, ax


        sub di, 321
        mov byte [es:di], 1


        inc di
        mov byte [es:di], 1


        inc di
        mov byte [es:di], 1


        add di, 318
        mov byte [es:di], 1


        add di, 2
        mov byte [es:di], 1


        add di, 318
        mov byte [es:di], 1


        inc di
        mov byte [es:di], 1


        inc di
        mov byte [es:di], 1


        ret


select_point_up:
        cmp byte [current_point_line], 0
        je select_point_loop


        sub byte [current_point_line], 1


        call erase_video_memory
        call render_points
        call show_current_point_selection


        jmp select_point_loop


select_point_down:
        mov byte al, [current_point_line]
        mov byte bl, [vertical_current_option]
        dec bl
        cmp al, bl
        je select_point_loop


        add byte [current_point_line], 1


        call erase_video_memory
        call render_points
        call show_current_point_selection


        jmp select_point_loop


select_point_left:
        cmp byte [current_point_collum], 0
        je select_point_loop


        sub byte [current_point_collum], 1


        call erase_video_memory
        call render_points
        call show_current_point_selection


        jmp select_point_loop


select_point_right:
        mov byte al, [current_point_collum]
        mov byte bl, [horizontal_current_option]
        dec bl
        cmp al, bl
        je select_point_loop


        add byte [current_point_collum], 1


        call erase_video_memory
        call render_points
        call show_current_point_selection


        jmp select_point_loop


erase_video_memory:
        mov ax, 0A000h
        mov es, ax


        mov di, 0
        mov cx, 32000


        mov ax, 0
        rep stosw


        ret


current_point_line                      db 0
current_point_collum                    db 0
