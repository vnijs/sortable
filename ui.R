shinyUI(
  pageWithSidebar(
  
    headerPanel('Sortable list'),
    
    sidebarPanel(
      wellPanel(
        uiOutput('sortable')
      ),
      wellPanel(
        returnOrder("sortable2",c('drat', 'wt', 'vs'))
        # uiOutput('sortable2')
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
