library(shiny)


# Define server logic to read selected file ----
server <- function(input, output) {

    
  output$loadedMat <- renderTable({
    
    if (is.null(input$file1$datapath)) {
      dpath <- "starGraphAdjMatrix.csv"
    } else {
      dpath <- input$file1$datapath
    }
    
   mat <- read.csv(dpath,header = TRUE,
                     sep = ",",
                    quote='"')
   mat$X <- NULL
   
   return(mat)
   
  }, rownames = FALSE, colnames = FALSE)
}

  