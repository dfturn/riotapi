regions = list("br", "eune", "euw", "kr", "lan", "las", "na", "oce", "ru", "tr")
platform_list = list("BR1", "EUN1", "EUW1", "KR", "LA1", "LA2", "NA1", "OC1", "RU", "TR1")
names(platform_list) = regions

setRefClass("RateLimit", fields=list(num="numeric", seconds="numeric", recents="vector"))


endpoint_list = list("champion"=1.2,
                     "current-game"=1.0,
                     "feature-games"=1.0,
                     "game"=1.3,
                     "league"=2.5,
                     "static-data"=1.2,
                     "status"=1.0,
                     "match"=2.2,
                     "matchhistory"=2.2,
                     "stats"=1.3,
                     "summoner"=1.4,
                     "team"=2.4)

create_state <- function(key,
                         region="na",
                         db_name="riot_api",
                         mongo=rmongodb::mongo.create(),
                         limits=list(c(10, 10),
                                     c(500, 600)))
{
  state = list(region=region, api_key=key, db=db_name, mongo=mongo)
  state$limits = lapply(limits, function(lim)
    new("RateLimit", num=lim[1], seconds=lim[2], recents=vector()))
  state
}