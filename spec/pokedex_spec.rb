require_relative './spec_helper.rb'
require_relative '../lib/pokedex.rb'
require 'net/http'
require 'poke-api-v2'

def expected_data_format
    pokemon1 = {
        id: 1,
        name: "Bulbasaur",
        stats: [
            {
                base_stat: 45,
                stat: {
                    name: "HP"
                }
            },
            {
                base_stat: 49,
                stat: {
                    name: "Attack"
                }
            },
            {
                base_stat: 49,
                stat: {
                    name: "Defense"
                }
            },
            {
                base_stat: 65,
                stat: {
                    name: "Special-Attack"
                }
            },
            {
                base_stat: 65,
                stat: {
                    name: "Special-Defense"
                }
            },
            {
                base_stat: 45,
                stat: {
                    name: "Speed"
                }
            }
        ],
        types: [
            {
                slot: 1,
                type: {
                    name: "Grass"
                }
            },
            {
                slot: 2,
                type: {
                    name: "Poison"
                }
            }
        ],
        weight: 69
    }
    
    pokemon2 = {
        id: 4,
        name: "Charmander",
        stats: [
            {
                base_stat: 39,
                stat: {
                    name: "HP"
                }
            },
            {
                base_stat: 52,
                stat: {
                    name: "Attack"
                }
            },
            {
                base_stat: 43,
                stat: {
                    name: "Defense"
                }
            },
            {
                base_stat: 60,
                stat: {
                    name: "Special-Attack"
                }
            },
            {
                base_stat: 50,
                stat: {
                    name: "Special-Defense"
                }
            },
            {
                base_stat: 65,
                stat: {
                    name: "Speed"
                }
            }
        ],
        types: [
            {
                slot: 1,
                type: {
                    name: "Fire"
                }
            },
            {
                slot: 2,
                type: {
                    name: "N/A"
                }
            }
        ],
        weight: 85
    }

    [pokemon1, pokemon2]
  end

describe 'Pokedex' do
  context 'The correct regions are selected based on the methods parameter' do

      it 'sets lower_limit to 1 and upper_limit to 151 when the region is kanto' do
          testdex = Pokedex.new("", "kanto")

          expect(testdex.lower_limit).to eq(1)
          expect(testdex.upper_limit).to eq(151)
      end

      it 'sets lower_limit to 152 and upper_limit to 252 when the region is johto' do
          testdex = Pokedex.new("", "johto")

          expect(testdex.lower_limit).to eq(152)
          expect(testdex.upper_limit).to eq(251)
      end
  end

  context 'The data retrieved from the API has been reformated correctly' do
    let(:one_type_pokemon) {
      one_type_pokemon = {
        "base_experience": 62,
        "forms": [
        {
            "name": "charmander",
            "url": "https://pokeapi.co/api/v2/pokemon-form/4/"
        }
        ],
        "height": 6,
        "held_items": [],
        "id": 4,
        "is_default": true,
        "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/4/encounters",
        "name": "charmander",
        "order": 5,
        "past_types": [],
        "species": {
        "name": "charmander",
        "url": "https://pokeapi.co/api/v2/pokemon-species/4/"
        },
        "stats": [
        {
            "base_stat": 39,
            "effort": 0,
            "stat": {
            "name": "hp",
            "url": "https://pokeapi.co/api/v2/stat/1/"
            }
        },
        {
            "base_stat": 52,
            "effort": 0,
            "stat": {
            "name": "attack",
            "url": "https://pokeapi.co/api/v2/stat/2/"
            }
        },
        {
            "base_stat": 43,
            "effort": 0,
            "stat": {
            "name": "defense",
            "url": "https://pokeapi.co/api/v2/stat/3/"
            }
        },
        {
            "base_stat": 60,
            "effort": 0,
            "stat": {
            "name": "special-attack",
            "url": "https://pokeapi.co/api/v2/stat/4/"
            }
        },
        {
            "base_stat": 50,
            "effort": 0,
            "stat": {
            "name": "special-defense",
            "url": "https://pokeapi.co/api/v2/stat/5/"
            }
        },
        {
            "base_stat": 65,
            "effort": 1,
            "stat": {
            "name": "speed",
            "url": "https://pokeapi.co/api/v2/stat/6/"
            }
        }
        ],
        "types": [
        {
            "slot": 1,
            "type": {
            "name": "fire",
            "url": "https://pokeapi.co/api/v2/type/10/"
            }
        }
        ],
        "weight": 85
      }.to_json
    }

    let(:two_type_pokemon) {
      two_type_pokemon = {
        "abilities": [
          {
            "ability": {
              "name": "overgrow",
              "url": "https://pokeapi.co/api/v2/ability/65/"
            },
            "is_hidden": false,
            "slot": 1
          },
          {
            "ability": {
              "name": "chlorophyll",
              "url": "https://pokeapi.co/api/v2/ability/34/"
            },
            "is_hidden": true,
            "slot": 3
          }
        ],
        "base_experience": 64,
        "height": 7,
        "held_items": [],
        "id": 1,
        "is_default": true,
        "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters",
        "name": "bulbasaur",
        "order": 1,
        "past_types": [],
        "species": {
          "name": "bulbasaur",
          "url": "https://pokeapi.co/api/v2/pokemon-species/1/"
        },
        "stats": [
          {
            "base_stat": 45,
            "effort": 0,
            "stat": {
              "name": "hp",
              "url": "https://pokeapi.co/api/v2/stat/1/"
            }
          },
          {
            "base_stat": 49,
            "effort": 0,
            "stat": {
              "name": "attack",
              "url": "https://pokeapi.co/api/v2/stat/2/"
            }
          },
          {
            "base_stat": 49,
            "effort": 0,
            "stat": {
              "name": "defense",
              "url": "https://pokeapi.co/api/v2/stat/3/"
            }
          },
          {
            "base_stat": 65,
            "effort": 1,
            "stat": {
              "name": "special-attack",
              "url": "https://pokeapi.co/api/v2/stat/4/"
            }
          },
          {
            "base_stat": 65,
            "effort": 0,
            "stat": {
              "name": "special-defense",
              "url": "https://pokeapi.co/api/v2/stat/5/"
            }
          },
          {
            "base_stat": 45,
            "effort": 0,
            "stat": {
              "name": "speed",
              "url": "https://pokeapi.co/api/v2/stat/6/"
            }
          }
        ],
        "types": [
          {
            "slot": 1,
            "type": {
              "name": "grass",
              "url": "https://pokeapi.co/api/v2/type/12/"
            }
          },
          {
            "slot": 2,
            "type": {
              "name": "poison",
              "url": "https://pokeapi.co/api/v2/type/4/"
            }
          }
        ],
        "weight": 69
        }.to_json
    }

      expected_data = expected_data_format

      it 'Successfully places N/A when the pokemon does not have a second type' do
        allow(Net::HTTP).to receive(:get).and_return(one_type_pokemon)
        testdex = Pokedex.new("", "kanto").get_pokemon(1)

        expect(testdex[:types][1][:type][:name]).to eq(expected_data[1][:types][1][:type][:name])
      end

      it 'Successfully formats when the pokemon does have a second type' do
        allow(Net::HTTP).to receive(:get).and_return(two_type_pokemon)
        testdex = Pokedex.new("", "kanto").get_pokemon(1)

        expect(testdex[:types][1][:type][:name]).to eq(expected_data[0][:types][1][:type][:name])
      end
  end
end
