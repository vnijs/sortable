options(shiny.trace=TRUE)

dat <- mtcars[1:5,c('mpg','cyl','disp','hp')]
myfactor <- factor(c("Me", "Myself", "and", "I"))
dat2 <- data.frame(myfactor)

shinyServer(function(input, output) {


  # 1st sortable, id's for the renderUI and returnOrder should be different
  output$sortable_rui <- renderUI({

    returnOrder("sortable",colnames(dat))
  })

  output$showorder <- renderPrint({
    print(input$sortable)
  })

  output$showData <- renderTable({

    if(is.null(input$sortable)) {
      ordVars <- colnames(dat)
    } else {
      ordVars <- input$sortable
    }
    dat[,ordVars, drop = FALSE]

  })

  # 2nd sortable
  output$sortable2_rui <- renderUI({
    returnOrder("sortable2",levels(dat2$myfactor))
  })

  output$showData2 <- renderTable({
    print(dat2)
  })

  output$showorder2 <- renderPrint({
    if(!is.null(input$sortable2)) {
      dat2$myfactor <- factor(dat2$myfactor, levels = input$sortable2)
    }
    summary(dat2)
  })

}) 
