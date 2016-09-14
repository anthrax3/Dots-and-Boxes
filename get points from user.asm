get_points_from_user:
        call os_hide_cursor


        call print_static_characters


show_option_choose:
        xor ax, ax
        mov byte al, [horizontal_current_option]
        add al, 3


        call show_current_option_indicator_horizontal


get_points_loop:
        call os_wait_for_key
        cmp ah, KEY_UP
        je option_up
        cmp ah, KEY_DOWN
        je option_down
        cmp al, KEY_ENTER
        je option_horizontal_chosen
        cmp al, KEY_ESC
        je 0
        jmp get_points_loop


print_static_characters:
        mov ax, game_title
        mov bx, game_owner
        mov cx, 1Fh
        call os_draw_background


        mov dh, 1
        mov dl, 28
        call os_move_cursor


        mov si, select
        call os_print_string


        mov dh, 3
        mov dl, 14
        call os_move_cursor


        mov si, horizontal
        call os_print_string


        mov dh, 3
        mov dl, 56
        call os_move_cursor


        mov si, vertical
        call os_print_string


        mov dh, 5
        mov dl, 18
        call os_move_cursor


        mov si, two
        call os_print_string


        mov dh, 6
        mov dl, 18
        call os_move_cursor


        mov si, three
        call os_print_string


        mov dh, 7
        mov dl, 18
        call os_move_cursor


        mov si, four
        call os_print_string


        mov dh, 8
        mov dl, 18
        call os_move_cursor


        mov si, five
        call os_print_string


        mov dh, 9
        mov dl, 18
        call os_move_cursor


        mov si, six
        call os_print_string


        mov dh, 10
        mov dl, 18
        call os_move_cursor


        mov si, seven
        call os_print_string


        mov dh, 11
        mov dl, 18
        call os_move_cursor


        mov si, eight
        call os_print_string


        mov dh, 12
        mov dl, 18
        call os_move_cursor


        mov si, nine
        call os_print_string


        mov dh, 13
        mov dl, 18
        call os_move_cursor


        mov si, ten
        call os_print_string


        mov dh, 14
        mov dl, 18
        call os_move_cursor


        mov si, eleven
        call os_print_string


        mov dh, 15
        mov dl, 18
        call os_move_cursor


        mov si, twelve
        call os_print_string


        mov dh, 16
        mov dl, 18
        call os_move_cursor


        mov si, thirteen
        call os_print_string


        mov dh, 17
        mov dl, 18
        call os_move_cursor


        mov si, fourteen
        call os_print_string


        mov dh, 18
        mov dl, 18
        call os_move_cursor


        mov si, fifteen
        call os_print_string


        mov dh, 19
        mov dl, 18
        call os_move_cursor


        mov si, sixteen
        call os_print_string


        mov dh, 20
        mov dl, 18
        call os_move_cursor


        mov si, seventeen
        call os_print_string


        mov dh, 21
        mov dl, 18
        call os_move_cursor


        mov si, eighteen
        call os_print_string


        mov dh, 22
        mov dl, 18
        call os_move_cursor


        mov si, nineteen
        call os_print_string


        mov dh, 23
        mov dl, 18
        call os_move_cursor


        mov si, twenty
        call os_print_string


        mov dh, 5
        mov dl, 59
        call os_move_cursor


        mov si, two
        call os_print_string


        mov dh, 6
        mov dl, 59
        call os_move_cursor


        mov si, three
        call os_print_string


        mov dh, 7
        mov dl, 59
        call os_move_cursor


        mov si, four
        call os_print_string


        mov dh, 8
        mov dl, 59
        call os_move_cursor


        mov si, five
        call os_print_string


        mov dh, 9
        mov dl, 59
        call os_move_cursor


        mov si, six
        call os_print_string


        mov dh, 10
        mov dl, 59
        call os_move_cursor


        mov si, seven
        call os_print_string


        mov dh, 11
        mov dl, 59
        call os_move_cursor


        mov si, eight
        call os_print_string


        mov dh, 12
        mov dl, 59
        call os_move_cursor


        mov si, nine
        call os_print_string


        mov dh, 13
        mov dl, 59
        call os_move_cursor


        mov si, ten
        call os_print_string


        mov dh, 14
        mov dl, 59
        call os_move_cursor


        mov si, eleven
        call os_print_string


        mov dh, 15
        mov dl, 59
        call os_move_cursor


        mov si, twelve
        call os_print_string


        mov dh, 16
        mov dl, 59
        call os_move_cursor


        mov si, thirteen
        call os_print_string


        mov dh, 17
        mov dl, 59
        call os_move_cursor


        mov si, fourteen
        call os_print_string


        mov dh, 18
        mov dl, 59
        call os_move_cursor


        mov si, fifteen
        call os_print_string


        mov dh, 19
        mov dl, 59
        call os_move_cursor


        mov si, sixteen
        call os_print_string


        mov dh, 20
        mov dl, 59
        call os_move_cursor


        mov si, seventeen
        call os_print_string


        mov dh, 21
        mov dl, 59
        call os_move_cursor


        mov si, eighteen
        call os_print_string


        mov dh, 22
        mov dl, 59
        call os_move_cursor


        mov si, nineteen
        call os_print_string


        mov dh, 23
        mov dl, 59
        call os_move_cursor


        mov si, twenty
        call os_print_string


        ret


