#' All of the themes follow a similar pattern mainly just changing out font families 
#' and small tweaks to plot elements
#' 
#' The main two are a_plex_theme / a_dark_theme which is a dark version of a_plex_theme
#' 
#' 
#' @md
#' @param base_family,base_size base font family and size
#' @param plot_title_family,plot_title_face,plot_title_size plot title family, face, size 
#' @param subtitle_family,subtitle_face,subtitle_size plot subtitle family, face and size
#' @param strip_text_family,strip_text_face,strip_text_size facet label font family, face and size
#' @param caption_family,caption_face,caption_size plot caption family, face, size 
#' @param axis_title_family,axis_title_face,axis_title_size axis title font family, face and size
#' @param grid_col,axis_col grid & axis colors; both default to `#cccccc`
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param noaxis include/exclude axis (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param emphasis bold one axis title of both (a combination of 'x','y' or 'xy') 
#' @param rotate_x TRUE/FAlSE to rotate axis text
#' @export
#' @examples \dontrun{
#' library(ggplot2)
#' library(dplyr)
#'
#' # scatterplot
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(title="mtcars example") +
#'   a_plex_theme()
#Plex
a_plex_theme<- function(
  base_family="IBM Plex Sans",
  base_size =9,
  plot_title_family='IBM Plex Mono',
  plot_title_size = 20,
  plot_title_face="bold",
  subtitle_family=base_family,
  subtitle_size = 10,
  subtitle_face = "plain",
  strip_text_family = base_family,
  strip_text_size = 10,
  strip_text_face = "plain",
  caption_family= base_family,
  caption_size =9,
  caption_face = "plain",
  axis_text_size = base_size,
  axis_title_family = plot_title_family,
  axis_title_size = 10,
  axis_title_face = "plain",
  grid_col='#dedede',
  grid=TRUE,
  noaxis=FALSE,
  emphasis='xy',
  rotate_x=FALSE)
{
  aplot <- ggplot2::theme_minimal(base_family=base_family, base_size=base_size)
  
  if (inherits(grid, "character") | grid == TRUE) {
    
    aplot <- aplot + theme(panel.grid=element_line(color=grid_col, size=0.2))
    aplot <- aplot + theme(panel.grid.major=element_line(color=grid_col, size=0.2))
    aplot <- aplot + theme(panel.grid.minor=element_line(color=grid_col, size=0.15))
    
    
    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) aplot <- aplot + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) aplot <- aplot + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) aplot <- aplot + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) aplot <- aplot + theme(panel.grid.minor.y=element_blank())
    }
    
  } else {
    aplot <- aplot + theme(panel.grid=element_blank())
  }
  if (inherits(grid, "character") | rotate_x == TRUE) {
    aplot<-aplot+theme(axis.text.x = element_text(angle = 90, hjust = 1))
  } 
  
  aplot <- aplot + theme(legend.background=element_blank())
  aplot <- aplot + theme(legend.key=element_blank())
  if (inherits(grid, "character") | noaxis == TRUE) {
    aplot <- aplot + theme(axis.text.x=element_blank())
    aplot <- aplot + theme(axis.text.y=element_blank())}
  else{
    aplot <- aplot + theme(axis.text.x=element_text(size=axis_text_size,family=subtitle_family,face = dplyr::case_when(emphasis=='x' ~'bold',emphasis=='y'~'plain',emphasis=='xy'~'plain'),color='#444444'))
    aplot <- aplot + theme(axis.text.y=element_text(size=axis_text_size,family=subtitle_family,face = dplyr::case_when(emphasis=='y' ~'bold',emphasis=='x'~'plain',emphasis=='xy'~'plain'),color='#444444'))}
  aplot <- aplot + theme(axis.title=element_text(size=axis_title_size, family=axis_title_family,color='#444444'))
  aplot <- aplot + theme(axis.title.x=element_text(size=axis_title_size, family=axis_title_family, face=axis_title_face, margin=margin(t = 18, b = 10, unit = "pt")))
  aplot <- aplot + theme(axis.title.y=element_text(size=axis_title_size, family=axis_title_family, face=axis_title_face,margin=margin(r = 18, unit = "pt")))
  aplot <- aplot + theme(strip.text=element_text(hjust=0, size=strip_text_size,face=strip_text_face, family=strip_text_family))
  aplot <- aplot + theme(panel.spacing=grid::unit(2, "lines"))
  aplot <- aplot + theme(plot.title=element_text(hjust=0, size=plot_title_size, family=plot_title_family, face=plot_title_face,color='#444444'))
  aplot <- aplot + theme(plot.subtitle=element_text(hjust=0, size=subtitle_size, margin=margin(t = 4, b = 12, unit = "pt"),family=subtitle_family, face=subtitle_face,color='#565656', lineheight=1))
  aplot <- aplot + theme(plot.caption=element_text(hjust=1, size=caption_size,  family=caption_family, face=caption_face,color='#565656'))
  aplot
}

