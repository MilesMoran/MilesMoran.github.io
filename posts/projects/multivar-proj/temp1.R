#' Create a decisionplot using the ggplot package.
#'
#' @param model any model 
#' @param vars either a character vector of length 2, or a formula of form V1 ~ V2 specifying y and x axis of the plot respectively.
#' @param data data to use for visualization. Should contain all the data needed to use the model
#' @param resolution number of points to use for visualizetion.
#' @param showgrid logical, should areas of classes be coloured?
#' @param ... further parameters passed to predict
#' @param modes.means levels use for plotting the variables not specified in vars.
decisionplot_ggplot <- function(model, 
                                vars, 
                                data, 
                                resolution = 100,
                                showgrid = TRUE, 
                                ...,
                                modes.means) {
    if(missing(model) || missing(vars) || missing(data))
        stop('model, vars or data is missing')
    if(!(is.character(vars) && length(vars) == 2) && !('formula' %in% class(vars) && length(vars <- all.vars(vars)) == 2))
        stop('vars should be either a formula or a character vector oflength 2.')
    if(!is.data.frame(data))
        stop('data does not seem to comform with standard types.')
    
    t <- terms(model)
    if(!all((other.vars <- attr(t, 'term.labels')) %in% colnames(data)))
        stop('data is missing one or more variables in model.')
    lhs <- as.character(t[[2]])
    # Set up data for prediction, for the data in vars
    prd.vars <- lapply(data[, vars], function(x){
        if(is.character(x) || is.factor(x)){
            unique(x)
        }else{
            r <- range(x)
            seq(r[1], r[2], length.out = resolution)
        }
    })
    names(prd.vars) <- vars
    # set up data for prediction for the remaining data
    if(missing(modes.means)){
        other.vars <- other.vars[!other.vars %in% vars]
        if(length(other.vars)){
            modes.means <- lapply(data[, other.vars], function(x){
                if(is.character(x)){
                    unique(x)[1]
                }else if(is.factor(x)){
                    levels(x)[1]
                }else{
                    mean(x)
                }
            }) 
            names(modes.means) <- other.vars
        }else
            modes.means <- NULL
    }else{
        if(is.null(other.vars))
            stop('other.vars is null but modes.means was provided. Please leave this missing.')
        if(!all(other.vars %in% names(modes.means)))
            stop('modes.means are lacking one or more variables.')
        modes.means <- as.list(modes.means)
        if(any(lengths(modes.means) > 1))
            stop('modes.means should only contain a single values for all variables.')
    }
    prd.data <- expand.grid(c(prd.vars, modes.means))
    p <- predict(model, prd.data, ...)
    prd.data$nm <- if(is.list(p)) 
        p$class 
    else 
        p
    names(prd.data)[ncol(prd.data)] <- lhs
    # Create the final plot.
    gg <- ggplot(aes_string(vars[1], vars[2]), data = data) + 
        geom_point(aes_string(col = lhs, shape = lhs), size = 3, alpha=0.2) + 
        geom_contour(aes_string(vars[1], vars[2], z = paste0('as.integer(', lhs, ') + 1L')), data = prd.data, inherit.aes = FALSE)
    if(showgrid)
        gg <- gg + 
        geom_point(aes_string(vars[1], vars[2], col = lhs), data = prd.data, shape = 20, size = 0.5)
    gg
}
