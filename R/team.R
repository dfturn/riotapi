get_team_by_summoner <- function(state, summoner_ids, ...)
{
  namespace = "team"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s", namespace, "by-summoner", .format_extra_args(state=FALSE, summoner_ids)),
                        version=endpoint_list$team,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}

get_team_by_team <- function(state, team_ids, ...)
{
  namespace = "team"
  url = .format_endpoint(state,
                        sprintf("%s/%s", namespace, .format_extra_args(state=FALSE, team_ids)),
                        version=endpoint_list$team,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
