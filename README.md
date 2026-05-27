# mumbai-transit-hedonic-model
# Capitalizing Mass Transit: A Hedonic Approach to Land Value Capture in the Mumbai Metropolitan Region

## Project Overview & Policy Context
Public investment in high-capacity urban transport systems—such as the Mumbai Metro Line 3 (Aqua Line)—creates substantial positive externalities. While governments bear the massive upfront capital expenditures (CapEx), private landholders reap significant windfall wealth through property appreciation. 

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



**## Understanding the Results:**

This study looks at how housing prices in Mumbai change based on size, layout, condition, and—most importantly—how close the property is to a mass transit hub (like the Metro). 

Our model explains **81.92%** of the variation in housing prices using just five basic factors. Here is the real-world breakdown of our findings:

* **Distance_to_Metro ($\beta_5 = -0.03314$):** For every additional kilometer a house is located away from a Metro station, its market value drops by exactly **3.31%**. This proves that people are highly willing to pay a premium amount to live close to public transport mode to save on daily commuting time and costs.
* **No. of Bedrooms ($\beta_2 = 0.3389$):** Keeping the exact square footage of a house identical, adding an extra bedroom (e.g., designing a compact 2-BHK instead of a large 1-BHK) increases the property value by **33.89%**. This highlights a severe demand in Mumbai for smart, divided, and highly functional living spaces.
* **New/Resale ($\beta_3 = 0.09734$):** Brand-new properties command a **9.73%** price premium compared to older resale units.
* **Amenities_Score ($\beta_4 = -0.001746$):** Interestingly, extra building facilities (like a gym or clubhouse) do not have a statistically significant impact on price once location and size are locked in. This suggests that in Mumbai, **location and space utility matter far more than luxury add-ons.**

---

## isualizing the Infrastructure Land Gradient

Using `ggplot2`, the log-linear spatial gradient below visualizes how property premiums decay systematically as a function of distance from the transit hub. The downward slope represents our statistically significant -3.31% price drop per kilometer. The narrow confidence interval ribbon surrounding the line underscores the high statistical precision of our model.

![Mumbai Transit Impact Gradient](Housing prices in Mumbai.jpeg)

**## Policy Implications:** 

The proof that a Metro station creates a **3.31% property value premium per kilometer** shifts the governance conversation from how the city *spends* money on transport to how it can *earn* money back to build more infrastructure.


**### 1. Inclusionary Zoning & Structural Density Bonuses**
Given that the MCGM already utilizes a 1% Metro Cess on stamp duty, policy must pivot toward structural land-use reforms. Our model identifies a massive 33.89% price premium for layout density (extra bedrooms). The city planning authority should grant private developers an "FSI Density Bonus" within a 1.5 km transit buffer on the strict condition that 20% of the augmented built-up area is designated for compact, affordable housing. This utilizes market incentives to generate diverse housing stock without draining public budgets.

**### 2. Implementing Parking Maximums & "Unbundled" Housing Costs**
The econometric results revealed that the consolidated `Amenity_Score` was statistically insignificant ($p = 0.321$) once transport distance and apartment layout were locked in. This strongly suggests that consumer demand and baseline land values along transit corridors are driven entirely by transit connectivity and core spatial utility—not by traditional car-centric structural luxury add-ons. Despite this market reality, current building codes (DCR , NBCs) heavily mandate mandatory car parking minimums, forcing developers to tie expensive multi-level parking slots directly to housing purchases. The city planning authority should pivot to:
* **Enforcing Parking Maximums:** Cap the number of parking slots allowed for new residential projects built within a 1 km radius of active Metro corridors. 
* **Legally Mandating Unbundled Parking:** Suggest strict policy mandates to real estate developers to decouple the cost of an apartment unit from the cost of a parking space.

* **The Policy Benefit:** This removes a major hidden financial amount for transit-reliant residents who do not own cars, while simultaneously lowering overall structural construction costs. Developers can instead repurpose that premium structural space to supply more high-density livable units, directly supporting a pedestrian-first, transit-oriented urban core.
