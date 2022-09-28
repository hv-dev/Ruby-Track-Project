
class MainMenu
    attr_reader :connection_string
    attr_reader :ping_check

    def initialize
        begin
            @ping_check = Net::HTTP.get_response(URI('https://pokeapi.co/api/v2/pokemon/1/'))
            puts @ping_check.class
        rescue Exception
        end
            
    
        if ping_check.is_a?(Net::HTTPOK)
            @connection_string = "Connected"
        else
            @connection_string = "Not Connected. Application will not work as expected"
        end
    end

    def print_connection_box
        box = TTY::Box.frame(
            width: 20, height: 6,
            border: :thick, padding: 1,
            align: :center,
            title: {top_left: "Pokédex", bottom_right: "CC-2"}
            ) do
                @connection_string
        end
        puts box
    end

    def print_prompt
        prompt = TTY::Prompt.new()
        menu_options(false)

    
        selected_option = prompt.select("Please select an option", OPTIONS, marker: ">>", required: true, filter: true)
    
        case selected_option
        when "login"
            puts "Logging in"
        when "create_account"
            puts "Creating an account"
        when "dex"
            puts "Opening Pokédex"
            # start()
        when "my_team"
            puts "Viewing your team"
        when "rivals"
            puts "Searching for Rvials"
        when "logout"
            puts "Logging out"
        when "close_program"
            puts "Closing Program. Goodbye"
            abort
        else
            puts "You have managed to select an invalid option, closing program"
            abort
        end
    end

    def menu_options(logged_in => false)
        if logged_in == false
            OPTIONS = {
                "Login" => "login",
                "Create an account" => "create_account",
                "Pokédex" => "dex",
                "Rivals" => "rivals",
                "Close Program" => "close_program"  
            }
        else
            OPTIONS = {
                "Pokédex" => "dex",
                "My Team" => "my_team",
                "Rivals" => "rivals",
                "Logout " => "logout",
                "Close Program" => "close_program"
            }
        end
    end
end
