#' @include textstat_class.R partition_class.R polmineR_package.R
NULL

#' S4 context class
#' 
#' class to organize information of context analysis
#' 
#' @slot call Object of class \code{"character"} the call that generated the object
#' @slot partition Object of class \code{"character"} the partition the analysis is based on
#' @slot partitionSize  Object of class \code{"numeric"} the size of the partition
#' @slot leftContext  Object of class \code{"numeric"} number of tokens to the right
#' @slot rightContext  Object of class \code{"numeric"} number of tokens to the left
#' @slot pAttribute  Object of class \code{"character"} p-attribute of the query
#' @slot corpus  Object of class \code{"character"} the CWB corpus used
#' @slot stat  Object of class \code{"data.frame"} statistics of the analysis
#' @slot encoding  Object of class \code{"character"} encoding of the corpus
#' @slot pos  Object of class \code{"character"} part-of-speech tags filtered
#' @slot method  Object of class \code{"character"} statistical test(s) used
#' @slot cutoff  Object of class \code{"list"} cutoff levels that have been applied
#' @slot svg Object of class \code{"character"} - valid XML with svg representation
#' @aliases cooccurrences-class ll,cooccurrences-method [,cooccurrences-method
#'   [,cooccurrences,ANY,ANY,ANY-method show,cooccurrences-method
#'   summary,cooccurrences-method as.sparseMatrix,cooccurrences-method
#'   as.igraph,cooccurrences-method trim,cooccurrences-method
#' @docType class
#' @exportClass cooccurrences
#' @rdname cooccurrences-class
setClass("cooccurrences",
         representation(
           call="character",
           partition="character",
           partitionSize="numeric",
           leftContext="numeric",
           rightContext="numeric",
           pAttribute="character",
           corpus="character",
           stat="data.table",
           encoding="character",
           pos="character",
           method="character",
           cutoff="list",
           svg="character"
         ),
         contains=c("textstat")
)

#' @rdname cooccurrences-class
setClass("cooccurrencesReshaped", contains=c("cooccurrences", "textstat"))

#' Methods for manipulating cooccurrencesReshaped-class-objects
#' 
#' @param x cooccurrences for a corpus of interest
#' @param y cooccurrences for a reference corpus
#' @rdname cooccurrencesReshaped
#' @aliases cooccurrencesReshaped merge,cooccurrencesReshaped-method
#' @name cooccurrencesReshaped
NULL

#' @include cooccurrences_class.R bundle_class.R
NULL

#' S4 cooccurrencesBundle class
#' 
#' class to organize information of multiple context analyses
#' 
#' @slot objects for cooccurrenceBundle-objects - Object of class \code{"list"} - list of cooccurrence objects
#'     
#' @param x a cooccurrencesBundle object
#' @param col the column to extract
#' @param directed to be explained
#' @param rel to be explained, too
#' @param mc logical, whether to use multicore
#' @name cooccurrencesBundle-class
#' @aliases cooccurrencesBundle
#' @docType class
#' @exportClass kwic
#' @rdname cooccurrencesBundle-class
setClass("cooccurrencesBundle",
         slots=c(
           objects="list",
           pAttribute="character",
           encoding="character",
           corpus="character"
         ),
         contains=c("bundle")
)
