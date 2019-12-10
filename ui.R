# Aplicativo shiny
#===============================================================

library(shiny)
library(shinydashboard)

dados = data.frame(Passageiros= AirPassengers)

dashboardPage(dashboardHeader(title = "Séries temporais",titleWidth = 300),
  dashboardSidebar(
    
    conditionalPanel(condition = "input.abaselecionada==1",fileInput("serie","Selecione a série temporal"),
    actionButton("atualizar",label = "Exibir dados selecionados")),
    conditionalPanel(condition = "input.abaselecionada==5",numericInput("nivelconfianca",label = "Nível de confiança",value = 0.95,min = 0,max = 1))
    

    
  ),
  
  dashboardBody(
    tabsetPanel(type = "tab",
      tabPanel("Leitura da Série",dataTableOutput("dados"),value = 1),
            tabPanel("Gráfico",plotOutput("disp"),value = 2),
      tabPanel("Modelo",verbatimTextOutput("modelo_ajustado"),value = 3)
    ,id = "abaselecionada")
  )
)

  