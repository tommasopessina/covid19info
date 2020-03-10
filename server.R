
#scraping <- function(){
# url = "https://news.google.com/search?q=covid-19%20italia&hl=it&gl=IT&ceid=IT%3Ait"
#  webpage <- xml2::read_html(url)
#  title_html <- rvest::html_nodes(webpage, "div#coin-price")
#  perc_html <- rvest::html_nodes(webpage, "span#coin-changePercent")
#  perc <- rvest::html_text(perc_html)
#  title <- rvest::html_text(title_html)
#  price <- stringr::str_replace_all(title, "\n","")
#  print("Data retrieved correctly")
#  return(new("pricePerc",price=price,perc=perc))
#}

server <- function(input, output, session) {
  
  dataUrl = "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv"
  
  df = read.csv(url(dataUrl))
  
  output$tot <- shiny::renderText(tail(df$totale_attualmente_positivi, n=1))
  output$new <- shiny::renderText(c("+",tail(df$nuovi_attualmente_positivi, n=1)))
  
  output$distPlot <- plotly::renderPlotly({
    plotly::plot_ly(df, x = as.Date(df$data), y= df$totale_attualmente_positivi, type = 'scatter', mode = 'lines')
  })
}