require_relative '../config/environment'

    #CLEAR = "\e[H\e[2J"

class Pokedex
    attr_reader :pokedex

    def start(username="")
        if username == ""
            logged_in = false
        else
            logged_in = true
        end

        retrieve_pokemon()
    end

    def retrieve_pokemon(region="kanto")
        pokedex = {}

        for id in 1..151
            pokedex[id] = PokeApi.get(pokemon: id)
        end
    end
end

poke = Pokedex.new
poke.retrieve_pokemon