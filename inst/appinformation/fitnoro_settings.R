############################################################
#This is a file for the noro fit model comparison fit
#it contains additional information that helps properly process it
############################################################

appsettings = list()

#Title of app, to be displayed on top of analyze tab
appsettings$apptitle = "Model comparison"

#name of underlying simulation function(s) to be used in the app
#must be provided
appsettings$simfunction = 'simulate_fit_noro'

#number of plots to produce for output
appsettings$nplots = 1

#specify the type of model that will be run
#if model type is provided as UI input, it should be set to NULL here
#otherwise it needs to be provided
appsettings$modeltype = '_fit_'

#additional input elements for app that are shown on UI
appsettings$otherinputs = shiny::tagList(
    shiny::selectInput("plotscale", "log-scale for plot",c("none" = "none", 'x-axis' = "x", 'y-axis' = "y", 'both axes' = "both")),
    shiny::selectInput("plotengine", "plot engine",c("ggplot" = "ggplot", "plotly" = "plotly"))
) #end taglist
