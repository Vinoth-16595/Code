getwd()
setwd("C:/Users/vinot/OneDrive/Desktop/R Shiny")
getwd()
library("shiny")

#  Basics of shiny and textinput , textoutput, radiobutton

# shinyUI(
# fluidPage(
#
#   titlePanel("This is my first shiny web app"),
#
#   sidebarLayout( #position = "right",
#     sidebarPanel(("Enter the personal details"),
#
#     textInput("Name","Enther your name",""),
#     textInput("Age","Enter your age",""),
#     radioButtons("Gender","Enter your gender", list("Male","Female"),"")),
#
#
#     mainPanel(("This is my main panal will display output"),
#     textOutput("myname"),
#     textOutput("myage"),
#     textOutput("mygender")
#
#   )
# )
# )
# )
#
# runExample()
# runExample("01_hello")

#############################################################################################################
# This is example for slider input

# shinyUI( fluidPage(
#   titlePanel("This is slider example"),
#   sidebarLayout(
#     sidebarPanel(
#       sliderInput("Age","select you age", min = 18,max = 32,value = 18,animate = T,step = 2)
#
#       ),
#     mainPanel(
#       textOutput("age")
#     )
# )
# )
# )
#####################################################################################################
# selected  use to select specific name
# selectize use to droup down button up and down
# multiple use to select multiple name

# shinyUI( fluidPage(
#   titlePanel("This is selectInput example"),
#   sidebarLayout(
#
#     sidebarPanel( selectInput("TeamNames","select the name", c("Vino","Jeremiah","Kelly","Shan"),selected = "Shan",selectize = TRUE,multiple = TRUE)),
#     mainPanel(
#       textOutput("name")
#     )
#   )
# )
#
# )
########################################################################################################
#Example of render plot
# shinyUI( fluidPage(
#   titlePanel("Render plot example "),
#   sidebarLayout(
#     sidebarPanel(
#       selectInput("var","Select the variable", c ("Sepal.Length"=1,"Sepal.Width "=2,"Petal.Length"=3,"Petal.Width"=4)),
#       sliderInput("Bins","Select the bins",min =5 , max =25,value = 15 ),
#       radioButtons("color","Select the colour", c ("Red","Blue","Green"))
#     ),
#     mainPanel(
#       plotOutput("hist")
#     )
#   )
# )
#
# )

##############################################################################################3
#Example of Tabset
# shinyUI( fluidPage(
#   titlePanel("Render plot example "),
#   sidebarLayout(
#     sidebarPanel(
#       selectInput("var","Select the variable", c ("Sepal.Length"=1,"Sepal.Width "=2,"Petal.Length"=3,"Petal.Width"=4)),
#       sliderInput("Bins","Select the bins",min =5 , max =25,value = 15 ),
#       radioButtons("color","Select the colour", c ("Red","Blue","Green"))
#     ),
#     mainPanel(
#       tabsetPanel(
#         tabPanel("summary",verbatimTextOutput("summ")),
#         tabPanel("structure",verbatimTextOutput("str")),
#         tabPanel("data",tableOutput("data")),
#         tabPanel("plot",plotOutput("hist"))
#       )
#     )
#   )
# )
# )

###################################################################################
# downlode handler

# shinyUI( fluidPage(
#   titlePanel("Render plot example "),
#   sidebarLayout(
#     sidebarPanel(
#       selectInput("var1","Select the variable", c ("Sepal.Length"=1,"Sepal.Width "=2,"Petal.Length"=3,"Petal.Width"=4)),
#       selectInput("var2","Select the variable", c ("Sepal.Length"=1,"Sepal.Width "=2,"Petal.Length"=3,"Petal.Width"=4)),
#       submitButton("update"),
#
#      # sliderInput("Bins","Select the bins",min =5 , max =25,value = 15 ),
#       radioButtons("Btn","Slect the type", list("png","pdf"))
#       #radioButtons("color","Select the colour",c ("Red","Blue","Green"))
#
#     ),
#     mainPanel(
#       plotOutput("vin"),
#       downloadButton("down","Downlode the plot")
#
#       # tabsetPanel(
#       #   tabPanel("summary",verbatimTextOutput("summ")),
#       #   tabPanel("structure",verbatimTextOutput("str")),
#       #   tabPanel("data",tableOutput("data")),
#       #   tabPanel("plot",plotOutput("hist"))
#       #
#       # )
#     )
#   )
# )
#
# )

