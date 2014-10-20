shinyUI(
  pageWithSidebar(
    headerPanel('Sortable list'),
    sidebarPanel(
      includeScript("www/js/jquery-ui.custom.min.js"),
      wellPanel(
        uiOutput('sortable_rui')
      ),
      wellPanel(
        uiOutput('sortable2_rui')
      ),
      sliderInput("someSlider", "Some Slider", min=1, max=5, value=1),
      helpText("Note: If the slider above is broken there is probably a
               conflict between the version of jquery used by
               Shiny and the version used for Sortable (v1.10.4).")
    ),

    mainPanel(
      tableOutput('showData'),
      verbatimTextOutput('showorder'),
      tableOutput('showData2'),
      verbatimTextOutput('showorder2')

    )
  )
)
