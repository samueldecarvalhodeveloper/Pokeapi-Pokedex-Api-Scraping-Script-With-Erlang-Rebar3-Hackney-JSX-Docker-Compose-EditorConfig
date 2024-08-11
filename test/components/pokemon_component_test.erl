-module(pokemon_component_test).

-include_lib("eunit/include/eunit.hrl").

-include("src/constants/domains/pokemon_constants.hrl").
-include("src/constants/script_constants.hrl").

component_handling_data_input_and_output_scenario_test() ->
    {timeout,
        ?LARGER_TIMEOUT,
        fun() ->
            ListOfMappedPokemonsData = pokemon_data_access_object:get_list_of_pokemons(),

            ?assertEqual(?INTEGER_OF_BULBASAUR_ID, maps:get(?POKEMON_DATA_MAP_ID_KEY, lists:nth(1 ,ListOfMappedPokemonsData))),
            ?assertEqual(<<?CAPITALIZE_BULBASAUR_NAME>>, maps:get(?POKEMON_DATA_MAP_NAME_KEY, lists:nth(1 ,ListOfMappedPokemonsData))),
            ?assertEqual(<<?GRASS_TYPE>>, lists:nth(1, maps:get(?POKEMON_DATA_MAP_TYPES_KEY, lists:nth(1 ,ListOfMappedPokemonsData)))),
            ?assertEqual(<<?POISON_TYPE>>, lists:nth(2, maps:get(?POKEMON_DATA_MAP_TYPES_KEY, lists:nth(1 ,ListOfMappedPokemonsData)))),

            ListOfAllPokemonsFromTheFirstGenerationImage = pokemon_data_access_object:get_list_of_pokemons_image_blob(),

            ?assertEqual(?FIRST_GENERATION_LAST_POKEMON_ID, length(ListOfAllPokemonsFromTheFirstGenerationImage))
        end
    }.
