% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/httprequest.R
\docType{data}
\name{HttpRequest}
\alias{HttpRequest}
\title{HTTP request object}
\arguments{
\item{url}{(character) A url. One of \code{url} or \code{handle} required.}

\item{opts}{(list) curl options, a named list. See
\code{\link[curl]{curl_options}} for available curl options}

\item{proxies}{an object of class \code{proxy}, as returned from the
\code{\link{proxy}} function. Supports one proxy for now}

\item{headers}{(list) a named list of headers}

\item{handle}{A handle, see \code{\link{handle}}}
}
\description{
HTTP request object
}
\details{
This R6 class doesn't do actual HTTP requests as does
\code{\link[=HttpClient]{HttpClient()}} - it is for building requests to use for async HTTP
requests in \code{\link[=AsyncVaried]{AsyncVaried()}}

Note that you can access HTTP verbs after creating an \code{HttpRequest}
object, just as you can with \code{HttpClient}. See examples for usage.

Also note that when you call HTTP verbs on a \code{HttpRequest} object you
don't need to assign the new object to a variable as the new details
you've added are added to the object itself.

\strong{Methods}
\describe{
\item{\code{get(path, query, disk, stream, ...)}}{
Define a GET request
}
\item{\code{post(path, query, body, disk, stream, ...)}}{
Define a POST request
}
\item{\code{put(path, query, body, disk, stream, ...)}}{
Define a PUT request
}
\item{\code{patch(path, query, body, disk, stream, ...)}}{
Define a PATCH request
}
\item{\code{delete(path, query, body, disk, stream, ...)}}{
Define a DELETE request
}
\item{\code{head(path, ...)}}{
Define a HEAD request
}
\item{\code{method()}}{
Get the HTTP method (if defined)
- returns character string
}
}

See \code{\link[=HttpClient]{HttpClient()}} for information on parameters.
}
\examples{
x <- HttpRequest$new(url = "https://httpbin.org/get")
## note here how the HTTP method is shown on the first line to the right
x$get()

## assign to a new object to keep the output
z <- x$get()
### get the HTTP method
z$method()

(x <- HttpRequest$new(url = "https://httpbin.org/get")$get())
x$url
x$payload

(x <- HttpRequest$new(url = "https://httpbin.org/post"))
x$post(body = list(foo = "bar"))

HttpRequest$new(
  url = "https://httpbin.org/get",
  headers = list(
    `Content-Type` = "application/json"
  )
)
}
\seealso{
\link{post-requests}, \link{delete-requests},
\link{http-headers}, \link{writing-options}
}
\keyword{datasets}
