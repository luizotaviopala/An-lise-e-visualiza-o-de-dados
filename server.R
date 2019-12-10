# Shiny
# Ajuste de séries temporais
#===============================================================

library(ggplot2)
library(corrplot)

function(input, output) {
  
  
  variaveis <- reactive({
    
    dados <<- read.table(input$serie$datapath,h=T)
    dados
  })
  
  
  
  
  
  modelo <- reactive({
    var_modelo <- variaveis()
    colnames(var_modelo)[1] <- "y"
    modelo <- lm(data=var_modelo,y~.)
    modelo
  })
  
  output$dados <- renderDataTable({
    if(input$atualizar==0){
      NULL
    }else{
      variaveis()
    }
    
  })
  
  output$disp <- renderPlot({
    plot(x = 1:nrow(variaveis()),y = variaveis()$Passageiros,type = "l")

  })
  
  
  output$modelo_ajustado <- renderPrint({
    
    summary(modelo())
  })
  
  
#  output$corrplot <- renderPlot({
#    correlacoes <- cor(mtcars[,c(input$y,input$x)])
#    corrplot(correlacoes,type = "lower",tl.col="black",number.digits = 2,method = "shade",addCoef.col = "black",tl.pos = "ld",diag=F)
#
#  })
  
  
#  output$betas <- renderPrint({
#    summary(modelo())
#    
#  })
  
#  output$imprimirmodelo <- renderPrint({
#    anova(modelo())
    
#  })
  
#  output$icparametros <- renderTable({
#    confint(modelo(),level = as.numeric(input$nivelconfianca))
#  },rownames = T)
  
#  output$valorespreditos <- renderTable({
#    fitted(modelo())
  
#  },rownames = T,colnames = F)
  
#  output$residuos <- renderTable({
#    residuals(modelo())
    
#  },rownames = T,digits = 6,colnames = F)
  
#  output$cov <- renderTable({
#    vcov(modelo())
    
#  },digits = 6)
  
  
  
  
  
  
  
}
