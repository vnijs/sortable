shinyUI(
  pageWithSidebar(
  
    headerPanel('Sortable list'),
    
    sidebarPanel(
      tags$head(tags$script(src = "js/jquery-ui.min.js")),
      wellPanel(
        uiOutput('sortable_rui')
      ),
      wellPanel(
        # returnOrder("sortable2",c('drat', 'wt', 'vs'))
        uiOutput('sortable2_rui')
      )
    ),
    
    mainPanel(
      tableOutput('showData'),
      verbatimTextOutput('showorder'),
      tableOutput('showData2'),
      verbatimTextOutput('showorder2')
    )
  )
)
