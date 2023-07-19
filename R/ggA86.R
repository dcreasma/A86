#' Title
#'
#' @param data a dataframe or object coercible to a datafram to be graph.
#' @param x the parameter to be graphed on the x axis.
#' @param y the parameter to be graphed on the y axis.
#' @param group the grouping variable.
#' @param colors the colors to use for the different groups.
#' @param graph_type the type of graph to be plotted. Possible arguments are "line" and "bar".
#' @param limits the vertical limits of the graph.
#' @param expand the additional buffer added to the vertical limits of the graph.
#' @param error_bar_width the width of the error bars.
#' @param xtitle the title of the x axis
#' @param ytitle the title of the y axis
#'
#' @return a ggplot object
#' @export
#'
#' @examples
#'
#' @importFrom rlang .data
ggA86 <- function(data, x, y, group, colors=c("blue","red"), graph_type = "line", expand = c(0, 0), limits = c(0,NA), error_bar_width = 1, xtitle = NULL, ytitle = NULL){
  available_graph_types <-  available_graph_types(FALSE)
  if (!(tolower(graph_type) %in% tolower(available_graph_types)))
    stop("Invalid graph type provided. Use the function 'available_graph_types' to see a list of valid graph types.")


  plot <- ggplot2::ggplot(data,
                          ggplot2::aes(x = .data[[x]], y = .data[[y]], color = .data[[group]])) +
    ggplot2::scale_color_manual(values = colors)


  if (tolower(graph_type) == tolower("line"))
  plot <- plot + ggplot2::stat_summary(fun = "mean", geom = "line", size = 1) +
    ggplot2::stat_summary(fun = "mean", geom = "point", size = 2) +
    ggplot2::stat_summary(fun.data = "mean_se", geom = "errorbar", width = error_bar_width)

  if (tolower(graph_type) == tolower("bar"))
    plot <- plot + ggplot2::stat_summary(fun = "mean", geom = "bar", fill = "transparent", size=2) +
    ggplot2::stat_summary(fun.data = "mean_se", geom = "errorbar", width = .5) +
    ggplot2::geom_point()


  plot <- plot + ggplot2::scale_y_continuous(expand = expand, limits = limits) +
    A86::theme_A86() +
    ggplot2::ylab(ytitle) +
    ggplot2::xlab(xtitle)
}
