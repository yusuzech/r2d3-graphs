header <- dashboardHeader(
    title = "r2d3 Snippets Demo"
)

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem(
            text = "D3MatrixPlot",
            tabName = "D3MatrixPlot"
        )
    )
)

body <- dashboardBody(
    tabItems(
        tabItem(
            tabName = "D3MatrixPlot",
            fluidRow(
                column(
                    width = 6,
                    d3Output("D3MatrixPlot1")
                )
            )
        )
    )
)

ui <- dashboardPage(
    useShinyjs(),
    header = header,
    sidebar = sidebar,
    body = body
)