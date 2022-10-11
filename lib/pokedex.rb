require_relative '../config/environment'

class Pokedex
    attr_reader :pokedex
    attr_reader :lower_limit
    attr_reader :upper_limit

    def initialize(username="", region="kanto")
        logged_in = username != ""

        @region = region
        set_limits(@region)
    end

    def set_limits(region)
        case region
        when "kanto"
            @lower_limit = 1
            @upper_limit = 151
        when "johto"
            @lower_limit = 152
            @upper_limit = 251
        when "hoenn"
            @lower_limit = 252
            @upper_limit = 386
        when "sinnoh"
            @lower_limit = 387
            @upper_limit = 493
        when "unova"
            @lower_limit = 494
            @upper_limit = 649
        when "kalos"
            @lower_limit = 650
            @upper_limit = 721
        when "alola"
            @lower_limit = 722
            @upper_limit = 809
        when "galar"
            @lower_limit = 810
            @upper_limit = 905
        else
            @lower_limit = 1
            @upper_limit = 905
        end
    end

    def get_pokemon(id)
        entry = PokeApi.get(pokemon: id)

        if entry.types.length == 2
            second_type = {
                slot: 2,
                type: {
                    name: entry.types[1].type.name.capitalize
                }
            }
        else
            second_type = {
                slot: 2,
                type: {
                    name: "N/A"
                }
            }
        end

        pokemon = {
            id: entry.id,
            name: entry.name.capitalize,
            stats: entry.stats.map do |specific_stat|
                {
                    base_stat: specific_stat.base_stat,
                    stat: {
                       name: specific_stat.stat.name.capitalize
                    }
                }
            end,
            types: [
                {
                    slot: 1,
                    type: {
                        name: entry.types[0].type.name.capitalize
                    }
                },
                second_type
            ],
            weight: entry.weight
        }

    end

    def retrieve_pokemon
        @pokedex = []
        for id in @lower_limit..@upper_limit
            @pokedex.push(get_pokemon(id))
        end
    end
end