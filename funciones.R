
tag_css <- function(text) {
  tags$style(glue(text, .open = "{{", .close = "}}"))
}

estilo_cajas <- "margin: 18px; padding: 20px; padding-bottom: 1px; padding-top: 1px; 
                 min-height: 400px; max-width: 420px;
                 border-radius: 8px;
                 font-size: 90%; text-align: center;
                 margin: auto;
                 text-decoration: none !important; 
                 margin-bottom: 36px; margin-top: 36px;
                 "

estilar_cajas <- function(colores) {
  c(estilo_cajas, 
    paste("background-color: ", colores$fondo, "; 
          color: ", colores$texto, " !important;
          text-decoration: none !important; 
          margin: 3px;
          margin-top: 16px;
          margin-left: auto; margin-right: auto;
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
                 text-decoration: none !important; 
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
  tags$a(style = "text-decoration: none !important;",
         div(style = "padding: 4px;",
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
  
  out <- tags$a(style = "text-decoration: none !important;",
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

cuadro_intro <- function(...) {
  div(
    style = css(padding = "16px", padding_bottom = "1px", 
                background_color = color_destacado,
                color = colorspace::lighten(color_texto, 0.2),
                border_radius = "6px",
                margin_left = "30px", margin_right = "30px",
                margin_bottom = "20px", font_size = "82%",
                outline = paste("1px solid ", colorspace::lighten(color_destacado, 0.05))),
    ...
  )
}


cuadro_aviso <- function(...) {
  div(
    style = c(
      css(padding = "16px", padding_bottom = "1px", 
          background_color = color_destacado,
          color = lighten(color_texto, 0.2),
          border_radius = "6px",
          margin = "20px",
          margin_top = "40px",
          margin_left = "30px", margin_right = "30px",
          font_size = "80%",
          outline = paste("1px solid ", lighten(color_destacado, 0.05))
      ),
      # configuración de la animación de fondo
      "animation-name: pulse; 
                       animation-duration: 0.8s; 
                       animation-iteration-count: infinite; 
                       animation-direction: alternate-reverse;
                       animation-timing-function: linear;"
    ),
    ...
  )
}