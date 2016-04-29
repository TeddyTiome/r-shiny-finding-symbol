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