#' All of the themes follow a similar pattern mainly just changing out font families 
#' and small tweaks to plot elements
#' 
#' The main two are a_plex_theme / a_dark_theme which is a dark version of a_plex_theme
#' These two use IBM Plex Mono for title text and IBM Plex Sans for the rest
#' 
#' @md
#' @param base_family,base_size base font family and size
#' @param plot_title_family,plot_title_face,plot_title_size plot title family, face, size 
#' @param subtitle_family,subtitle_face,subtitle_size plot subtitle family, face and size
#' @param strip_text_family,strip_text_face,strip_text_size facet label font family, face and size
#' @param caption_family,caption_face,caption_size plot caption family, face, size 
#' @param axis_title_family,axis_title_face,axis_title_size axis title font family, face and size
#' @param grid_col,axis_col grid & axis colors; both default to `#cccccc`
#' #' @param shade is a parameter to change the plot background color defaults to `#1d1d1d`
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param noaxis include/exclude axis (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param emphasis bold one axis title of both (a combination of 'x','y' or 'xy') 
#' @param rotate_x TRUE/FAlSE to rotate axis text
#' @export
#' @examples \dontrun{
#' library(ggplot2)
#' library(dplyr)
#'
#' # scatterplot
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(title="mtcars example") +
#'   a_dark_theme()

#Dark Plex
a_dark_theme<- function(
  base_family="IBM Plex Sans",
  base_size =9,
  plot_title_family='IBM Plex Mono',
  plot_title_size = 20,
  plot_title_face="bold",
  subtitle_family=base_family,
  subtitle_size = 10,
  subtitle_face = "plain",
  strip_text_family = base_family,
  strip_text_size = 10,
  strip_text_face = "plain",
  caption_family= base_family,
  caption_size = 9,
  caption_face = "plain",
  axis_text_size = base_size,
  axis_title_family = plot_title_family,
  axis_title_size = 10,
  axis_title_face = "plain",
  grid_col='#555555',
  shade='#1d1d1d',
  grid=TRUE,
  noaxis=FALSE,
  emphasis='xy',
  rotate_x=FALSE)
{
  aplot <- ggplot2::theme_minimal(base_family=base_family, base_size=base_size)
  
  if (inherits(grid, "character") | grid == TRUE) {
    
    aplot <- aplot + theme(panel.grid=element_line(color=grid_col, size=0.2))
    aplot <- aplot + theme(panel.grid.major=element_line(color=grid_col, size=0.2))
    aplot <- aplot + theme(panel.grid.minor=element_line(color=grid_col, size=0.15))
    
    
    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) aplot <- aplot + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) aplot <- aplot + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) aplot <- aplot + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) aplot <- aplot + theme(panel.grid.minor.y=element_blank())
    }
    
  } else {
    aplot <- aplot + theme(panel.grid=element_blank())
  }
  if (inherits(grid, "character") | rotate_x == TRUE) {
    aplot<-aplot+theme(axis.text.x = element_text(angle = 90, hjust = 1))
  } 
  
  aplot <- aplot + theme(legend.background=element_blank())
  aplot <- aplot + theme(legend.key=element_blank())
  aplot <- aplot + theme(legend.text=element_text(family=plot_title_family,color='#e3e3e3'),
                         legend.title=element_text(family=plot_title_family,color='#e3e3e3'))
  if (inherits(grid, "character") | noaxis == TRUE) {
    aplot <- aplot + theme(axis.text.x=element_blank())
    aplot <- aplot + theme(axis.text.y=element_blank())}
  else{
    aplot <- aplot + theme(axis.text.x=element_text(size=axis_text_size,family=subtitle_family,face = dplyr::case_when(emphasis=='x' ~'bold',emphasis=='y'~'plain',emphasis=='xy'~'plain'),color='#e3e3e3'))
    aplot <- aplot + theme(axis.text.y=element_text(size=axis_text_size,family=subtitle_family,face = dplyr::case_when(emphasis=='y' ~'bold',emphasis=='x'~'plain',emphasis=='xy'~'plain'),color='#e3e3e3'))}
  aplot <- aplot + theme(axis.title=element_text(size=axis_title_size, family=axis_title_family,color='#e3e3e3'))
  aplot <- aplot + theme(axis.title.x=element_text(size=axis_title_size, family=axis_title_family, face=axis_title_face, margin=margin(t = 18, b = 10, unit = "pt")))
  aplot <- aplot + theme(axis.title.y=element_text(size=axis_title_size, family=axis_title_family, face=axis_title_face,margin=margin(r = 18, unit = "pt")))
  aplot <- aplot + theme(strip.text=element_text(hjust=0, size=strip_text_size,face=strip_text_face, family=strip_text_family, color='#e3e3e3'))
  aplot <- aplot + theme(panel.spacing=grid::unit(2, "lines"))
  aplot <- aplot + theme(plot.title=element_text(hjust=0, size=plot_title_size, family=plot_title_family, face=plot_title_face,color='#e3e3e3'))
  aplot <- aplot + theme(plot.subtitle=element_text(hjust=0, size=subtitle_size, margin=margin(t = 4, b = 12, unit = "pt"),family=subtitle_family, face=subtitle_face,color='#e3e3e3', lineheight=1))
  aplot <- aplot + theme(plot.caption=element_text(hjust=1, size=caption_size,  family=caption_family, face=caption_face,color='#808080'))
  aplot <- aplot + theme(plot.background = element_rect(fill = shade)) #plot background
  aplot <- aplot + theme(panel.background = element_rect(fill = shade,
                                                         colour = shade))
  aplot
}
