% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/client.R
\docType{data}
\name{HttpClient}
\alias{HttpClient}
\title{HTTP client}
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
HTTP client
}
\details{
\strong{Methods}
\describe{
\item{\code{get(path, query, disk, stream, ...)}}{
Make a GET request
}
\item{\code{post(path, query, body, disk, stream, ...)}}{
Make a POST request
}
\item{\code{put(path, query, body, disk, stream, ...)}}{
Make a PUT request
}
\item{\code{patch(path, query, body, disk, stream, ...)}}{
Make a PATCH request
}
\item{\code{delete(path, query, body, disk, stream, ...)}}{
Make a DELETE request
}
\item{\code{head(path, ...)}}{
Make a HEAD request
}
}

Possible parameters (not all are allowed in each HTTP verb):
\itemize{
\item path - URL path, appended to the base URL
\item query - query terms, as a list
\item body - body as an R list
\item encode - one of form, multipart, json, or raw
\item disk - a path to write to. if NULL (default), memory used.
See \code{\link[curl:curl_fetch_disk]{curl::curl_fetch_disk()}} for help.
\item stream - an R function to determine how to stream data. if
NULL (default), memory used. See \code{\link[curl:curl_fetch_stream]{curl::curl_fetch_stream()}}
for help
\item ... curl options, only those in the acceptable set from
\code{\link[curl:curl_options]{curl::curl_options()}} except the following: httpget, httppost,
post, postfields, postfieldsize, and customrequest
}
}
\section{handles}{

curl handles are re-used on the level of the connection object, that is,
each \code{HttpClient} object is separate from one another so as to better
separate connections.
}

\examples{
(x <- HttpClient$new(url = "https://httpbin.org"))
x$url
(res_get1 <- x$get('get'))
res_get1$content
res_get1$response_headers
res_get1$parse()

(res_get2 <- x$get('get', query = list(hello = "world")))
res_get2$parse()
library("jsonlite")
jsonlite::fromJSON(res_get2$parse())

# post request
(res_post <- x$post('post', body = list(hello = "world")))

## empty body request
x$post('post')

# put request
(res_put <- x$put('put'))

# delete request
(res_delete <- x$delete('delete'))

# patch request
(res_patch <- x$patch('patch'))

# head request
(res_head <- x$head())

# query params are URL encoded for you, so DO NOT do it yourself
## if you url encode yourself, it gets double encoded, and that's bad
(x <- HttpClient$new(url = "https://httpbin.org"))
res <- x$get("get", query = list(a = 'hello world'))
}
\seealso{
\link{post-requests}, \link{delete-requests}, \link{http-headers},
\link{writing-options}, \link{cookies}
}
\keyword{datasets}