shinyUI( fluidPage(
  titlePanel("Multi tab try"),
  sidebarLayout(
    sidebarPanel(
      numericInput("n","Select the no pf tab ",1)
    ),
    mainPanel(
      uiOutput('tabs')
    )
  )
)

)
#####################################################################################
setwd("C:/Users/vinot/OneDrive/Desktop/R Shiny")

getwd()

#df
#typeof(df$DateTime)

# shinyUI( fluidPage(
#   titlePanel("Wellbore project"),
#   sidebarLayout(
#     sidebarPanel(
#     sliderInput("Date","select your date", min =df$DateTime,max =df$DateTime,value =2022-11-10 )
#
#     ),
#     mainPanel("Main panal")
#   )
# )
#
# )
#########################################################################################################33

#Dynamic x and y variable in shiny
# library(shiny)
# library(DSWbContainer)
# library(RODBC)
# library(ggplot2)
# conn <- odbcConnect(paste("PRTS", "; Trusted_Connection=", "Yes", sep = ""))
# wellbore_container <- Wellbore_Container$new()
# wellbore_container$loadFromSQLById(conn, "261AAD97-977C-4C9C-8CE4-9ED577816BBC")
#
# wellbore_container$Wells
# mnemonics<- c("BLOCK_POS", "BIT_DEPTH", "AVG_ROP_FT_HR", "TOT_DPT_MD", "FLOW_IN", "TD_SPEED", "WOB", "HOOKLOAD_MAX", "STP_PRS_1", "TD_TORQUE", "FLOW_OUT_REL", "GAINLOSS")
# startIndex <-"2022-11-10T21:11:00.000Z"
# endIndex <- "2022-11-11T21:11:00.000Z"
# wellbore_container$getTableData(conn, mnemonics, 1, "2022-11-10T21:11:00.000Z", "2022-11-11T21:11:00.000Z")
# df <- wellbore_container$timeData
#
#
#
# shinyUI(fluidPage(
#   titlePanel("Welbore Try"),
#   sidebarLayout(
#     sidebarPanel(
#
#       #selectInput("var1","Select the x variable", c("DateTime"=1,"GAINLOSS"=2,"FLOW_OUT_REL"=3,"FLOW_IN"=4)),
#       #selectInput("var2","Select the y variable",c("DateTime"=1,"$GAINLOSS"=2))
#       #selectInput("var","Select the variable", c ("Sepal.Length"=1,"Sepal.Width "=2,"Petal.Length"=3,"Petal.Width"=4)),
#       selectInput("data1","Select the data", choices = c("iris","mtcars","df")),
#       uiOutput("vx"),
#       uiOutput("vy")
#     ),
#     mainPanel(plotOutput("plo"))
#   )
# ))

##############################################################################################################
library(shiny)
library(DSWbContainer)
library(RODBC)
library(ggplot2)
library(odbc)

# conn <- odbcConnect(paste("PRTS", "; Trusted_Connection=", "Yes", sep = ""))
# wellbore_container <- Wellbore_Container$new()
# wellbore_container$loadFromSQLById(conn, "802F9588-D72C-4DCC-ADE6-9D3B4AF0230D")
#
# con <- dbConnect(odbc::odbc(),"PRTS")
#
# wc<-dbGetQuery(conn = con,"select * from ReportTestCRUD ")


shinyUI( fluidPage(

  titlePanel("Load data from SQL"),
  tabsetPanel(
    tabPanel("vino"),
    tabPanel("Jeremiah"),
    tabPanel("Kelly")),


  sidebarLayout(
    sidebarPanel(submitButton("up","update")),


    mainPanel( tableOutput("tab")
))))


# install.packages("shiny.semantic")
# remotes::install_github("Appsilon/shiny.semantic@develop")
# installed.packages("graphics")
# library(graphics)
# library(utils)
#
# library(shiny)
# library(shiny.semantic)
# ui <- semanticPage(
#   title = "My first page",
#   h1("My page")
# )




