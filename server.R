server <- function(input, output, session) {
    output$D3MatrixPlot1 <- renderD3({
        set.seed(1234)
        my_matrix <- matrix(sample(c(0,1),size = 225,replace = TRUE),nrow = 15,ncol = 15)
        
        height <- 500
        width <- 500               
        D3MatrixPlot <- r2d3(data = my_matrix,
                             script = "r2d3-snippets/D3MatrixPlot.js",
                             options = list(
                                 params = list(
                                     "rect.margin" = "20%",
                                     "svg.fix" = "height",
                                     "svg.background" = "rgb(236, 240, 245)"
                                 )
                             ),
                             width = width,
                             height = height)
        D3MatrixPlot
    })
}
