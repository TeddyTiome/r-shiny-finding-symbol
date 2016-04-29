shinyUI(fluidPage(  
  titlePanel("Finding Symbol !"),
  
  sidebarLayout(
    
    sidebarPanel(
      helpText("Choose arguments for the panel !"),
      selectInput("symbol", 
                  label = "Background/Wanted Symbol",
                  choices = c("9/6", "O/0","M/N", "I/T"),
                  selected = "9/6"),
      
      sliderInput("row", label = h3("Row"), min = 0, max = 100, value = 50),
      sliderInput("column", label = h3("Column"), min = 0, max = 100, value = 50),
      numericInput("seed", label = h3("Set Random Seed"), value = 24)
    ), 
      
    mainPanel(    
      h2("Symbol Panel",align="center"),
      tableOutput("panel")
      )
  )
))

