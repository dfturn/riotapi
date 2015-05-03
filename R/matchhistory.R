get_matchhistory <- function(state, summoner_id, ...) 
{
  namespace = "matchhistory"
  url = .format_endpoint(state,
                        sprintf("%s/%d", namespace, summoner_id),
                        version=endpoint_list$matchhistory,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}