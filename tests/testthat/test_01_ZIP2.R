###########################################
########     gamlss.dist        ###########
########   Distribution tests 2 ###########
## Zero inflated Poisson type 2 : ZIP2() ##
###########################################

## Context
testthat::context("ZIP2 2")

## Seed
set.seed(269)

## Family
fam <- ZIP2()

## Random Values
i <- 0.5
n <- 1e6
mu <- 5 + i
sigma <- 0.1 + i
rvec <- rZIP2(n, mu, sigma) 

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here if they are about the same
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.04) # converges for higher n
