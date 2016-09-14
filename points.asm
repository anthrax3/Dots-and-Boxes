        ORG 32768
        BITS 16
        %include "mikedev.inc"


        call get_points_from_user
        call set_pallete
        call render_points
        call select_point
        jmp $


        %INCLUDE "get points from user.asm"
        %INCLUDE "set pallete.asm"
        %INCLUDE "render points.asm"
        %INCLUDE "select point.asm"
        %INCLUDE "select line direction.asm"
