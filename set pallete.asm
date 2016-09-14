set_pallete:
        mov ah, 0
        mov al, 13h
        int 10h


        mov dx, 3c8h
        mov al, 0
        out dx, al


        inc dx


        mov ax, 0


        out dx, ax
        out dx, ax
        out dx, ax


        dec dx
        inc al
        out dx, al


        inc dx


        mov ax, 63


        out dx, ax
        out dx, ax
        out dx, ax


        ret
