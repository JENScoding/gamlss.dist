#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
# Second parametr. of Weibull: WEI2() #
#######################################

## Context
testthat::context("WEI2")

## Seed
set.seed(222)

## Family
fam <- WEI2()

## Random Values
mu <- 1
sigma <- 1
n <- 1e6  # default is 1e6, smaller sample if loading takes too long
rvec <- rWEI2(n, mu, sigma)

## Empirical Moments
ex_emp <- round(mean(rvec), 3)
vx_emp <- round(var(rvec), 3)

## Theoretical moments
ex_theo <- round(fam$mean(mu, sigma),3)
vx_theo <- round(fam$variance(mu, sigma),3)

## Test here
dev = ifelse(n >= 1e6, 0.02, ifelse(n >= 1e5, 0.035, 0.05)) # larger deviation possible, if sample smaller
expect_true(abs(ex_emp - ex_theo) < dev)  
expect_true(abs(vx_emp - vx_theo) < dev)  
