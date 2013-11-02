options(shiny.trace=TRUE)

dat <- mtcars[1:10,c('mpg','cyl','disp','hp')]

html_list <- function(vars) {

  hl <- "<ul id='sortable'>"
  for(i in vars) {
    hl <- paste0(hl, "<li data-id=",i," class='ui-state-default'>",i,"</li>")
  }
  hl <- paste0(hl, "</ul>")
  hl
}

makeSortable <- function(inputId) {
  tags$input(id = inputId, class = 'returnOrder')
}

shinyServer(function(input, output) {

  output$vars <- renderUI({

    vars <- colnames(dat)
    selectInput("vars", label = "Variables:", choices = vars, selected = vars, multiple = TRUE)
  })
  
  output$sortable <- renderUI({

    hl <- html_list(input$vars)
    HTML(hl)
  })

  getdata <- reactive({
    if(is.null(input$vars)) return()

    # makeSortable should return the order of the sortable list
    # which it doesn't now. 
    # orderedVars <- makeSortable("something")
    orderedVars <- input$vars
    dat[,orderedVars, drop = FALSE]

  })

  output$showData <- renderTable({
    getdata()
  })

}) 

