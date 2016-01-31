library(shiny)
library(rCharts)
library(data.table)

ebola_data <- fread("graph1-cumulative-reported-cases-all.csv")

shinyServer(
    function(input, output){
        output$case_plot<-renderChart2({
			if (input$region=="Sierra Leone") {
			c_plot <- mPlot (x = "WHO report date", y = c("Total Cases, Sierra Leone"), type = "Line", data = ebola_data)
			} else if (input$region=="Liberia") {
			c_plot <- mPlot (x = "WHO report date", y = c("Total Cases, Liberia"), type = "Line", data = ebola_data)
			} else if (input$region=="Guinea") {
			c_plot <- mPlot (x = "WHO report date", y = c("Total Cases, Guinea"), type = "Line", data = ebola_data)
			} else {
			c_plot <- mPlot (x = "WHO report date", y = c("Total Cases, Guinea","Total Cases, Liberia", "Total Cases, Sierra Leone"), type = "Line", data = ebola_data)
			}
			#c_plot <- mPlot (x = "WHO report date", y = c("Total Cases, Guinea","Total Cases, Liberia", "Total Cases, Sierra Leone"), type = "Line", data = ebola_data)
			#c_plot <- mPlot (x = "WHO report date", y = c("Total Cases, Sierra Leone"), type = "Line", data = ebola_data)
			return(c_plot)
        } # function(input, output)	
		) # renderChart2
		
		output$death_plot<-renderChart2({
		if (input$region=="Sierra Leone") {
			d_plot <- mPlot (x = "WHO report date", y = c("Total Deaths, Sierra Leone"), type = "Line", data = ebola_data)
			} else if (input$region=="Liberia") {
			d_plot <- mPlot (x = "WHO report date", y = c("Total Deaths, Liberia"), type = "Line", data = ebola_data)
			} else if (input$region=="Guinea") {
			d_plot <- mPlot (x = "WHO report date", y = c("Total Deaths, Guinea"), type = "Line", data = ebola_data)
			} else {
			d_plot <- mPlot (x = "WHO report date", y = c("Total Deaths, Guinea","Total Deaths, Liberia", "Total Deaths, Sierra Leone"), type = "Line", data = ebola_data)
			}
		return(d_plot)
        } # function(input, output)       
		) # renderChart2
	} # function (input, output)
    ) # shinyServer