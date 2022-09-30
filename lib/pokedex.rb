require_relative '../config/environment'

    #CLEAR = "\e[H\e[2J"

    def start(username="")
        if username == ""
            logged_in = false
        else
            logged_in = true
        end

        retrieve_pokemon()
    end

    def retrieve_pokemon(region="all")
        case region
            when "all"
                start = 0
                limit = 1000
            when "kanto"
                start = 0
                limit = 150
            when "johto"
                start = 151
                limit = 251
            when "Hoenn"
                start = 252
                limit = 386
            when "Sinnoh"
                start = 387
                limit = 493
            when "Unova"
                start = 494
                limit = 649
            when "Kalos"
                start = 650
                limit = 721
            when "Alola"
                start = 722
                limit = 809
            when "Galar"
                start = 810
                limit = 905
        end
        #fix limit numbers and URI

        #pokemon?limit=151&offset=0/0
        url = "https://pokeapi.co/pi/v2/pokemon?limit="
        url << limit.to_s
        url << "&offset=0/"
        url << start.to_s

        data = Net::HTTP.get(URI(url))
        JSON.parse(data)
    end