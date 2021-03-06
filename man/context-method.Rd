% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/context_method.R, R/cooccurrences_method.R
\docType{methods}
\name{context}
\alias{context}
\alias{context,partition-method}
\alias{as.matrix,contextBundle-method}
\alias{context,contextBundle-method}
\alias{context,partitionBundle-method}
\alias{context,cooccurrences-method}
\alias{context,character-method}
\alias{context,partitionBundle-method}
\alias{context,cooccurrences-method}
\alias{cooccurrences,Corpus-method}
\title{Analyze context of a node word.}
\usage{
\S4method{context}{partition}(.Object, query, cqp = is.cqp,
  left = getOption("polmineR.left"), right = getOption("polmineR.right"),
  pAttribute = getOption("polmineR.pAttribute"), sAttribute = NULL,
  stoplist = NULL, positivelist = NULL, regex = FALSE, count = TRUE,
  mc = getOption("polmineR.mc"), verbose = TRUE, progress = TRUE)

\S4method{context}{character}(.Object, query,
  pAttribute = getOption("polmineR.pAttribute"), sAttribute = NULL, ...)

\S4method{context}{partitionBundle}(.Object, query, verbose = TRUE, ...)

\S4method{context}{cooccurrences}(.Object, query, complete = FALSE)

\S4method{cooccurrences}{Corpus}(.Object, query,
  pAttribute = getOption("polmineR.pAttribute"), ...)
}
\arguments{
\item{.Object}{a partition or a partitionBundle object}

\item{query}{query, which may by a character vector or a cqpQuery object}

\item{cqp}{defaults to is.cqp-function, or provide TRUE/FALSE}

\item{left}{no of tokens and to the left of the node word}

\item{right}{no of tokens to the right of the node word}

\item{pAttribute}{p-attribute of the query}

\item{sAttribute}{if provided, it will be checked that corpus positions do not extend beyond
the region defined by the s-attribute}

\item{stoplist}{exclude a query hit from analysis if stopword(s) is/are in
context. See positivelist for further explanation.}

\item{positivelist}{character vector or numeric/integer vector: include a query hit
only if token in positivelist is present. If positivelist is a character
vector, it may include regular expressions (see parameter regex)}

\item{regex}{logical, defaults to FALSE - whether stoplist and/or positivelist are
regular expressions}

\item{count}{logical}

\item{mc}{whether to use multicore; if NULL (default), the function will get
the value from the options}

\item{verbose}{report progress, defaults to TRUE}

\item{progress}{logical, whether to show progress bar}

\item{...}{further parameters}

\item{complete}{enhance completely}
}
\value{
depending on whether a partition or a partitionBundle serves as
  input, the return will be a context object, or a contextBundle object
}
\description{
Retrieve the word context of a token, optionally checking for boundaries of a XML
region.
}
\details{
For formulating the query, CPQ syntax may be used (see
examples). Statistical tests available are log-likelihood, t-test, pmi.
}
\examples{
\dontrun{
  use("polmineR.sampleCorpus")
  p <- partition("PLPRBTTXT", list(text_type="speech"))
  y <- context(p, query = "Integration", pAttribute = "word")
  y <- context(p, query = "Integration", pAttribute = "word", positivelist = "Bildung")
  y <- context(
    p, query = "Integration", pAttribute = "word",
    positivelist = c("[aA]rbeit.*", "Ausbildung"), regex = TRUE
    )
}
}
\author{
Andreas Blaette
}
