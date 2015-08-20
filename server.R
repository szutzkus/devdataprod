library(ggplot2)
shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({

      m<-input$mu
      s<-input$sd
      x <- seq(-4,4,0.01)
      p <- input$select
      
      if (p==1){
        plot(x, dnorm(x, mean=m, sd=s),type="l")
        y1 <- dnorm(x, mean=m, sd=s)
        y2 <- dnorm(x,0,1)
        ylable <- "Y = dnorm(X)"
      } else {
        y1 <- pnorm(x, mean=m, sd=s)
        y2 <- pnorm(x,0,1)
        ylable <- "Y = pnorm(X)"
      }
      
      df <- data.frame(x,y1,y2)
      
      g <- ggplot(df, aes(x))                    
        g <- g + geom_line(aes(y=y1), colour="red", size=2)   
        g <- g +   geom_line(aes(y=y2), colour="gray")  
        g <- g + ylab(ylable) + xlab("X")
      g
            
      })

# sliderInput('mu', 'Choose the mean',value = 0, min = -2, max = 2, step = 0.05,),
# sliderInput('sd', 'Choose the standard deviation',value = 1, min = 0.1, max = 4, step = 0.05,),

    output$slider1 <- renderUI({
      input$reset
      sliderInput(inputId = "mu",
                  label = "Choose the mean:",
                  value = 0, min = -2, max = 2, step = 0.05)
    })

    output$slider2 <- renderUI({
      input$reset
      sliderInput(inputId = "sd",
                  label = "Choose the standard deviation:",
                  value = 1, min = 0.1, max = 4, step = 0.05)
    })

  }
)