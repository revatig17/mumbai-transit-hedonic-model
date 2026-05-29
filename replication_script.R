install.packages(c("tidyverse", "geosphere", "tidygeocoder"))
library(tidyverse)
library(tidygeocoder)
library(geosphere)


##creating geocodes 
#creating amentity score 
data_with_amenities <- raw_data %>%
  mutate(Amenity_Score = rowSums(select(., Gymnasium:`Swimming Pool`)))

data_with_amenities

##Creating a clean, manual distance lookup table for Mumbai's major nodes.
# These represent rough distances (in km) to a central business/transit hub like BKC.

location_lookup <- data.frame(
  Location = c("Kharghar", "Thane West", "Andheri East", "Malad West", 
               "Kandivali West", "Malad East", "Virar", "Mira Road East", 
               "Goregaon West", "Andheri West", "Koparkhairane", "Ghatkopar West", 
               "Chembur", "Jogeshwari West", "Borivali West", "Panvel"),
  Distance_to_Metro = c(28.5, 22.1, 4.2, 14.5, 
                        16.2, 13.8, 55.1, 26.3, 
                        11.4, 6.8, 19.5, 10.1, 
                        11.2, 8.5, 20.3, 34.8))

final_policy_data <- inner_join(data_with_amenities, location_lookup, by = "Location")

print(paste("Usable rows for regression:", nrow(final_policy_data)))

colnames(final_policy_data)

mumbai_real_estate_model <- lm(log(Price) ~ Area + `No. of Bedrooms` + `New/Resale` +
                                 Amenity_Score + Distance_to_Metro,
                               data = final_policy_data)
                              
# Print the final results 
summary(mumbai_real_estate_model)

##visualization of model

ggplot(data = final_policy_data, aes(x=Distance_to_Metro, y=log(Price))) +
  geom_point(alpha = 0.3, color = "#2c3e50", size = 1.5) +
  geom_smooth(method = "lm", color = "#e74c3c", size = 1.2, se = TRUE) +
  labs(
    title = "Transit Proximity & Residential Land Value in Mumbai",
    subtitle = "Visualizing the log-linear impact of Metro distance on property premiums",
    x = "Distance to Nearest Metro Station / Transit Hub (km)",
    y = "Log of Property Price [ln(INR)]",
    caption = "Source: Market Analysis Model | Sample Size ~6,300 Listings"
  )
