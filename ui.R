shinyUI(pageWithSidebar(
  headerPanel("Examine the Normal Distribution"),
  sidebarPanel(
    selectInput("select", label = h3("Choose Plot"), 
                choices = list("Density" = 1, "Distribution" = 2), selected = 1),
    # sliderInput('mu', 'Choose the mean',value = 0, min = -2, max = 2, step = 0.05,),
    # sliderInput('sd', 'Choose the standard deviation',value = 1, min = 0.1, max = 4, step = 0.05,),
    uiOutput("slider1"),
    uiOutput("slider2"),
    
    actionButton('reset',"Reset"),
    h2("What can I do?", align = "center"),
    p("First, choose the plot you wish to see: Density or Distribution"),
    p("Second, choose the mean and variance values with the two sliders above."),
    p("With Reset you can set all sliders to default values again."),
    h2("What do I see?", align = "center"),
    p("There is a curve of the densitiy (or distribution) for a normal distribution with the
      given mean and standard deviation colored in red."),
    p("For better comparision, you see a second curve of a standard normal distribution
      (mean = 0 and standard deviation = 1) colored in gray.")
    
  ),
  mainPanel(
    plotOutput('newPlot')
  )
))