get_shards <- function(state)
{
  return(get_shards_by_region(state))
}
get_shards_by_region <- function(state, region="", ...)
{
  namespace = "status"
  url = sprintf("http://status.leagueoflegends.com/shards%s",
                if(region!="") paste0("/", region) else "")
  return(.get_data(state, namespace, url, static=TRUE, ...))
}