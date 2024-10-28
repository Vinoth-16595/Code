library(shiny)

# shinyServer(
#   function(input,output){
#     output$myname <- renderText(input$Name)
#     output$myage <- renderText(input$Age)
#     output$mygender <- renderText(input$Gender)
#   }
# )
###################################################################################
# This is example for slider input
# shinyServer(
#      function(input,output){
#     output$age <- renderText(paste("You selected age is :", input$Age))
#      }
#    )

###################################################################################

# This is example for selectInput
# shinyServer(function(input,output){
#   output$name <- renderText(paste("Welcome :" , input$TeamNames))
# })

#################################################################################


# shinyServer(function(input,output){
#
#
#   col<- reactive({
#     as.numeric(input$var)
#   })
#
#   output$summ<-renderPrint(summary(iris))
#
#   output$str<-renderPrint(str(iris))
#
#
#
#
#   output$data<- renderTable({
#
#     iris[col()]
#     })
#
#   output$hist<- renderPlot({
#     #col<-as.numeric(input$var)
#     hist(iris[,col()],breaks=seq(0,max(iris[,col()],l=input$Bins+1)),col=input$color,main="Histogram of iris data",xlab=names(iris[col(
#
#     )]))
#   })
# })
########################################################################################

# shinyServer(function(input,output){
#
#
#   col<- reactive({
#     as.numeric(input$var)
#   })
#
#   output$hist<- renderPlot({
#     #col<-as.numeric(input$var)
#     hist(iris[,col()],breaks=seq(0,max(iris[,col()],l=input$Bins+1)),col=input$color,main="Histogram of iris data",xlab=names(iris[col(
#
#     )]))
#     output$Down<- downloadHandler(
#       filename = function(){
#         paste("iris",input$Btn,sep = ".")
#       }
#     )
#     content = function(file){
#       if(input$Btn == "png")
#         png(file)
#       else
#         pdf(file)
#
#       hist(iris[,col()],breaks=seq(0,max(iris[,col()],l=input$Bins+1)),col=input$color,main="Histogram of iris data",xlab=names(iris[col(
#
#       )]))
#       dev.off()
#
#     }
#
#   })
# })

#################################################################################
#Downlode handler

# shinyServer(function(input,output){
#   x<- reactive({
#     iris[,as.numeric(input$var1)]
#   })
#   y<- reactive({
#     iris[,as.numeric(input$var2)]
#   })
#   output$vin<- renderPlot({
#     plot(x(),y())
#   })
#   output$down <- downloadHandler(
#            filename = function(){
#              paste("iris",input$Btn,sep = ".")
#            },
#
#          content = function(file){
#            if(input$Btn == "png")
#              png(file)
#            else
#              pdf(file)
#            plot(x(),y())
#            dev.off()
#
#
# })})

shinyServer( function(input,output){
  output$tabs= renderUI({
    Tabs <- lapply(paste("tab no.", 1:input$n,sep=" "),tabPanel)

    do.call(tabsetPanel, Tabs)

  })
}

)



######################################################################################

library(shiny)
library(DSWbContainer)
library(RODBC)
library(ggplot2)
# shinyServer(function(input,output){
#
#
#   var <- reactive({
#                   switch(input$data1,
#                     "iris"=names(iris),
#                     "mtcars"=names(mtcars),
#                     "df"=names(df)
#                   )})
#   output$vx<-renderUI({
#     selectInput("variablex","Select (x) variable",choices = var())
#   })
#   output$vy<-renderUI({
#     selectInput("variabley","Select (y) variable",choices = var())
#   })

#
#
#    output$plo<- renderPlot({
#      attach(get(input$data1))
#      plot(x=get(input$variablex),y=get(input$variabley),xlab=input$variablex ,ylab=input$variabley)
#      #ggplot(x=get(input$variablex),y= get(input$variabley),xlab=input$Variablex,ylab=input$Variabley) + geom_line()
#
#       #ggplot(get(input$data1),aes_string(input$variablex,input$variabley)) + geom_line()
#
#
#    })
#
#
#   })
#
#
#
#
###############################################################



shinyServer(function(input,output,session){

  con <- dbConnect(odbc::odbc(),"PRTS")

 wc<-dbGetQuery(conn = con,"select * from ReportTestCRUD ")

  output$tab = renderTable({wc})



  # query <- dbo.ReportTestCRUD (DateTime,ReportId,ReportName,Status)
  # VALUES (GETDATE(), NEWID(), 'Test Name', 0)
  # do.call(con,query)





})

#install.packages("ggplot2")
#library(ggplot2)
# server <- function(input, output, session) {
#   output$droup <- renderText(input$mtcars_droup)
#   output$plot1<-renderPlot(hist(mtcars[[input$mtcars_droup]]))
#   output$plot <- renderPlot(plot(mtcars[[input$mtcars_droup]]))
#
# }
########################################################################
# server <- function(input, output, session) {
#
#   var <- reactive({
#     switch(input$data1,
#            "iris"=names(iris),
#            "mtcars"=names(mtcars),
#            "df"=names(df)
#     )})
#   output$vx<-renderUI({
#     selectInput("variablex","Select (x) variable",choices = var())
#   })
#   output$vy<-renderUI({
#     selectInput("variabley","Select (y) variable",choices = var())
#   })
#   output$plo<- renderPlot({
#     attach(get(input$data1))
#     plot(x=get(input$variablex),y=get(input$variabley),xlab=input$variablex ,ylab=input$variabley)
    #ggplot(x=get(input$variablex),y= get(input$variabley),xlab=input$Variablex,ylab=input$Variabley) + geom_line()

    #ggplot(get(input$data1),aes_string(input$variablex,input$variabley)) + geom_line()

#
#   })
#
#
#
#
#
#   output$droup <- renderText(input$mtcars_droup)
#   output$plot1<-renderPlot(hist(mtcars[[input$mtcars_droup]]))
#   output$plot <- renderPlot(plot(mtcars[[input$mtcars_droup]]))
#
# }


library(shiny.fluent)
library(shiny)
server <- function(input, output, session) {
  observeEvent( input$Update,{
    selected_option<- input$comboboxselection
    output$selectedoption<- renderText({
      paste(selected_option)
    })
  } )
}

#shinyApp(ui, server)

library(shiny.fluent)
library(shiny)
shinyServer(function(input,output,session){
  output$img<- renderImage({
    img<-"DS.png"
    list(src=img)
  })
  observeEvent( input$Update,{
    selected_option<- input$comboboxselection
    output$selectedoption<- renderText({
      paste(selected_option)
    })
  } )
}
 )


































