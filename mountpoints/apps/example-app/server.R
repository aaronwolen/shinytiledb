#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tiledb)

shinyServer(function(input, output) {
  output$versions <- renderUI({
    versions <- list(
      sprintf("tiledb: v%s", paste0(tiledb_version(), collapse = ".")),
      sprintf("tiledb-R: v%s", packageVersion("tiledb"))
    )
    lapply(versions, tags$li)
  })
})
