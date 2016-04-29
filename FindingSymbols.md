Finding Symbol
========================================================
author: Hao YU
autosize: true
date: April 29th 2016
class: illustration
font-family: 'Helvetica'

Introduction
========================================================
font-family: 'Helvetica'
This is a simple game - finding different symbol - with manipulable options as follows:

- Choose different background and wanted symbols. 
- Adjust the rows and columns.
- Change the random seed, so the position of wanted symbol will also be changed.

Besides, the symbol panel is sourced from the matrix.R script. 

ui.R Code
========================================================
autosize: true

```r
library(shiny)
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
```

server.R Code
========================================================
autosize: true

```r
library(shiny)
source("matrix.R")
shinyServer(  
  function(input, output) {    
      output$panel<-renderTable({
        args <- switch(input$symbol,
                "9/6"=list("9","6"), 
                "O/0"=list("O","0"),
                "M/N"=list("M","N"), 
                "I/T"=list("I",'T'))
        args$nr <- input$row[1]
        args$nc <- input$column[1]
        args$seed <- input$seed
        do.call(alzheimer,args)
                        })
    })      
```

Sample Panel Display
========================================================
autosize: true

However, the sliders of row and column, and symbol panel cannot be diplayed well.
So for the full edition, see the shiny work.

<!--html_preserve--><div class="container-fluid">
<h2>Finding Symbol !</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<span class="help-block">Choose arguments for the panel !</span>
<div class="form-group shiny-input-container">
<label class="control-label" for="symbol">Background/Wanted Symbol</label>
<div>
<select id="symbol"><option value="9/6" selected>9/6</option>
<option value="O/0">O/0</option>
<option value="M/N">M/N</option>
<option value="I/T">I/T</option></select>
<script type="application/json" data-for="symbol" data-nonempty="">{}</script>
</div>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="row">
<h3>Row</h3>
</label>
<input class="js-range-slider" id="row" data-min="0" data-max="100" data-from="50" data-step="1" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-keyboard="true" data-keyboard-step="1" data-drag-interval="true" data-data-type="number"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="column">
<h3>Column</h3>
</label>
<input class="js-range-slider" id="column" data-min="0" data-max="100" data-from="50" data-step="1" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-keyboard="true" data-keyboard-step="1" data-drag-interval="true" data-data-type="number"/>
</div>
<div class="form-group shiny-input-container">
<label for="seed">
<h3>Set Random Seed</h3>
</label>
<input id="seed" type="number" class="form-control" value="24"/>
</div>
</form>
</div>
<div class="col-sm-8">
<h2 align="center">Symbol Panel</h2>
<div id="panel" class="shiny-html-output"></div>
</div>
</div>
</div><!--/html_preserve-->

