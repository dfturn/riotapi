.get_static <- function(state, name, id="", ...)
{
  namespace = "static-data"
  url = .format_endpoint(state,
                        sprintf("%s%s", name,
                          if (id != "") sprintf("/%s", .format_extra_args(state=FALSE, id))
                          else ""),
                        version=endpoint_list$"static-data",
                        static=TRUE,
                        ...)
  data = .get_data(state, namespace, url, static=TRUE, ...)
  return(data)
}

get_static_champion <- function(state, ...)
{
  return(get_static_champion_by_id(state))
}

get_static_champion_by_id <- function(state, id="", ...)
{
  return(.get_static(state, "champion", id))
}

get_static_item <- function(state, ...)
{
  return(get_static_item_by_id(state))
}
get_static_item_by_id <- function(state, id="", ...)
{
  return(.get_static(state, "item", id))
}
get_static_language_strings <- function(state, ...)
{
  return(.get_static(state, "language-strings"))
}
get_static_languages <- function(state, ...)
{
  return(.get_static(state, "languages"))
}
get_static_map <- function(state, ...)
{
  return(.get_static(state, "map"))
}
get_static_mastery <- function(state, ...)
{
  return(get_static_mastery_by_id(state))
}
get_static_mastery_by_id <- function(state, id="", ...)
{
  return(.get_static(state, "mastery", id))
}
get_static_realm <- function(state, ...)
{
  return(.get_static(state, "realm"))
}
get_static_rune <- function(state, ...)
{
  return(get_static_rune_by_id(state))
}
get_static_rune_by_id <- function(state, id="", ...)
{
  return(.get_static(state, "rune", id))
}
get_static_summoner_spell <- function(state)
{
  return(get_static_summoner_spell_by_id(state))
}
get_static_summoner_spell_by_id <- function(state, id="", ...)
{
  return(.get_static(state, "summoner-spell", id))
}
get_static_versions <- function(state, ...)
{
  return(.get_static(state, "versions"))
}