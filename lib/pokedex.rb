require_relative '../config/environment'

class Pokedex
    attr_reader :pokedex
    attr_reader :lower_limit
    attr_reader :upper_limit

    def initialize(username="", region="kanto")
        if username == ""
            logged_in = false
        else
            logged_in = true
        end

        @region = region
        set_limits(@region)
    end

    def set_limits(region)
        @lower_limit = 0
        @upper_limit = 0

        if region == "kanto"
            @lower_limit = 1
            @upper_limit = 151
        elsif region == "johto"
            @lower_limit = 152
            @upper_limit = 251
        elsif region == "hoenn"
            @lower_limit = 252
            @upper_limit = 386
        elsif region == "sinnoh"
            @lower_limit = 387
            @upper_limit = 493
        elsif region == "unova"
            @lower_limit = 494
            @upper_limit = 649
        elsif region == "kalos"
            @lower_limit = 650
            @upper_limit = 721
        elsif region == "alola"
            @lower_limit = 722
            @upper_limit = 809
        elsif region == "galar"
            @lower_limit = 810
            @upper_limit = 905
        else
            @lower_limit = 1
            @upper_limit = 905
        end
    end

    def get_pokemon(id)
        entry = PokeApi.get(pokemon: id)

        if entry.types.length() == 2
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
            stats: [
                {
                    base_stat: entry.stats[0].base_stat,
                    stat: {
                        name: entry.stats[0].stat.name.upcase
                    }
                },
                {
                    base_stat: entry.stats[1].base_stat,
                    stat: {
                        name: entry.stats[1].stat.name.capitalize
                    }
                },
                {
                    base_stat: entry.stats[2].base_stat,
                    stat: {
                        name: entry.stats[2].stat.name.capitalize
                    }
                },
                {
                    base_stat: entry.stats[3].base_stat,
                    stat: {
                        name: entry.stats[3].stat.name.capitalize
                    }
                },
                {
                    base_stat: entry.stats[4].base_stat,
                    stat: {
                        name: entry.stats[4].stat.name.capitalize
                    }
                },
                {
                    base_stat: entry.stats[5].base_stat,
                    stat: {
                        name: entry.stats[5].stat.name.capitalize
                    }
                }
            ],
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

    def retrieve_pokemon()
        @pokedex = []
        for id in @lower_limit..@upper_limit
            @pokedex.push(get_pokemon(id))
        end
    end
end