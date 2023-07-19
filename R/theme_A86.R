#' Returns the standard ggplot theme for the A86 paper
#'
#'
#' @return A ggplot2 theme.
#' @export
#'
#' @examples
#'mtcars2 <- within(mtcars, {
#'vs <- factor(vs, labels = c("V-shaped", "Straight"))
#'am <- factor(am, labels = c("Automatic", "Manual"))
#'cyl  <- factor(cyl)
#'gear <- factor(gear)
#'})

#'p1 <- ggplot2::ggplot(mtcars2) +
#'ggplot2::geom_point(ggplot2::aes(x = wt, y = mpg, colour = gear)) +
#'ggplot2::labs(
#' title = "Fuel economy declines as weight increases",
#'  subtitle = "(1973-74)",
#'   caption = "Data from the 1974 Motor Trend US magazine.",
#'    tag = "Figure 1",
#'    x = "Weight (1000 lbs)",
#'    y = "Fuel economy (mpg)",
#'   colour = "Gears"
#' )
  #'p1 + theme_A86()
#'
theme_A86 <- function(){
  return_theme <-
    ggplot2:: theme(panel.grid.major = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank(),panel.background = ggplot2::element_blank(),panel.border = ggplot2::element_blank()) +
    ggplot2::theme(axis.ticks = ggplot2::element_line(size = 1, color="black")) +
    ggplot2::theme(axis.line = ggplot2::element_line(size = 1, color="black")) +
    ggplot2::theme(text=ggplot2::element_text(size =20))
}
