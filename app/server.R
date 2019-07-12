server <- function(input, output, session) {
    output$D3MatrixPlot1 <- renderD3({
        set.seed(1234)
        my_matrix <- matrix(sample(c(0,1),size = 225,replace = TRUE),nrow = 15,ncol = 15)
        
        height <- 500
        width <- 500               
        D3MatrixPlot <- r2d3(data = my_matrix,
                             script = "d3-scripts/D3MatrixPlot.js",
                             options = list(
                                 "rect.fill" = "red",
                                 "rect.margin" = "20%"
                             ),
                             width = width,
                             height = height)
        D3MatrixPlot
    })
}
