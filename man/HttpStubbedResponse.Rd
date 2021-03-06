% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stubbed-response.R
\docType{data}
\name{HttpStubbedResponse}
\alias{HttpStubbedResponse}
\title{stubbed response object}
\arguments{
\item{url}{(character) A url}

\item{opts}{(list) curl options}

\item{handle}{A handle}
}
\description{
stubbed response object
}
\details{
\strong{Methods}
\describe{
\item{\code{parse()}}{
Parse the raw response content to text
}
\item{\code{success()}}{
Was status code less than or equal to 201.
returns boolean
}
\item{\code{status_http()}}{
Get HTTP status code, message, and explanation
}
\item{\code{raise_for_status()}}{
Check HTTP status and stop with appropriate
HTTP error code and message if >= 300.
- If you have \code{fauxpas} installed we use that,
otherwise use \pkg{httpcode}
}
}
}
\examples{
(x <- HttpStubbedResponse$new(method = "get", url = "https://httpbin.org"))
x$url
x$method
}
\keyword{datasets}
