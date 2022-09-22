require_relative '../config/environment'

CLEAR = "\e[H\e[2J"

if TTY::Prompt.new().yes?("Would you like to start the program?")
    print CLEAR

=begin
    box = TTY::Box.frame(
        width: 167, height: 40,
        border: :thick, padding: 1,
        align: :center,
        title: {top_left: "Terminal Pokédex", bottom_right: "CC-29"}) do
        "Test Message that should appear on screen within the box"
    end
=end

    prompt = TTY::Prompt.new()

    guest_menu_options = {
        "Login" => "login",
        "Create an account" => "create_account",
        "Pokédex" => "dex",
        "Rivals" => "rivals",
        "Close Program" => "close_program"  
    }

    selected_option = prompt.select("Please select an option", guest_menu_options, marker: ">>", required: true, filter: true)

    case selected_option
        when "login"
            puts "Logging in"
        when "create_account"
            puts "Creating an account"
        when "dex"
            puts "Opening Pokédex"
        when "rivals"
            puts "Searching for Rvials"
        when "close_program"
            quit_program
        else
            puts "You have managed to select an invalid option, closing program"
    end
else
    print CLEAR
    abort
end

#puts box