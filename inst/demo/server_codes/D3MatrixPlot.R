# D3MatrixPlot ----
observe({
    output$D3MatrixPlot1 <- renderD3({
        matrixRows <- input$D3MatrixPlotRows
        matrixColumns <- input$D3MatrixPlotColumns
        
        myMatrix <- matrix(sample(c(0,1),
                                  size = matrixRows * matrixColumns,
                                  replace = TRUE),
                           nrow = matrixRows,
                           ncol = matrixColumns)
        svgMargin <- paste0(input$D3MatrixPlotsvgMargin/2,"%")
        rectMargin <- paste0(input$D3MatrixPlotrectMargin,"%")
        D3MatrixPlot <- r2d3(data = myMatrix,
                             script = "r2d3-snippets/D3MatrixPlot.js",
                             options = list(
                                 params = list(
                                     # svg margin
                                     "margin.top" = svgMargin,
                                     "margin.bottom" = svgMargin,
                                     "margin.left" = svgMargin,
                                     "margin.right" = svgMargin,
                                     # rect
                                     "rect.fill" = input$D3MatrixPlotRectFill,
                                     "rect.margin" = rectMargin,
                                     # svg size, aspect ratio and color
                                     "svg.fix" = input$D3MatrixPlotFix,
                                     "svg.background" = input$D3MatrixPlotBackground,
                                     "svg.aspectRatio" = input$D3MatrixPlotAspect
                                 )
                             ))
        D3MatrixPlot
    })
})
# update aspectRatio
observeEvent(
    c(
        input$D3MatrixPlotRows,
        input$D3MatrixPlotColumns
    ),
    {
        updateNumericInput(
            session = session,
            inputId = "D3MatrixPlotAspect",
            value = as.character(round(input$D3MatrixPlotColumns/input$D3MatrixPlotRows,4))
        )
    }
)