require_relative '../config/environment'
require '../lib/pokedex'
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

    begin
        ping_check = Net::HTTP.get_response(URI('https://pokeapi.co/api/v2/pokemon/1/'))
    rescue Exception
    end
        

    if ping_check.is_a?(Net::HTTPSuccess)
        connection_string = "Connected"
    else
        connection_string = "Not Connected. Application will not work as expected"
    end

    box = TTY::Box.frame(
        width: 20, height: 6,
        border: :thick, padding: 1,
        align: :center,
        title: {top_left: "Pokédex", bottom_right: "CC-2"}
        ) do
            connection_string
    end
    puts box

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
            Pokedex.start()
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
