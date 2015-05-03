.get_stat <- function(state, summoner_id, type, ...)
{
  namespace = "stats"
  url = .format_endpoint(state,
                         sprintf("%s/%s/%d/%s", namespace, "by-summoner", summoner_id, type),
                         version=endpoint_list$stats,
                         ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}

get_ranked_stats <- function(state, summoner_id, ...)
{
  return(.get_stat(state, summoner_id, "ranked", ...))
}
get_summary_stats <- function(state, summoner_id, ...)
{
  return(.get_stat(state, summoner_id, "summary", ...))
}