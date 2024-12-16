
library(shiny)

run_app <- function(host = "127.0.0.1", port = 49152) {
  ui <- bslib::page_sidebar() # bs4Dash creates nice-looking Shiny UIs.
  server <- function(input, output, session) {}
  shiny::shinyApp(ui, server, options = list(host = host, port = port))
  # shiny::shinyAppDir("~/R/economia_chile/app/", options = list(host = host, port = port))
}
# Next, launch the app in a callr::r_bg() background process.
run_app()

args <- list(host = "127.0.0.1", port = 5038)
process <- callr::r_bg(func = run_app, args = args)

# At this point, the app may take an unpredictable length of time to initialize. With pingr, we can wait until the app comes online. 4 We also check if the background process quit early and forward any errors to the parent process. 5

while(!pingr::is_up(destination = "localhost", port = 5038)) {
  if (!process$is_alive()) stop(process$read_all_error())
  Sys.sleep(0.01)
}

# After the loop completes, open the app in a web browser.

browseURL("http://127.0.0.1:5038", )
# N