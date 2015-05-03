get_featured_games <- function(state, ...)
{
  namespace = "feature-games"
  url = paste0(sprintf(OBSERVER_URL, state$region),
               sprintf("featured?%s",
                       .format_extra_args(state, ...)))
  return(.get_data(state, namespace, url, ...))
}