\name{rrBlupMethod6-package}
\alias{rrBlupMethod6-package}
\alias{rrBlupMethod6}
\docType{package}
\title{rrBlupMethod6 -- Re-parametrization of RR-BLUP to allow for a fixed residual variance.
}

\description{ rrBlupMethod6 -- Re-parametrization of the mixed model
  formulation of Kang et al. (2008), to allow for a fixed residual
  variance when using RR-BLUP for genomwide estimation of marker effects
  and linear transformation of the adjusted means proposed by Piepho et
  al.(2011).}

\details{
\tabular{ll}{
Package: \tab rrBlupMethod6\cr
Type: \tab Package\cr
Version: \tab 1.3\cr
Date: \tab 2012-10-04\cr
License: \tab GNU General Public License Version 2, June 1991\cr
LazyLoad: \tab yes\cr
}

Kang et al. (2008) describe an efficient mixed model formulation for the
special case of only one random effect besides the error, which avoids
any matrix computation in the REML estimation of variance
components. Piepho et al.  (2011) re-parametrize their formulation to
allow for a fixed residual variance. This re-parametrization might be
especially useful in a plant breeding context. Here, the phenotypes used
for estimation of marker effects are commonly the adjusted (for all
other random and fixed effects) entry means, obtained beforehand from a
one- or two-step adjustment procedure, most likely a mixed-model
analysis (Moehring and Piepho, 2009). From this analysis, good estimates
of the residual variance are usually available, so that it is not
necessary and even counterproductive to re-estimate this parameter in
RR-BLUP (Moehring and Piepho, 2009). Please see Piepho et al. (2011) for
details.

The method is restricted to the case where \eqn{R = I\sigma^2}{R = I
sigma2}, where \eqn{R} is the error variance-covariance matrix and
\eqn{\sigma^2}{sigma2} is the error variance. An independent estimate of
\eqn{R} is often available from the analysis that yielded adjusted means. In
case \eqn{R} does not meet this assumption, a linear transformation
(rotation) can always be applied to ensure \eqn{R = I\sigma^2}{R = I
sigma2} (Piepho et al., 2011, Schulz-Streeck et al., 2012), provided
that \eqn{R} is known. Hence, we replace \eqn{y} by \eqn{L_R y}{L_R y}
and \eqn{Z} by \eqn{L_R Z}, where \eqn{y} is the vector with the
adjusted means, \eqn{R^{-1} = (L_R)^2}{inv(R) = square(L_R)} such that
\eqn{L_R} is square and symmetric and \eqn{Z} is the matrix with marker
information. \eqn{L_R} is easily obtained from a spectral decomposition
of \eqn{R^{-1}}{inv(R)}. With these replacements, analysis can proceed
assuming that \eqn{R = I\sigma^2}{R = I sigma2} with \eqn{\sigma^2 =
1}{sigma2 = 1}.

The package \pkg{rrBlupMethod6} implements the method denoted "Method 6" in
Piepho et al. (2011). The original parametrization of
Kang et al. (2008) was previously implemented in the R package \pkg{rrBLUP}
(Endelman, 2011), available from CRAN under
\url{http://cran.r-project.org/web/packages/rrBLUP/index.html}. We used
parts of the code of an earlier version (1.1) of \pkg{rrBLUP} as a
starting point for our implementation.}


\author{Torben Schulz-Streeck (1), Boubacar Estaghvirou (1), Frank
  Technow (2)

  (1) University of Hohenheim, Institute of Crop Science, Stuttgart, Germany 
  
  (2) University of Hohenheim, Institute of Plant Breeding, Seed Science
  and Population Genetics, Stuttgart, Germany 

  Maintainer: Frank Technow \email{ Frank.Technow@uni-hohenheim.de }
}

\references{
  Piepho et al. (2012): Efficient computation of ridge-regression BLUP in
  genomic selection in plant breeding. Crop Science 52 (3), 1093-1104
  
  Kang et al. (2008): Efficient control of population structure in model
  organism association mapping. Genetics 178:1709-1723

  Moehring, J., Piepho, H. P. (2009): Comparison of weighting in
  two-stage analyses of series of experiments. Crop Science 49,
  1977-1988

  Piepho HP, Schulz-Streeck T, Ogutu JO (2011): A stage-wise approach
  for analysis of multi-environment trials. Biuletyn Oceny Odmian
  33:7-20

  Schulz-Streeck T, Ogutu JO, Piepho HP (2012) Comparisons of single-stage
  and two-stage approaches to genomic selection.  Submitted }

\keyword{package}
\keyword{models}

\seealso{\code{\link{rrBlupM6}}, \code{\link{rrBlupRotation}}}