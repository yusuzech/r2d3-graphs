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
            # D3MatrixPlot ----
            tabName = "D3MatrixPlot",
            fluidRow(
                column(
                    width = 6,
                    sidebarLayout(
                        source("ui_codes/D3MatrixPlot.R",local = TRUE)$value,
                        mainPanel(
                            tabsetPanel(
                                tabPanel(
                                    "Plot",
                                    d3Output("D3MatrixPlot1")
                                ),
                                tabPanel(
                                    "UI Code",
                                    tags$div(
                                        style = "width:150%",
                                        pre(includeText("ui_codes/D3MatrixPlot.R"))
                                    )
                                ),
                                tabPanel(
                                    "Sever Code",
                                    tags$div(
                                        style = "width:150%",
                                        pre(includeText("server_codes/D3MatrixPlot.R"))
                                    )
                                ),
                                tabPanel(
                                    "D3 Code", 
                                    tags$div(
                                        style = "width:150%",
                                        pre(includeText("r2d3-snippets/D3MatrixPlot.js"))
                                    )
                                )
                            )
                        )
                    )
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