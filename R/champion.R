get_champion <- function(state, ...)
{
  return(get_champion_by_id(state, id="", ...))
}

get_champion_by_id <- function(state, id, ...)
{
  namespace = "champion"
  url = .format_endpoint(state,
                        sprintf("%s/%s", namespace, .format_extra_args(state=FALSE, id)),
                        version=endpoint_list$champion,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}