shinyUI(
  pageWithSidebar(
  
    headerPanel('Sortable list'),
    
    sidebarPanel(
      tags$html(includeHTML('www/sort.html')),
      tags$head(tags$script(src = 'js/sort.js')),
      includeCSS('www/sort.css'),
      uiOutput('vars')
    ),
    
    mainPanel(
      uiOutput('sortable'),
      tableOutput('showData')
    )
  )
)
