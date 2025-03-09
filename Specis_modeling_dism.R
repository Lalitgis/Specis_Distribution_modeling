library(dismo)
library(dplyr)
library(ggplot2)

###### Load data #####################
#Presence and absence data 
hooded_warb_data = read.csv('hooded_warb_locations.csv')

#################Climate forcast data ####################
env_data_current = stack("env_current.grd")
env_data_forcast = stack("env_forecast.grd")
########## It has two layer stack ie tmin & precipitation #######
plot(env_data_current$tmin)
plot(env_data_current$precip)

########## Combine the data ###################
hooded_warb_locations = select(hooded_warb_data, lon, lat) #order is imp first X and Y

hooded_warb_env = extract(env_data_current, hooded_warb_locations)

###combine data ######### Tempr should be divided by 10 for actual unit

hooded_ward_data = cbind(hooded_warb_data, hooded_warb_env)

ggplot(hooded_ward_data,
       mapping = aes(x = tmin, y = precip, color = present))+
  geom_point()

################ Modeling ####################

logistic_regr_model = glm(present~tmin + precip,
                          family = binomial(link = 'logit'),
                          data = hooded_ward_data)

summary(logistic_regr_model)

########## Evaluate model before predicting #######################

presence_data = filter(hooded_ward_data, present ==1)
absence_data = filter(hooded_ward_data, present == 0)

evaluation = evaluate(presence_data, absence_data, logistic_regr_model)
plot(evaluation, 'ROC')

############ Make prediction ###########################
predictions = predict(env_data_current, 
                      logistic_regr_model,
                      type = 'response')

plot(predictions, ext = extent(-140, -50, 25,60))

########## Verify model #######################
points(presence_data[c("lon", "lat")], pch = "+", cex = 0.5)

############ Providing threshold ##########################

plot(predictions > 0.5, ext = extent(-140, -50, 25,60))

############ Function to help us choose threshold ################

tr = threshold(evaluation, stat = 'prevalence')
plot(predictions > tr, ext = extent(-140, -50, 25,60))

points(presence_data[c("lon", "lat")], pch = "+", cex = 0.5)


################### Actual Forecast ################################
forecasts = predict(env_data_forcast, 
                    logistic_regr_model,
                    type = 'response')
plot(forecasts, ext = extent(-140, -50, 25,60))

plot(forecasts > tr, ext = extent(-140, -50, 25,60))

################### Predicted changes over next 50 years
plot(forecasts - predictions, ext = extent(-140, -50, 25,60))

############ Thank you ##########################################