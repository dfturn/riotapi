get_match <- function(state, match_id, ...)
{
  namespace = "match"
  url = .format_endpoint(state,
                        sprintf("%s/%d", namespace, match_id),
                        version=endpoint_list$match,
                        ...)
  data = .get_data(state, namespace, url, ...)
  return(data)
}