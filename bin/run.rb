require_relative '../config/environment'

CLEAR = "\e[H\e[2J"

if TTY::Prompt.new().yes?("Would you like to start the program?")
    print CLEAR

    main_menu = MainMenu.new
    main_menu.print_connection_box
    main_menu.handle_option(main_menu.print_menu_prompt)

else
    print CLEAR
    abort
end
