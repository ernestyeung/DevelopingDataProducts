library(shiny)
library(rCharts)
library(data.table)
options(RCHART_LIB = 'morris')

shinyUI(fluidPage(
  titlePanel("Ebola Outbreak in West Africa 2014-2016"),
  
  sidebarLayout(
      sidebarPanel(
		  radioButtons("region", "Select Geographic Region of Interest", 
                   choices=c("Sierra Leone", "Liberia", "Guinea", "All Three Above Countries"), selected="All Three Above Countries"),
		  submitButton("Submit"),
		  h4(""),
		  includeMarkdown("datasource.md")
      ),
      mainPanel(
	      h4("Number of Cumulative Cases"),
          showOutput('case_plot',lib='morris'),
          h4("Number of Cumulative Deaths"),
          showOutput('death_plot',lib='morris')
  )
  )
  )
)