options(shiny.trace=TRUE)

dat <- mtcars[1:5,c('mpg','cyl','disp','hp')]
dat2 <- mtcars[1:5,c('drat', 'wt', 'vs')]

shinyServer(function(input, output) {


  # 1st sortable, id's for the renderUI and returnOrder should be different
  output$sortable_rui <- renderUI({

    returnOrder("sortable",colnames(dat))
  })

  output$showorder <- renderPrint({
    print(input$sortable)
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
  output$sortable2_rui <- renderUI({
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
  })

}) 