option_up:
        xor ax, ax
        mov byte al, [horizontal_current_option]
        cmp al, 2
        jbe get_points_loop


        push ax
        call os_clear_screen
        call print_static_characters
        pop ax


        add al, 2
        call show_current_option_indicator_horizontal


        sub al, 3
        mov byte [horizontal_current_option], al
        jmp get_points_loop


option_down:
        xor ax, ax
        mov byte al, [horizontal_current_option]
        cmp al, 20
        jae get_points_loop


        pusha
        call os_clear_screen
        call print_static_characters
        popa


        add al, 4
        call show_current_option_indicator_horizontal


        sub al, 3
        mov byte [horizontal_current_option], al
        jmp get_points_loop


; Current option + 3 must be in AX
show_current_option_indicator_horizontal:
        xor dx, dx
        mov dh, al
        mov dl, 17
        call os_move_cursor


        mov si, chevronleft
        call os_print_string


        xor dx, dx
        mov dh, al
        mov dl, 20
        call os_move_cursor


        mov si, chevronright
        call os_print_string


        ret


option_horizontal_chosen:
        xor ax, ax
        mov byte al, [vertical_current_option]
        add al, 3
        call show_current_option_indicator_vertical


vertical_loop:
        call os_wait_for_key
        cmp ah, KEY_UP
        je option_up_vertical
        cmp ah, KEY_DOWN
        je option_down_vertical
        cmp al, KEY_ENTER
        je options_chosen
        cmp al, KEY_ESC
        je 0
        jmp option_horizontal_chosen


option_up_vertical:
        xor ax, ax
        mov byte al, [vertical_current_option]
        cmp al, 2
        jbe vertical_loop


        push ax
        call os_clear_screen
        call print_static_characters
        pop ax


        add al, 2
        call show_current_option_indicator_vertical


        sub al, 3
        mov byte [vertical_current_option], al


        mov byte al, [horizontal_current_option]
        add al, 3
        call show_current_option_indicator_horizontal
        jmp vertical_loop



option_down_vertical:
        xor ax, ax
        mov byte al, [vertical_current_option]
        cmp al, 20
        jae vertical_loop


        push ax
        call os_clear_screen
        call print_static_characters
        pop ax


        add al, 4
        call show_current_option_indicator_vertical


        sub al, 3
        mov byte [vertical_current_option], al


        mov byte al, [horizontal_current_option]
        add al, 3
        call show_current_option_indicator_horizontal
        jmp vertical_loop


show_current_option_indicator_vertical:
        xor dx, dx
        mov dh, al
        mov dl, 58
        call os_move_cursor


        mov si, chevronleft
        call os_print_string


        xor dx, dx
        mov dh, al
        mov dl, 61
        call os_move_cursor


        mov si, chevronright
        call os_print_string


        ret


options_chosen:
        ret


; Strings
        game_title                      db ' DOTS AND BOXES', 0
        game_owner                      db ' Developed by Caio', 0
        select                          db 'Select number of points', 0
        horizontal                      db 'Horizontal', 0
        vertical                        db 'Vertical', 0


        two                             db ' 2', 0
        three                           db ' 3', 0
        four                            db ' 4', 0
        five                            db ' 5', 0
        six                             db ' 6', 0
        seven                           db ' 7', 0
        eight                           db ' 8', 0
        nine                            db ' 9', 0
        ten                             db '10', 0
        eleven                          db '11', 0
        twelve                          db '12', 0
        thirteen                        db '13', 0
        fourteen                        db '14', 0
        fifteen                         db '15', 0
        sixteen                         db '16', 0
        seventeen                       db '17', 0
        eighteen                        db '18', 0
        nineteen                        db '19', 0
        twenty                          db '20', 0


        chevronleft                     db '>', 0
        chevronright                    db '<', 0
        space                           db ' ', 0


        horizontal_current_option       db 2
        vertical_current_option         db 2


        upstring                        db 'up', 0
        downstring                      db 'down', 0
