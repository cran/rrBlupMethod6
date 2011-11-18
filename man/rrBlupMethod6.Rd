\name{rrBlupMethod6-package}
\alias{rrBlupMethod6-package}
\alias{rrBlupMethod6}
\docType{package}
\title{rrBlupMethod6 -- Re-parametrization of RR-BLUP to allow for a fixed residual variance.
}

\description{ rrBlupMethod6 -- Re-parametrization of the mixed model
  formulation of Kang et al. (2008), to allow for a fixed residual
  variance when using RR-BLUP for genomwide estimation of marker
  effects.}

\details{
\tabular{ll}{
Package: \tab rrBlupMethod6\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-11-18\cr
License: \tab GNU General Public License Version 2, June 1991\cr
LazyLoad: \tab yes\cr
}

Kang et al. (2008) describe an efficient mixed model formulation for the
special case of only one random effect, which avoids any matrix
computation in the REML estimation of variance components. Piepho et al.
(2011) re-parametrize their formulation to allow for a fixed
residual variance. This re-parametrization might be especially useful in a
plant breeding context. Here, the phenotypes used for estimation of
marker effects are commonly the adjusted (for all other random and fixed
effects) entry means, obtained beforehand from a one- or two-step
adjustment procedure, most likely a mixed-model analysis (Moehring and Piepho, 2009). From this analysis, good estimates of the residual variance
are usually available, so that it is not necessary and even
counterproductive to re-estimate this parameter in RR-BLUP (Moehring and
Piepho, 2009). Please see Piepho et al. (2011) for details.

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
  Piepho et al. (2011): Efficient computation of ridge-regression BLUP in
  genomic selection in plant breeding (submitted to Crop Science)
  
  Kang et al. (2011): Efficient control of population structure in model
  organism association mapping. Genetics 178:1709-1723

  Moehring, J., Piepho, H. P. (2009): Comparison of weighting in
  two-stage analyses of series of experiments. Crop Science 49, 1977-1988
}

\keyword{package}
\keyword{models}

\seealso{\code{\link{rrBlupM6}}}