#' riotapi: A package for calling the Riot API
#'
#' The riotapi package is split into the same endpoints as contained
#' in the Riot API itself. Functions are named to to correspond as
#' closely with endpoint names as possible. Not all endpoint parameters
#' are explicitly labelled in function declarations. 
#' 
#' @details
#' By default all data is permanently cached based on query URL. This will not always
#' be the intended behavior. To modify cache behavior, pass to_cache=FALSE
#' or from_cache=FALSE to any endpoint function. As their names indicate, these
#' parameters respectively prevent data being cached and prevent data being obtained
#' from the cache.
#' 
#' To provide any unnamed parameters simply use the extra named arguments with (...)
#' 
#' To pass in a list as a parameter to an endpoint, use c().
#' 
#' 
#' @section State functions:
#' create_state(): Creates a new state object. This is passed into all of
#' the other functions in the library. It maintains the current state,
#' including handling rate limiting.
#' 
#' @section champion functions:
#' get_champion()
#' 
#' get_champion_by_id()
#' 
#' @section current-game functions:
#' get_current_game()
#' 
#' @section featured-games functions:
#' get_featured_games()
#' 
#' @section game functions:
#' get_game()
#' 
#' @section league functions:
#' get_league_by_summoner()
#' 
#' get_league_entry_by_summoner()
#' 
#' get_league_by_team()
#' 
#' get_league_entry_by_team()
#' 
#' get_challenger()
#' 
#' get_master()
#' 
#' @section lol-static-data functions:
#' get_static_champion()
#' 
#' get_static_champion_by_id()
#' 
#' get_static_item()
#' 
#' get_static_item_by_id()
#' 
#' get_static_language_strings()
#' 
#' get_static_languages()
#' 
#' get_static_map()
#' 
#' get_static_mastery()
#' 
#' get_static_mastery_by_id()
#' 
#' get_static_realm()
#' 
#' get_static_rune()
#' 
#' get_static_rune_by_id()
#' 
#' get_static_summoner_spell()
#' 
#' get_static_summoner_spell_by_id()
#' 
#' get_static_versions()
#' 
#' @section lol-status functions:
#' get_shards()
#' 
#' get_shards_by_region()
#' 
#' @section match functions:
#' get_match()
#' 
#' @section matchhistory functions:
#' get_matchhistory()
#' 
#' @section stats functions:
#' get_ranked_stats()
#' 
#' get_summary_stats()
#' 
#' @section summoner functions:
#' get_summoner_by_name()
#' 
#' get_summoner_by_id()
#' 
#' get_summoner_masteries()
#' 
#' get_summoner_names()
#' 
#' get_summoner_runes()
#' 
#' @section team functions:
#' get_team_by_summoner()
#' 
#' get_team_by_team()
#'
#' @docType package
#' @name riotapi
NULL