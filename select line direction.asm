select_line_direction:
        call os_wait_for_key
        cmp ah, KEY_RIGHT
        je select_direction_right
        cmp ah, KEY_UP
        je select_direction_up
        cmp ah, KEY_LEFT
        je select_direction_left
        cmp ah, KEY_DOWN
        je select_direction_down
        jmp select_line_direction


select_direction_right:
        mov ax, 2000h
        mov es, ax


        xor ax, ax
        xor bx, bx


        mov byte al, [current_point_collum]
        cmp byte al, [horizontal_current_option]
        jae select_line_direction


        mov byte bl, [horizontal_current_option]
        dec bl
        mov byte al, [current_point_line]
        mul bl


        mov byte bl, [current_point_collum]
        add ax, bx


        mov bx, 8
        div bl


        rotate_loop_right:
                mov bx, 1
                right_loop_it_now:
                        cmp ah, 0
                        je right_loop_finished
                        rol bl
                        dec ah
                        jmp right_loop_it_now


        right_loop_finished:
        mov di, horizontal_lines
        add di, ax
        or byte [es:di], bl


select_direction_left:
        mov ax, 2000h
        mov es, ax


        xor ax, ax
        xor bx, bx


        mov byte al, [current_point_collum]
        cmp byte al, 0
        je select_line_direction


        mov byte bl, [horizontal_current_option]
        dec bl
        mov byte al, [current_point_line]
        mul bl


        mov byte bl, [current_point_collum]
        add ax, bx
        dec ax


        mov bx, 8
        div bl


        rotate_loop_right:
                mov bx, 1
                right_loop_it_now:
                        cmp ah, 0
                        je right_loop_finished
                        rol bl
                        dec ah
                        jmp right_loop_it_now


        right_loop_finished:
        mov di, horizontal_lines
        add di, ax
        or byte [es:di], bl


select_direction_up:
select_direction_down:
selected_line_direction:


vertical_lines                  times 50 db 0
horizontal_lines                times 50 db 0
