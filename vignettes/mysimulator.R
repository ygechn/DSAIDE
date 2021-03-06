#' Basic SIR model
#' 
#' @description A basic SIR model with 3 compartments and infection and recovery processes
#' 
#' @details The model includes susceptible, infected, and recovered compartments. The two processes that are modeled are infection and recovery.
#' @param S : starting value for Susceptible : numeric
#' @param I : starting value for Infected : numeric
#' @param R : starting value for Recovered : numeric
#' @param b : infection rate : numeric
#' @param g : recovery rate : numeric
#' @param w : waning immunity rate : numeric
#' @param tstart : Start time of simulation : numeric
#' @param tfinal : Final time of simulation : numeric
#' @param dt : Time step : numeric
#' @return The function returns the output as a list. 
#' The time-series from the simulation is returned as a dataframe saved as list element \code{ts}. 
#' The \code{ts} dataframe has one column per compartment/variable. The first column is time.   
#' @section Warning: This function does not perform any error checking. So if you try to do something nonsensical (e.g. have negative values for parameters), the code will likely abort with an error message.
#' @export 
 
mysimulator <- function( S = 1000, I = 1, R = 0, b = 0.002, g = 1, w = 0, tstart = 0, tfinal = 100, dt = 0.1 ) 
{ 
  #Block of ODE equations for deSolve 
  SIR_model_ode <- function(t, y, parms) 
  {
    with( as.list(c(y,parms)), { #lets us access variables and parameters stored in y and parms by name 
      dS = -b*S*I +w*R
      dI = +b*S*I -g*I
      dR = +g*I -w*R
      list(c(dS,dI,dR)) 
  } ) } #close with statement, end ODE code block 
 
  #Main function code block 
  vars = c(S = S, I = I, R = R)
  pars = c(b = b, g = g)
  timevec=seq(tstart,tfinal,by=dt) 
  odeout = deSolve::ode(y = vars, parms = pars, times = timevec,  func = SIR_model_ode) 
  result <- list() 
  result$ts <- as.data.frame(odeout) 
  return(result) 
} 
