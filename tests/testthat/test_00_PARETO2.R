#######################################
#######     gamlss.dist        ########
#######   Distribution tests   ########
###### Pareto type 2: PARETO2() #######
#######################################

## Context
testthat::context("PARETO2")

## Seed
set.seed(222)

## Family
fam <- PARETO2()

## Random Values
n <- 1e6  
mu <- 1
sigma <- 0.1
rvec <- rPARETO2(n, mu, sigma)

## Empirical Moments
ex_emp <- mean(rvec)
vx_emp <- var(rvec)

## Theoretical moments
ex_theo <- fam$mean(mu, sigma)
vx_theo <- fam$variance(mu, sigma)

## Test here
expect_true(abs(ex_emp - ex_theo) < 0.02)  
expect_true(abs(vx_emp - vx_theo) < 0.02)  

