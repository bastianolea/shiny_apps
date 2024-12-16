library(shiny)

shinyAppDir("~/R/economia_chile/app")
shinyAppDir("~/R/prensa/apps/prensa_chile")





comando <- 'shiny::runApp("~/R/economia_chile/app", port = 4060)'
system2(paste("R -e", comando))

browseURL("http://127.0.0.1:4060")

library(sys)
exec_background(cmd = "bin/R", comando)

R.home("bin/R")

exec_r(comando)

r_background(args = c('--vanilla', comando))
r_wait(c('--vanilla', '-q', '-e', 'sessionInfo()'))