#################################################################################
# getwd()
# setwd("C:/Users/vinot/OneDrive/Desktop/R Shiny/New folder/shiny.sementic")
# library(shiny.semantic)
# library(shiny)
# library(ggplot2)
#
# grid_charts <- grid_template(
#   default = list(areas = rbind(c("chart1", "chart2")),
#                  rows_height = c("100%"),
#                  cols_width = c("50%", "50%"))
# )
#
# shinyUI(fluidPage(
#   ui <- semanticPage(
#     title ="My page",
#     h1("My first shiny.sememtic page"),
#     sidebar_layout(
#       sidebar_panel(
#         dropdown_input("mtcars_droup", c("mpg", "cyl", "disp", "hp"),value = "mpg"),
#         textOutput("droup")
#       ),
#       main_panel(
#         segment(
#           cards(
#             class="three",
#             card(class = "red",
#                  div(class = "content",
#                      div(class = "header", "Jeremiah "),
#                      div(class = "meta", "JviewLLC"),
#                      #div(class = "description", "More detail description card 1"),
#
#                  )
#             ),
#             card(class = "green",
#                  div(class = "content",
#                      div(class = "header", "Kelly"),
#                      div(class = "meta", "JviewLLC"),
#                      #div(class = "description", "More detail description card 2"),
#
#                  )
#             ),
#             card(class ="yellow",
#                  div(class= "New",
#                 div(class = "header", "Vinoth"),
#                 div (class="meta","JviewLLc"),
#                 div(class="description","Need 'you can write"))),
#
#             grid( grid_charts,
#                   chart1= plotOutput("plot"),
#                   chart2=plotOutput("plot1"),
#                   )
#
#            # plotOutput("plot2")
#
#
#       )
#     )
#   )
# )
#         )
# ))


######################################################################################

# shiny.fluent
# library(shiny)
# library(shiny.fluent)
# install.packages("shiny.fluent")
# remotes::install_github("Appsilon/shiny.fluent")
# ui <- function(id) {
#   ns <- NS(id)
#   div(
#     Checkbox.shinyInput(ns("checkbox"), value = FALSE),
#     textOutput(ns("checkboxValue"))
#   )
# }
# server <- function(id) {
#   moduleServer(id, function(input, output, session) {
#     output$checkboxValue <- renderText({
#       sprintf("Value: %s", input$checkbox)
#     })
#   })
# }
##################################################################################

# library(shiny.semantic)
# library(shiny)
#
#
# shinyUI(fluidPage(
#   ui <- semanticPage(
#     title ="My page",
#     h1("My first shiny.sememtic page"),
#     sidebar_layout(
#       sidebar_panel(
#         selectInput("data1","Select the data", choices = c("iris","mtcars","df")),
#         uiOutput("vx"),
#         uiOutput("vy"),
#         submitButton("update")
#       ),
#       main_panel(
#         segment(
#           cards(
#             class="three",
#             card(class = "red",
#                  div(class = "content",
#                      div(class = "header", "Jeremiah "),
#                      div(class = "meta", "JviewLLC"),
#                      #div(class = "description", "More detail description card 1"),
#
#                  )
#             ),
#             card(class = "green",
#                  div(class = "content",
#                      div(class = "header", "Kelly"),
#                      div(class = "meta", "JviewLLC"),
#                      #div(class = "description", "More detail description card 2"),
#
#                  )
#             ),
#             card(class ="yellow",
#                  div(class= "New",
#                      div(class = "header", "Vinoth"),
#                      div (class="meta","JviewLLc"),
#                     #div(class="description","Need 'you can write")
#                     )),
#
#
#                   (plotOutput("plo"))
#
#
#
#             # plotOutput("plot2")
#
#
#           )
#         )
#       )
#     )
#   )
# ))

library(shiny.fluent)
library(shiny)
# shinyUI(
#   fluentPage(
#     Text( "Hello world!"),
#     submitButton("Submit"),
#     mainPanel( selectInput("var1","Select the variable", c ("Sepal.Length","Sepal.Width ","Petal.Length","Petal.Width")) ),
#    #ComboBox.shinyInput("Bttn")
#
#   )
# )

