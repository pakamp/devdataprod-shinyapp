
library(shiny)
 
# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Showing Datasets"),
  
  # Sidebar with controls to provide a caption, select a dataset, and 
  # specify the number of observations to view. Note that changes made
  # to the caption in the textInput control are updated in the output
  # area immediately as you type
  sidebarLayout(
    sidebarPanel(
      textInput("caption", "Caption (this is a caption you can change):", "Dataset summary"),
      
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("faithful", "trees", "iris")),
      
      numericInput("obs", "Number of observations to view in Table:", 3)
    ),
    
    
    # Show the caption, a summary of the dataset, 
    # pair plot and an HTML table with
    # the requested number of observations
    mainPanel(
      h3(textOutput("caption")), 
      
      h5('This is summary of the full dataset'),
      
      verbatimTextOutput("summary"), 
      
      
      h3(' '),
      h3('Pair Plot'),
      h5('This plot shows ALL the possible 2D scatterplots in a given dataset'),
      plotOutput("pairplot"),
      
      
      h3(' '),
      h3('Table'),
     
      tableOutput("view")
    )
  )
))