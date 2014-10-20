shinyUI(
  pageWithSidebar(
  
    headerPanel('Sortable list'),
    
    sidebarPanel(
      tags$head(tags$script(src = "js/jquery-ui.min.js")),
      wellPanel(
        uiOutput('sortable_rui')
      ),
      wellPanel(
        uiOutput('sortable2_rui')
      )
    ),
    
    mainPanel(
      tableOutput('showData'),
      verbatimTextOutput('showorder'),
      tableOutput('showData2'),
      verbatimTextOutput('showorder2'),
      sliderInput("someSlider", "Some Slider", min=1, max=5, value=1)
    )
  )
)
