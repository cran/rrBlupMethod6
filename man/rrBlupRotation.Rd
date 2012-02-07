\name{rrBlupRotation}
\alias{rrBlupRotation}
\title{rrBlupRotation -- linear transformation for the adjusted means
and the design matrices}

\description{ This function implements the rotation described in Piepho
et al. (2011) thus the assumption of \eqn{R = I\sigma^2}{R = I sigma2}
in function \code{rrBlupM6} is satisfied.}



\usage{rrBlupRotation(y, X = matrix(1,nrow=n, ncol=1), Z, R)}


\arguments{
  
  \item{y}{Numeric vector with adjusted means of the genotypes.}
  \item{X}{Design matrix of fixed effects, including the intercept.
    By default, this is an all 1 column vector for the intercept.}
  \item{Z}{Matrix assigning marker genotypes
    to phenotypes in \code{y}. The dimension of the matrix must be
    no. phenotypes (rows) times no. markers (columns). The coding must
    be 1 and -1 for the two homozygous genotypes.}
  \item{R}{Variance-covariance structure of the adjusted means}
}

\value{
  A list with three components
  \describe{
    \item{y_tilda}{Numeric vector with the rotated adjusted means,}
    \item{X_tilda}{Rotated design matrix of the fixed effects and}
    \item{Z_tilda}{Rotated design matrix with the marker information}
  }
}

\details{ Please see Piepho et al. (2011) and Schulz-Streeck et
  al. (2012) for details on the rotation approach. The
  variance-covariance structure \eqn{R} can, for example, be obtained
  with the function \code{vcov} from fitted (\code{mer}) model objects,
  or with the output option \code{COV} for the \code{LSMEANS} statement
  in \code{PROC MIXED} in SAS.}

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

## simulate a random variance-covariance structure of the adjusted means
## (Note that this is just for demonstration purposes, the values are
## non-sensical!)
R <- matrix(rnorm(N*N),N,N) 
diag(R) <- abs(diag(R))
R <- R + t(R)


## rotate
out_r <- rrBlupRotation(y, Z = Z, R = R)

## use rotated y,X and Z for computing marker effects and set sig2e = 1
out_RRBLUP_m6_r <- rrBlupM6(y = out_r$y_tilda,
                            X = out_r$X_tilda,
                            Z = out_r$Z_tilda,
                            sig2e = 1,
                            chunks = 4)
}

\seealso{\code{\link{rrBlupMethod6}},\code{\link{rrBlupM6}}}

