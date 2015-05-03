get_summoner_by_name <- function(state, names, ...)
{
  namespace = "summoner"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s", namespace, "by-name", .format_extra_args(state=FALSE, names)),
                        version=endpoint_list$summoner,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
get_summoner_by_id <- function(state, summoner_ids, ...)
{
  namespace = "summoner"
  url = .format_endpoint(state,
                        sprintf("%s/%s", namespace, .format_extra_args(state=FALSE, summoner_ids)),
                        version=endpoint_list$summoner,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
get_summoner_masteries <- function(state, summoner_ids, ...)
{
  namespace = "summoner"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s", namespace, .format_extra_args(state=FALSE, summoner_ids), "masteries"),
                        version=endpoint_list$summoner,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
get_summoner_names <- function(state, summoner_ids, ...)
{
  namespace = "summoner"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s", namespace, .format_extra_args(state=FALSE, summoner_ids), "name"),
                        version=endpoint_list$summoner,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}
get_summoner_runes <- function(state, summoner_ids, ...)
{
  namespace = "summoner"
  url = .format_endpoint(state,
                        sprintf("%s/%s/%s", namespace, .format_extra_args(state=FALSE, summoner_ids), "runes"),
                        version=endpoint_list$summoner,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}