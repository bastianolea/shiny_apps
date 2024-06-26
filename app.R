library(shiny)
library(colorspace)

# color_fondo = "#222222"
color_fondo = "#140a19"
# color_fondo = "#c8b1de"
# color_fondo = "white"
color_texto = "#d3c7dd"
color_enlaces = "#ba9bd7" #"#c8b1de"

color_relacionador = "#2c0d12"
color_texto_relacionador = "#fecea8"
color_comparador = "#2a241d" #"#44443a"
color_texto_comparador = "#cdcdb7"
color_brechas = "#1c0e44"
color_texto_brechas = "#c1abfb"
color_corrupcion = "#111111"
color_texto_corrupcion = "#DDDDDD"

estilo_cajas <- "margin: 30px; padding: 16px; padding-top: 1px; 
                 height: 400px; width: 300px;
                 border-radius: 8px;"

estilar_cajas <- function(.color_fondo, .color_texto) {
  c(estilo_cajas, 
    paste("background-color: ", .color_fondo, "; 
          color: ", .color_texto, " !important;
          outline: 1px solid ", colorspace::lighten(.color_fondo, 0.07), ";
          ")
    # box-shadow: 0px 10px 50px -20px ",  colorspace::lighten(.color_fondo, 0.1), ";
    
    )
}

ui <- fluidPage(title = "Visualizadores de datos", lang = "es",
  
  tags$style(paste("
             body {
             background-color: ", color_fondo, ";
             }")),
  
  tags$style(paste("
            
             
             a {
             color: ", color_enlaces, ";
             }
           
             a:hover {
             color: #724be7;
             text-decoration: none !important;
             }
             
             h1 {
             color: ", color_texto, ";
             }
             ")),
  
  fluidRow(
    column(12, style = paste("margin-bottom: 18px; font-size: 120%; 
                             color: ", color_texto, ";
                             margin-left: 30px; margin-right: 30px;"),
           
           h1("Visualizadores de datos en R/Shiny", 
              style = paste("margin-bottom: 24px; color:", color_enlaces, ";")),
           
           div(style = paste("padding: 14px; padding-bottom: 6px; background-color: #1c0e24; border-radius: 6px;
               margin-bottom: 20px; font-size: 88%;", 
               "outline: 1px solid ", colorspace::lighten("#1c0e24", 0.05), ";"),
           p("Portafolio de aplicaciones web de código abierto diseñadas y programadas por",
             tags$a("Bastián Olea Herrera,", target = "_blank", href = "https://bastian.olea.biz"),
             "magíster en sociología y", em("data scientist."))
           ),
           
           p("Estas apps han sido desarrolladas usando el ",
             tags$a("lenguaje de programación estadística y de código abierto R,", target = "_blank", href = "https://github.com/bastianolea/casen_genero_brechas"),
             "bajo el paradigma de los paquetes",
             tags$a("{tidyverse} para manipulación, limpieza y procesamiento de datos,", href = "https://www.tidyverse.org", target = "_blank"),
             "junto al",
             tags$a("paquete {shiny} para desarrollar aplicaciones web interactivas.", target = "_blank", href = "https://github.com/bastianolea/casen_genero_brechas")
           ),
           
           p("El código de las aplicaciones está disponible en sus respectivos", 
             tags$a("repositorios GitHub", href = "https://github.com/bastianolea?tab=repositories", target = "_blank"),
             "incluendo todo el proceso de desarrollo, desde la descarga y limpieza de datos hasta el diseño de la interfaz de las apps."),
           
           p("La idea es que otras personas puedan usar estas aplicaciones libremente, y revisar el código para aportar o bien para aprender a programar en R, contribuyendo así a la comunidad de usuarios de R en Chile."),
           
           p("Puedes encontrar mi información de contacto en",  
             tags$a("mi sitio web.", href = "https://bastian.olea.biz", target = "_blank"))
    )
  ),
  
  fluidRow(
    column(12, align = "center",
           
           #brechas de género ----
           tags$a(
             column(4, style = estilar_cajas(color_brechas, color_texto_brechas),
                    h3("Brechas de género Casen"),
                    tags$img(src = "brechas_genero_casen.png", style = "height: 200px; margin-bottom: 4px;"),
                    p("Visualizador que detalla brechas de género sociales, de vivienda e ingresos, para analizar variables en las que las mujeres experimentan peores condiciones de vida, a nivel regional")
             ),
             href = "https://bastianoleah.shinyapps.io/casen_brechas_genero/", target = "_blank"),
           
           
           #comparador ----
           tags$a(
           column(4, style = estilar_cajas(color_comparador, color_texto_comparador),
                  h3("Comparador de ingresos Casen"),
                  tags$img(src = "comparador_casen.png", style = "height: 200px;  margin-bottom: 6px;"),
                  p("Visualizador que compara las distribuciones y promedios de ingreso de múltiples comunas, para observar las diferencias en las realidades socioeconómicas de la población chilena")
           ),
           href = "https://bastianoleah.shinyapps.io/casen_comparador_ingresos/", target = "_blank"),
           
           
           #relacionador ----
           tags$a(
             column(4, style = estilar_cajas(color_relacionador, color_texto_relacionador), 
                    h3("Relacionador de variables Casen"),
                    tags$img(src = "relacionador_casen.png", style = "height: 200px;  margin-bottom: 6px;"),
                    p("Visualizador que permite relacionar hasta 3 variables socioeconómicas en un gráfico de dispersión por comunas, para analizar la relación entre ellas"),
             ),
             href = "https://bastianoleah.shinyapps.io/casen_relacionador/", target = "_blank"),
           
           #corrupción ----
           tags$a(
             column(4, style = estilar_cajas(color_corrupcion, color_texto_corrupcion), 
                    h3("Visualizador de casos de corrupción"),
                    # tags$img(src = "relacionador_casen.png", style = "height: 200px;  margin-bottom: 6px;"),
                    p(em("Próximamente..."), style = "margin: 80px;"),
                    p("Aplicación web que cataloga y visualiza todos los casos de corrupción más trascendentes del úlltimo tiempo en Chile, para poner en perspectiva los montos, responsables, y sectores políticos asociados"),
             ),
             href = "https://github.com/bastianolea/corrupcion_chile", target = "_blank"),
    )
  ),
  
  fluidRow(
    column(12,
           br(),
           br()
    )
  )
)



# readr::write_file(as.character(ui), file = "index.html")

server <- function(input, output) {
}


shinyApp(ui = ui, server = server)
