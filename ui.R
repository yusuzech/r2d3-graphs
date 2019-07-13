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
                        sidebarPanel(
                            tags$h3("Plotting Matix:"),
                            sliderInput(
                                inputId = "D3MatrixPlotColumns",
                                label = "Matrix Columns:",
                                min = 1,
                                max = 100,
                                step = 1, 
                                value = 5,
                                round = TRUE
                            ),
                            sliderInput(
                                inputId = "D3MatrixPlotRows",
                                label = "Matrix Rows:",
                                min = 1,
                                max = 100,
                                step = 1, 
                                value = 5,
                                round = TRUE
                            ),
                            tags$h3("Plotting Area:"),
                            pickerInput(
                                inputId = "D3MatrixPlotFix",
                                label = "Fix SVG BY:",
                                choices = c(
                                    "width (use width provided by shiny)" = "width",
                                    "height (use height provided by shiny)" = "height", 
                                    "auto (use both width and height provided by shiny)" = "auto"
                                ),
                                selected = "width"
                            ),
                            numericInput(
                                inputId = "D3MatrixPlotAspect",
                                label = "Aspect Ratio(width/height)",
                                value = 1,
                                step = 1
                            ),
                            tags$h3("Colors:"),
                            colourpicker::colourInput(
                                inputId = "D3MatrixPlotBackground",
                                label = "Pick Background Color:",
                                value = "#ECF0F5"
                            ),
                            colourpicker::colourInput(
                                inputId = "D3MatrixPlotRectFill",
                                label = "Pick Rectangle Fill Color:",
                                value = "#87ceeb"
                            ),
                            tags$h3("Margins:"),
                            sliderInput(
                                inputId = "D3MatrixPlotsvgMargin",
                                label = "SVG Margin %",
                                min = 0,
                                max = 100,
                                step = 1, 
                                value = 5,
                                post = "%"
                            ),
                            sliderInput(
                                inputId = "D3MatrixPlotrectMargin",
                                label = "Rectangle Margin %",
                                min = 0,
                                max = 100,
                                step = 1, 
                                value = 5,
                                post = "%"
                            )
                        ),
                        mainPanel(d3Output("D3MatrixPlot1"))
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