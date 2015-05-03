get_league_by_summoner <- function(state, summoner_ids, ...)
{
  namespace = "league"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s", namespace, "by-summoner", .format_extra_args(state=FALSE, summoner_ids)),
                        version=endpoint_list$league,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
get_league_entry_by_summoner <- function(state, summoner_ids, ...)
{
  namespace = "league"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s/%s", namespace, "by-summoner", .format_extra_args(state=FALSE, summoner_ids), "entry"),
                        version=endpoint_list$league,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}

get_league_by_team <- function(state, team_ids, ...)
{
  namespace = "league"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s", namespace, "by-team", .format_extra_args(state=FALSE, team_ids)),
                        version=endpoint_list$league,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
get_league_entry_by_team <- function(state, team_ids, ...)
{
  namespace = "league"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s/%s", namespace, "by-team", .format_extra_args(state=FALSE, team_ids), "entry"),
                        version=endpoint_list$league,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
get_challenger <- function(state, ...)
{
  namespace = "league"
  url = .format_endpoint(state,
                        sprintf("%s/%s", namespace, "challenger"),
                        version=endpoint_list$league,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
get_master <- function(state, ...)
{
  namespace = "league"
  url = .format_endpoint(state,
                        sprintf("%s/%s", namespace, "master"),
                        version=endpoint_list$league,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}