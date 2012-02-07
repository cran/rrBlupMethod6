\name{rrBlupM6}
\alias{rrBlupM6}
\title{rrBlupM6 -- RR-BLUP for estimation of marker effects with fixed
  residual variance}

\description{This function implements "Method 6" described in Piepho et
  al. (2011), a re-parametrization of Kang et al.'s (2008) mixed model formulation
  to allow for a fixed residual variance when using RR-BLUP for
  genomwide estimation of marker effects.}


\usage{rrBlupM6(y, X = matrix(1,nrow=n,ncol=1), Z, sig2e, chunks = as.integer(1))}


\arguments{
  
  \item{y}{Numeric vector with phenotypic observations (for example the
    entry means).}
  \item{X}{Design matrix of fixed effects, including the intercept.
    By default, this is an all 1 column vector for the intercept.}
  \item{Z}{Matrix assigning marker genotypes
    to phenotypes in \code{y}. The dimension of the matrix must be
    no. phenotypes (rows) times no. markers (columns). The coding must
    be 1 and -1 for the two homozygous genotypes.}
  \item{sig2e}{The value of the residual variance, numeric vector of
    length 1.}
  \item{chunks}{Integer giving the number of chunks into which to split
    the computation of ZZ'. Computing this matrix in chunks might have
    computational advantages when the number of markers and observations
    is very large and the available memory is low. The default is 1,
    which computes ZZ' directly (i.e. as \code{Z \%*\%t(Z)}).}
}

\value{
  A list with three components
  \describe{
    \item{uhat}{Numeric vector with the BLUP marker effects,}
    \item{betahat}{Numeric vector with the BLUE of the fixed effects and}
    \item{sig2u}{Numeric vector of length 1 with the REML estimate of
      the marker effect variance}}
  }

\details{ Please see Piepho et al. (2011) for details on the
re-parametrization and the computation of ZZ' in chunks. Currently only
bi-allelic markers are supported.}

\author{
Torben Schulz-Streeck, Boubacar Estaghvirou, Frank Technow
}


\examples{

## simulate a small data set (250 observations, 300 markers)
set.seed(3421475)
N <- 250
M <- 300

Z <- matrix(sample(c(1,-1),N * M, replace = TRUE),
            nrow = N,
            ncol = M)

## marker effects
u <- rnorm(M, 0, sqrt(1/M))

sig2e <- 1
y <- Z \%*\% u + rnorm(N,0,sqrt(sig2e))

out <- rrBlupM6(Z = Z, y = y, sig2e = sig2e)

## estimated marker effect variance
out$sig2u



## accuracy in validation set
Z.val <- matrix(sample(c(1,-1),N * M, replace = TRUE),
                nrow = N,
                ncol = M)

cor(Z.val\%*\% out$uhat, Z.val\%*\% u)

## compute ZZ' in chunks
out.chunks <- rrBlupM6(Z = Z, y = y, sig2e = sig2e, chunks = 6)

cor(Z.val\%*\% out.chunks$uhat, Z.val\%*\% u)
}

\seealso{\code{\link{rrBlupMethod6}}}