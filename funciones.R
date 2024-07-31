
tag_css <- function(text) {
  tags$style(glue(text, .open = "{{", .close = "}}"))
}

estilo_cajas <- "margin: 18px; padding: 20px; padding-bottom: 1px; padding-top: 1px; 
                 min-height: 400px; max-width: 380px;
                 border-radius: 8px;
                 font-size: 90%; text-align: center;
                 margin: auto;
                 margin-bottom: 36px; margin-top: 36px;
                 "

estilar_cajas <- function(colores) {
  c(estilo_cajas, 
    paste("background-color: ", colores$fondo, "; 
          color: ", colores$texto, " !important;
          outline: 1px solid ", colores$borde, ";
          ")
  )
}

estilar_cajitas <- function(colores) {
  c("margin: 18px; padding: 16px; padding-bottom: 12px; padding-top: 1px; 
                 min-height: 120px; max-width: 380px;
                 border-radius: 8px;
                 font-size: 80%; text-align: left;
                 margin: auto;
                 margin-bottom: 20px; margin-top: 20px;
                 ", 
    paste("background-color: ", colores$fondo, "; 
          color: ", colores$texto, " !important;
          outline: 1px solid ", colores$borde, ";
          ")
  )
}



caja_app <- function(titulo = "Delincuencia en Chile",
                     texto = "Aplicación",
                     enlace = "https://bastianoleah.shinyapps.io/delincuencia_chile/",
                     colores,
                     imagen = "www/delincuencia_chile.png",
                     estilo_imagen = "height: 150px; margin: 22px; margin-top: 8px;",
                     colores_claros = FALSE
) {
  tags$a(
    div(class = ifelse(colores_claros == FALSE, "icono", "icono_claro"),
        style = estilar_cajas(colores), 
        
        div(style = css(margin_top = "-10px"),
            h3(titulo)
        ),
        
        tags$img(src = imagen, 
                 style = estilo_imagen),
        div(style = "text-align: left !important;",
            texto
        )
    ),
    href = enlace, 
    target = "_blank")
}


caja_app_chica <- function(titulo = "App",
                           texto = "Aplicación",
                           enlace = "www.wikipedia.org",
                           color
) {
  
  colores <- list(fondo = color, #|> darken(0.5) |> desaturate(0.1),
                  texto = color |> lighten(1),
                  borde = color |> lighten(0.3))
  
  out <- tags$a(
    div(class = "icono", 
        style = estilar_cajitas(colores), 
        
        div(style = css(margin_top = "-14px"),
            h3(titulo, style = "font-size: 120%;"),
        ),
        
        div(style = "text-align: left !important; opacity: .7;",
            texto
        )
    ),
    href = enlace, target = "_blank") 
  
  return(out)
}