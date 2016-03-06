library(shiny)
library(DT)

shinyServer(function(input, output) {
  
  output$widget_title <- renderText(
    "SCONES_test.tsv"
  )
  
  output$description <- renderText("log2-ratio signal for two test samples, test
                                  sample 1 and test sample two. This ratio is computed
by the log2 ratio of a test sample and reference sample.")
  
  output$logratio <- renderDataTable({
    DT::datatable(SCONES_test, caption = "Log Ratios", filter = "top", 
                  extensions = 'TableTools', options = list(
      dom = 'T<"clear">lfrtip',
      tableTools = list(sSwfPath = copySWF('www')))) %>%
      formatStyle('chr', backgroundColor = "orange", fontWeight = "bold") %>%
      formatStyle(c('start', 'end'), backgroundColor = "gray", color = "white")
  })

  output$downloadData <- downloadHandler(
    filename = function() { paste("SCONES_test", '.tsv', sep='') },
    content = function(file) {
      write.csv(SCONES_test, file)
    }
  )
  
  
})
