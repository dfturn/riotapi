OBSERVER_URL = "https://%s.api.pvp.net/observer-mode/rest/"

.format_endpoint <- function(state, url, version, static=FALSE, to_cache, from_cache, ...)
{
  url = sprintf("https://%s.api.pvp.net/api/lol/%s%s/v%.1f/%s?%s",
                if (static) "global" else state$region,
                if (static) "static-data/" else "",
                state$region,
                version,
                url,
                .format_extra_args(state, ...))
  return(url)
}

.format_extra_args <- function(state=FALSE, ...)
{
  ll = list(...)
  if (is.list(state)) ll = c(ll, "api_key"=state$api_key)
  out = lapply(seq_along(ll),
               function(ind, list, names) {
                 mysep = "="
                 if (is.null(names) || names[ind] == "") {
                   mysep = ""
                 }
                 paste(names[ind], sep=mysep, paste(list[[ind]], sep="", collapse = ","))
               }, list = ll, names = names(ll))
  
  out = paste(out, sep="", collapse="&")
  return(out)
}

.get_cache <- function(state, namespace, url)
{
  cursor = rmongodb::mongo.find(state$mongo, paste(state$db, namespace, sep="."), list(my_url=url), limit=1)
  data = FALSE
  if (rmongodb::mongo.cursor.next(cursor))
  {
    data = rmongodb::mongo.bson.to.list(rmongodb::mongo.cursor.value(cursor))
  }
  rmongodb::mongo.cursor.destroy(cursor)
  return(data)
}

.handle_rates <- function(limits)
{
  cur_time = as.numeric(Sys.time())
  # Remove any times which are too old
  lapply(limits, function(lim)
    if(length(lim$recents) > 0) {
      idx = findInterval(cur_time - lim$seconds, lim$recents)+1
      if (idx <= length(lim$recents)) {
        lim$recents = lim$recents[(findInterval(cur_time - lim$seconds, lim$recents)
                                   +1):length(lim$recents)] }
      else lim$recents = vector()
    })
  wait_time = 0
  # Find the longest time we need to wait for any of our rate limits
  lapply(limits, 
         function(lim) {
           if(length(lim$recents) >= lim$num) {
             wait_time = max(wait_time, cur_time - lim$recents[1])
           }})

  if(wait_time > 0) Sys.sleep(wait_time) # Wait for it...
  # Update for the current time
  lapply(limits, function(lim)
    lim$recents = c(lim$recents, cur_time))
}

.get_data <- function(state, namespace, url, from_cache=TRUE, to_cache=TRUE, static=FALSE, ...)
{
  data = FALSE
  if(from_cache) 
  {
    data = .get_cache(state, namespace, url)
  }
  if(!is.list(data)) #Cache returned false
  {
    if( !static ) .handle_rates(state$limits)
    req = httr::GET(url)
    
    if( req$status_code >= 400 ) {
      stop(req$status_code)
    }
    else {
      data = jsonlite::fromJSON(httr::content(req, as="text"), simplifyVector=FALSE)
      
      if(to_cache)
      {
        data$my_url = url
        rmongodb::mongo.insert(state$mongo, paste(state$db, namespace, sep="."), data)
      }
    }
  }
  
  return(data)
}