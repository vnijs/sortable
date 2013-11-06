shinyUI(
  pageWithSidebar(
  
    headerPanel('Sortable list'),
    
    sidebarPanel(
      tags$html(includeHTML('www/sort.html')),
      tags$head(tags$script(src = 'js/sort.js')),
      includeCSS("www/sort.css"),
      wellPanel(
        uiOutput('sortable')
      ),
      wellPanel(
        uiOutput('sortable2')
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
