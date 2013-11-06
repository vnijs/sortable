options(shiny.trace=TRUE)

dat <- mtcars[1:10,c('mpg','cyl','disp','hp')]
dat2 <- mtcars[1:10,c('drat', 'wt', 'vs')]

html_list <- function(vars, id) {

  hl <- paste0("<ul id=\'",id,"\' class='stab'>")
  for(i in vars) hl <- paste0(hl, "<li class='ui-state-default stab'><span class='label'>",i,"</span></li>")
  paste0(hl, "</ul>")
}

returnOrder <- function(inputId, vars) {
  tagList(
    tags$head(tags$script(paste0("$(function() {$( '#",inputId,"' ).sortable({placeholder: 'ui-state-highlight'}); $( '#",inputId,"' ).disableSelection(); });"))),
    tags$head(tags$script(src = 'js/sort.js')),
    HTML(html_list(vars, inputId))
  )
}

shinyServer(function(input, output) {

  output$sortable <- renderUI({

    # hl <- html_list(colnames(dat),'sortable')
    # HTML(hl)

    returnOrder("sortable",colnames(dat))
  })

  output$showorder <- renderPrint({
    print(input$sortable)
    cat("\nShiny binding provided by ZJ: https://groups.google.com/forum/?fromgroups=#!topic/shiny-discuss/f3n5Iv2wNQ8")
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


  # 2nd sortable
  output$sortable2 <- renderUI({

    # hl <- html_list(colnames(dat2),'sortable2')
    # HTML(hl)
    
    returnOrder("sortable2",colnames(dat2))
  })


  getdata2 <- reactive({

    if(is.null(input$sortable2)) {
      ordVars <- colnames(dat2)
    } else {
      ordVars <- input$sortable2
    }
    dat2[,ordVars, drop = FALSE]

  })

  output$showData2 <- renderTable({
    getdata2()
  })

  output$showorder2 <- renderPrint({
    print(input$sortable2)
    cat("\nShiny binding provided by ZJ: https://groups.google.com/forum/?fromgroups=#!topic/shiny-discuss/f3n5Iv2wNQ8")
  })

}) 
