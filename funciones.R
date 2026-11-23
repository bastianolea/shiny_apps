# los estilos de estas funciones están en estilos.scss;
# acá solo se entregan los colores propios de cada app como variables css
variables_colores <- function(colores) {
  glue(
    "--caja-fondo: {colores$fondo}; --caja-texto: {colores$texto}; --caja-borde: {colores$borde};"
  )
}


caja_app <- function(titulo, texto, enlace, colores, imagen) {
  card(
    class = "cajas",
    style = variables_colores(colores),

    div(
      class = "caja_titulo",
      tags$a(
        h3(titulo, class = "titulo_app"),
        href = enlace,
        target = "_blank"
      )
    ),

    div(
      class = "caja_imagen",
      tags$a(
        tags$img(src = imagen, alt = titulo),
        href = enlace,
        target = "_blank"
      )
    ),

    div(class = "caja_texto", texto)
  )
}


caja_app_chica <- function(titulo, texto, enlace, color) {
  colores <- list(
    fondo = color,
    texto = color |> colorspace::lighten(1),
    borde = color |> colorspace::lighten(0.3)
  )

  out <- tags$a(
    class = "enlace_cajita",
    div(
      class = "cajas cajita",
      style = variables_colores(colores),

      div(
        h3(titulo),
      ),

      div(class = "cajita_texto", texto)
    ),
    href = enlace,
    target = "_blank"
  )

  return(out)
}

cuadro_intro <- function(...) {
  div(class = "cuadro_intro", ...)
}


cuadro_aviso <- function(...) {
  div(class = "cuadro_aviso", ...)
}


cafecito <- function() {
  div(
    class = "cafecito",
    HTML(
      '<script type="text/javascript" 
         src = "https://cdnjs.buymeacoffee.com/1.0.0/button.prod.min.js" 
         data-name="bmc-button" data-slug="bastimapache" data-color="#FFDD00" data-emoji="" data-font="Bree" 
         data-text="Regálame un cafecito" 
         data-outline-color="#000000" data-font-color="#000000" data-coffee-color="#ffffff" ></script>'
    )
  )
}
