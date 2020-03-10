#  Define UI for app
ui <- shiny::fluidPage(
  
  shinyjs::useShinyjs(),
  shinyalert::useShinyalert(),
  
  # App title
  shiny::titlePanel("Covid-19 positive cases indicator (Italy only)"),
  
  shiny::sidebarPanel(  
    
    shiny::fluidRow(
      
      shiny::h3("Total number of infected:",shiny::textOutput("tot")),
      shiny::h4("New infections yesterday:",shiny::textOutput("new"))
      
      
    )
  ),
  
  # Main panel for displaying outputs
  shiny::mainPanel(
    
    # Output: plot
    shinycssloaders::withSpinner(plotly::plotlyOutput(outputId = "distPlot"), color="#0dc5c1")
  )
  
)