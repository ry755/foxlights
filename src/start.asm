    opton

    call Main
    call end_current_task

GetNextWindowEvent:
    push r8
    call get_next_window_event
    mov r8, eventArgs
    mov [r8], r0
    add r8, 4
    mov [r8], r1
    add r8, 4
    mov [r8], r2
    add r8, 4
    mov [r8], r3
    add r8, 4
    mov [r8], r4
    add r8, 4
    mov [r8], r5
    add r8, 4
    mov [r8], r6
    add r8, 4
    mov [r8], r7
    pop r8
    ret

brk:
    brk
    ret

PortIn:
    in r0, r0
    ret

eventArgs: data.fill 0, 32

menuItemsRoot:
    data.8 1                                                  ; number of menus
    data.32 menu_items_game_list data.32 menu_items_game_name ; pointer to menu list, pointer to menu name
menu_items_game_name:
    data.8 4 data.strz "Game" ; text length, text, null-terminator
menu_items_game_list:
    data.8 1                      ; number of items
    data.8 7                      ; menu width (usually longest item + 2)
    data.8 8 data.strz "New Game" ; text length, text, null-terminator

    #include "../../fox32rom/fox32rom.def"
    #include "../../fox32os/fox32os.def"
