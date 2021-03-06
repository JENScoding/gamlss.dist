############################################
#########     gamlss.dist        ###########
#########   Distribution tests   ###########
## Zero adjusted Inverse Gaussian: ZAIG() ##
############################################

## Context
testthat::context("ZAIG")

## Seed
set.seed(2345)

## Family
fam <- ZAIG()

## Random Values
n <- 2e4    # a larger sample size gives uniroot errors
mu <- 1
sigma <- 1
nu <- 0.1
rvec <- rZAIG(n, mu, sigma, nu)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma, nu)
vx_theo <- fam$variance(mu, sigma, nu)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)