#  ui <- fluentPage(
#    Text( "Hello world!"),
#  submitButton("Submit")
#############################################################################
# This will creat a update action button

# library(shiny.fluent)
# library(shiny)
# shinyUI( fluidPage(
#   Text(variant = "xlarge","shiny fluent button example"),
#   PrimaryButton(
#     text="UPdate",
#     onClick = JS("function(){alert('Button click');}")
#   ),
#   mainPanel("Hello")
#
#
# )
#   )
###############################################################################
#Creating abutton using combobox

library(shiny.fluent)
library(shiny)

 shinyUI(
   fluidPage(
     Stack(

       style=list(backgroundColor="gray"), minHeight ="200vh",
       verticalAlign="down",
       horizontalAlign="center",
       PrimaryButton(

         text="Update",
         style="flew-grow:1",
         onClick = JS("function(){alert('Button click');}"),


         #style="position: absolute; right:50px top:0px;"
       ),

       actionButton("Btn", label = icon("bars",class = "command-icon")),
       fluidRow(


       Text("Configaration"),
       textInput("typ","Type"),
       textInput("crd","Cards")
       ),



     tokens = list(childrenGap=50),
      fluidRow(

      column(2, actionButton("edi",label = icon("plus"))),
      column(2, actionButton("edi",label = icon("edit"))),
      column(2,actionButton("btn",label = icon("search"))),
      column(2, actionButton("edi",label = icon("copy"))),
      column(2, actionButton("edi",label = icon("trash"))),
      column(2, actionButton("edi",label = icon("refresh")))

     ),
     #Text(variant = "xlarge","shiny fluent button example and combo box"),

     ComboBox("comboboxselection",
              "Select an option",
              options= list(
                list(key="A",text = "Select o
                     ption 1"),
                list(key="B",text = "Select option 2"),
                list(key="C",text = "Select option 3"),
                list(key="D",text = "Select option 4")
              ),
              #allowFreeform = TRUE,
              #  it change the width of the dropdown bar
             # style = "width: 200px",
             # it will change the background color of page
              style=list(minHeight = "50vh"),
               ),
     div(fluidRow(
       horizontal=TRUE,

       column(2, actionButton("SaveReport",label = "save")),

       column(2, actionButton("CancleReport","Cancle")),
     )),





     textOutput("selectedoption")
)
   )
 )
library(shiny.fluent)
library(shiny)
shinyUI( fluidPage(
  Stack(

    #style=list(backgroundColor="gray"), minHeight ="200vh",
    #style =list("center"),
    style=list(backgroundColor="gray"), minHeight ="50vh",

    horizontalAlign="center",
    #tokens = list(childrenGap=10),
    fluidRow(
      column(2,actionButton("Btn", label = icon("bars",class = "command-icon"))),
      #column(2, img(src = "DS.PNG"))
      #style="space-between",
      column(2,imageOutput("img")),
      br(),
      br(),
      br(),
      br(),
      br(),
      column(2,actionButton("edi",label = icon("plus"))),
      column(2, actionButton("edi",label = icon("edit"))),

      column(2,actionButton("btn",label = icon("search"))),
      column(2, actionButton("edi",label = icon("copy"))),
      #column(2, actionButton("edi",label = icon("trash"))),
      #column(2, actionButton("edi",label = icon("refresh")))
      br(),
      br(),
      br(),
      br(),

      ComboBox("comboboxselection",
               "Select an option",
               options= list(
                 list(key="A",text = "Select o
                     ption 1"),
                 list(key="B",text = "Select option 2"),
                 list(key="C",text = "Select option 3"),
                 list(key="D",text = "Select option 4")
               ),
               #allowFreeform = TRUE,
               #  it change the width of the dropdown bar
               # style = "width: 200px",
               # it will change the background color of page
               style=list(minHeight = "100vh"),
      ),

),
# fluidRow(
#   column(2,actionButton("Save","save")),
#   br(),
#   column(2,actionButton("Save","cancle"))
#
# )
)
)
)




























