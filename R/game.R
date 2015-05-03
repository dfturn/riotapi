get_game <- function(state, summoner_id, ...)
{
  namespace = "game"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%d/%s", namespace, "by-summoner", summoner_id, "recent"),
                        version=endpoint_list$game,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}