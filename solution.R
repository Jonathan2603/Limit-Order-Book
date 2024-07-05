book.total_volumes <- function(book) {
  # Arguments: 
  ask <- sum(book$ask[3])
  bid <- sum(book$bid[3])
  #   book - A list containing "ask" and "bid", each of which are dataframes
  #       containing the collection of limit orders.
  #
  # Returns:
  #   The total volume in the book.
  volume <- list(bid=bid,ask=ask)
  return(volume)
}

book.best_prices <- function(book) {
  # Arguments:
  bid <- max(book$bid[2])
  ask <- min(book$ask[2])
  #   book - A list containing "ask" and "bid", each of which are dataframes
  #       containing the collection of limit orders.
  #
  # Returns:
  #   A list with "ask" and "bid", the values of which are the best prices in
  #       the book.
  bestPrices <- list(bid=bid,ask=ask)
  return(bestPrices)
}

book.midprice <- function(book) {
  # Arguments:
  bid <- max(book$bid[2])
  ask <- min(book$ask[2])
  #   book - A list containing "ask" and "bid", each of which are dataframes
  #       containing the collection of limit orders.
  #
  # Returns:
  #   The midprice of the book.
  midprice <- (bid + ask)/2
  return(midprice)
}

book.spread <- function(book) {
  # Arguments:
  bid <- max(book$bid[2])
  ask <- min(book$ask[2])
  #   book - A list containing "ask" and "bid", each of which are dataframes
  #       containing the collection of limit orders.
  #
  # Returns:
  #   The spread of the book.
  spread <- abs(bid - ask)
  return(spread)
}

book.add <- function(book, message) {
  # Arguments:
  #   book - A list containing "ask" and "bid", each of which are dataframes
  #       containing the collection of limit orders.
  #   message - A list containing "oid", "side", "price" and "size" entries.
  
  if(message$side == "S"){
    while (message$size != 0) {
      bestData = book.best_prices(book)
      if(message$price > bestData$bid){
        book$ask <- rbind(book$ask,c(message$oid, message$price, message$size))
        message$size = 0
      }
      else if(message$price <= bestData$bid) {
        if (message$size<book$bid[1,"size"]){
          book$bid[1,"size"] <- (book$bid[1,"size"] - message$size)
          message$size = 0
        }
        else{
          message$size = (message$size - book$bid[1,"size"])
          book$bid <- book$bid[-1,]
        }
      }
    }
  }
  book$ask$price = as.numeric(book$ask$price)
  book$ask$size = as.numeric(book$ask$size)
  
  if(message$side == "B"){
    while (message$size != 0) {
      bestData = book.best_prices(book)
      if(message$price < bestData$ask){
        book$bid <- rbind(book$bid,c(message$oid, message$price, message$size))
        message$size = 0
      }
      else if(message$price >= bestData$ask) {
        if (message$size<book$ask[1,"size"]){
          book$ask[1,"size"] <- (book$ask[1,"size"] - message$size)
          message$size = 0
        }
        else{
          message$size = (message$size - book$ask[1,"size"])
          book$ask <- book$ask[-1,]
        }
      }
    }
  }
  book$bid$price = as.numeric(book$bid$price)
  book$bid$size = as.numeric(book$bid$size)

  # Returns:
  #   The updated book.
  return(book)
}

book.reduce <- function(book, message) {
  # Arguments:
  #   book - A list containing "ask" and "bid", each of which are dataframes
  #       containing the collection of limit orders.
  #   message - A list containing "oid" and "amount".
  
  counter <-1
  for (i in book$ask[,"oid"]) {
    if(message$oid == i){
      book$ask[counter,3] = (book$ask[counter,3] - message$amount)
      if(book$ask[counter,3] <= 0){
        book$ask <- book$ask[-counter,]
      }
    }
    counter = counter + 1
  }
  
  counter <-1
  for (i in book$bid[,"oid"]) {
    if(message$oid == i){
      book$bid[counter,3] <- (book$bid[counter,3] - message$amount)
      if(book$bid[counter,3] <= 0){
        book$bid <- book$bid[-counter,]
      }
    }
    counter = counter + 1
  }
  
  # Returns:
  #   The updated book.
  return(book)
}

###############################################################################
###############################################################################

# The following functions are the "extra" functions; marks for these functions
# are only available if you have fully correct implementations for the 6
# functions above

book.extra1 <- function(book, size) {
  # See handout for instructions
}

book.extra2 <- function(book, size) {
  # See handout for instructions
}

book.extra3 <- function(book) {
  # See handout for instructions
}

book.extra4 <- function(book, k) {
  # See handout for instructions
}
