shinyUI(
  pageWithSidebar(
  
    headerPanel('Sortable list'),
    
    sidebarPanel(
      tags$html(includeHTML('www/sort.html')),
      tags$head(tags$script(src = 'js/sort.js')),

      # Failed alternative
      # tags$head(tags$script("$(document).ready(function() {
      #                   $('#sortable ul li').map(function(i,el) {return $(el).text()});
      #                 });", type = 'text/javascript'),
      #     tags$input(id = 'sortable', type = 'text')
      # ),

      includeCSS('www/sort.css'),
      uiOutput('vars')
    ),
    
    mainPanel(
      uiOutput('sortable'),
      tableOutput('showData')
    )
  )
)



