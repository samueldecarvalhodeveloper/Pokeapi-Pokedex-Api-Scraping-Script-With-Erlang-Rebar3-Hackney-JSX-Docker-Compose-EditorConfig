-module(json_parser_component_test).

-include_lib("eunit/include/eunit.hrl").

-include("src/constants/domains/pokemon_constants.hrl").

component_handling_data_input_and_output_scenario_test() ->
    PokemonUrl = string:concat(?POKEMON_DATA_URL, ?BULBASAUR_ID),

    NotParsedJsonOfPokemonData = http_client:get_request_response_body(PokemonUrl),

    ParsedJson = json_parser:get_parsed_json(NotParsedJsonOfPokemonData),

    ?assertEqual(?BULBASAUR_ID, lists:flatten(io_lib:format("~p",[maps:get(?POKEMON_DATA_MAP_ID_KEY, ParsedJson)]))),
    ?assertEqual(?BULBASAUR_NAME, binary_to_list(maps:get(?POKEMON_DATA_MAP_NAME_KEY, ParsedJson))).
