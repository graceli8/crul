% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auth.R
\name{auth}
\alias{auth}
\title{Authentication}
\usage{
auth(user, pwd, auth = "basic")
}
\arguments{
\item{user}{(character) username, optional}

\item{pwd}{(character) password, optional}

\item{auth}{(character) authentication type, one of basic (default),
digest, digest_ie, gssnegotiate, ntlm, or any. optional}
}
\description{
Authentication
}
\details{
Only supporting simple auth for now, OAuth later.
}
\examples{
auth(user = "foo", pwd = "bar", auth = "basic")
auth(user = "foo", pwd = "bar", auth = "digest")
auth(user = "foo", pwd = "bar", auth = "ntlm")
auth(user = "foo", pwd = "bar", auth = "any")

# with HttpClient
(res <- HttpClient$new(
  url = "https://httpbin.org/basic-auth/user/passwd",
  auth = auth(user = "user", pwd = "passwd")
))
res$auth
x <- res$get()
jsonlite::fromJSON(x$parse("UTF-8"))

# with HttpRequest
(res <- HttpRequest$new(
  url = "https://httpbin.org/basic-auth/user/passwd",
  auth = auth(user = "user", pwd = "passwd")
))
res$auth
}
