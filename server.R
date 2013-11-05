options(shiny.trace=TRUE)

dat <- mtcars[1:10,c('mpg','cyl','disp','hp')]

html_list <- function(vars) {

  hl <- "<ul id='sortable'>"
  for(i in vars) {
    hl <- paste0(hl, "<li class='ui-state-default'><span class='label'>",i,"</span></li>")
  }
  hl <- paste0(hl, "</ul>")
  hl
}

shinyServer(function(input, output) {

  output$sortable <- renderUI({

    hl <- html_list(colnames(dat))
    HTML(hl)
  })

  output$showorder <- renderPrint({
    input$sortable
  })

  getdata <- reactive({

    if(is.null(input$sortable)) {
      ordVars <- colnames(dat)
    } else {
      ordVars <- input$sortable
    }
    dat[,ordVars, drop = FALSE]

  })

  output$showData <- renderTable({
    getdata()
  })

}) 
