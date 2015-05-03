get_current_game <- function(state, summoner_id, platform="", ...)
{
  namespace = "current-game"
  if (platform=="") platform = platform_list[[state$region]]
  url = paste0(sprintf(OBSERVER_URL, state$region),
               sprintf("consumer/getSpectatorGameInfo/%s/%d?%s",
                       platform,
                       summoner_id,
                       .format_extra_args(state, ...)))
  return(.get_data(state, namespace, url, ...))
}