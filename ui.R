shinyUI(
  pageWithSidebar(
  
    headerPanel('Sortable list'),
    
    sidebarPanel(
      tags$html(includeHTML('www/sort.html')),
      tags$head(tags$script(src = 'js/sort.js')),
      includeCSS('www/sort.css'),
      wellPanel(
        uiOutput('sortable')
      )
    ),
    
    mainPanel(
      tableOutput('showData'),
      verbatimTextOutput('showorder')
    )
  )
)
