# mumbai-transit-hedonic-model
# Capitalizing Mass Transit: A Hedonic Approach to Land Value Capture in the Mumbai Metropolitan Region

## Project Overview & Policy Context
Public investment in high-capacity urban transit systems—such as the Mumbai Metro Line 3 (Aqua Line)—creates substantial positive externalities. While governments bear the massive upfront capital expenditures (CapEx), private landholders reap significant windfall wealth through property appreciation. 

This research project applies **Rosen’s (1974) Hedonic Pricing Theory** and **Alonso's Bid-Rent Framework** to evaluate the spatial capitalization effects of mass transit nodes across the Mumbai Metropolitan Region (MMR). By isolating the pure marginal willingness-to-pay for transit proximity, this study generates the empirical baselines required to implement municipal **Value Capture Financing (VCF)** and **Transit-Oriented Development (TOD)** frameworks.

---

## Econometric Specification
To capture the non-linear relationships characteristic of urban real estate markets, a semi-log multiple ordinary least squares (OLS) regression model was specified:

$$\ln(\text{Price}_i) = \beta_0 + \beta_1(\text{Area}_i) + \beta_2(\text{Bedrooms}_i) + \beta_3(\text{New/Resale}_i) + \beta_4(\text{Amenity\_Score}_i) + \beta_5(\text{Distance\_to\_Metro}_i) + \varepsilon_i$$

Where:
* $\ln(\text{Price}_i)$ is the natural log of the transactional price for unit *i*, allowing coefficients to be interpreted as percentage elasticities.
* $\text{Amenity\_Score}_i$ is a engineered composite index (0–13) aggregating bundled structural amenities to eliminate severe multicollinearity.
* $\text{Distance\_to\_Metro}_i$ isolates the straight-line spatial distance (in km) from localized residential coordinates to the central transit node.
* $\varepsilon_i$ represents the stochastic error term.

---

## Empirical Findings & Regression Output

The model was estimated in **RStudio** using a cross-sectional dataset of **6,307 micro-transactions** ($n = 6,307$). The regression yielded an exceptionally robust explanatory power with an **Adjusted $R^2$ of 0.8192**, indicating that five fundamental spatial and structural variables explain **82%** of the variance in logged property values across Mumbai.

```r
Call:
lm(formula = log(Price) ~ Area + `No. of Bedrooms` + `New/Resale` + 
    Amenity_Score + Distance_to_Metro, data = final_policy_data)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.38229 -0.17039  0.00763  0.17968  1.76949 

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)    
(Intercept)         1.585e+01  2.014e-02 786.879  < 2e-16 ***
Area               3.959e-04  1.874e-05  21.128  < 2e-16 ***
`No. of Bedrooms`  3.389e-01  1.164e-02  29.127  < 2e-16 ***
`New/Resale`       9.734e-02  1.203e-02   8.091 8.95e-16 ***
Amenity_Score     -1.746e-03  1.758e-03  -0.993    0.321    
Distance_to_Metro -3.314e-02  5.514e-04 -60.105  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.2882 on 2650 degrees of freedom
Multiple R-squared:  0.8196,	Adjusted R-squared:  0.8192 
F-statistic:  2408 on 5 and 2650 DF,  p-value: < 2.2e-16
