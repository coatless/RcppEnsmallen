% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{lin_reg_lbfgs}
\alias{lin_reg_lbfgs}
\title{Linear Regression with L-BFGS}
\usage{
lin_reg_lbfgs(X, y)
}
\arguments{
\item{X}{A \code{matrix} that is the Design Matrix for the regression problem.}

\item{y}{A \code{vec} containing the response values.}
}
\value{
The estimated \eqn{\beta}{beta} parameter values for the linear regression.
}
\description{
Solves the Linear Regression's Residual Sum of Squares using the L-BFGS
optimizer.
}
\details{
Consider the \strong{Residual Sum of Squares}, also known as \strong{RSS}, defined as:
\deqn{RSS\left( \beta \right) = \left( { \mathbf{y} - \mathbf{X} \beta } \right)^{T} \left( \mathbf{y} - \mathbf{X} \beta \right)}{RSS(beta) = (y - X*beta)^T * (y - X*beta)}
The objective function is defined as:
\deqn{f(\beta) = (y - X\beta)^2}{f(beta) = (y - X * beta)^2}
The gradient is defined as:
\deqn{\frac{\partial RSS}{\partial \beta} = -2 \mathbf{X}^{T} \left(\mathbf{y} - \mathbf{X} \beta \right)}{dRSS/dbeta = -2 X^T (y - X * beta)}
}
\examples{
# Number of Points
n = 1000

# Select beta parameters
beta = c(-2, 1.5, 3, 8.2, 6.6)

# Number of Predictors (including intercept)
p = length(beta)

# Generate predictors from a normal distribution
X_i = matrix(rnorm(n), ncol = p - 1)

# Add an intercept
X = cbind(1, X_i)

# Generate y values
y = X\%*\%beta + rnorm(n / (p - 1))

# Run optimization with lbfgs
theta_hat = lin_reg_lbfgs(X, y)

# Verify parameters were recovered
cbind(actual = beta, estimated = theta_hat)
}
