# Hooded Warbler Habitat Modeling

This project uses ecological modeling to predict the habitat suitability of the Hooded Warbler (*Setophaga citrina*) under current and forecasted climate conditions.

## Overview

This analysis integrates presence/absence data of the Hooded Warbler with climate variables (temperature and precipitation) to build a logistic regression model. The model predicts the suitability of habitats across a range of environmental conditions, both current and future (forcasting 50 years ahead).

### Key Steps:
1. **Load Data**: Presence/absence data and climate data (current and forecasted).
2. **Modeling**: Build a logistic regression model using temperature and precipitation as predictors.
3. **Evaluation**: Evaluate the model performance using ROC curve.
4. **Prediction**: Generate predictions for current habitat suitability.
5. **Threshold Selection**: Choose an optimal threshold to determine suitable habitat areas.
6. **Forecast**: Predict future habitat suitability and evaluate changes over the next 50 years.

## Requirements

- R Libraries: `dismo`, `dplyr`, `ggplot2`
- Climate data in raster format (`env_current.grd`, `env_forecast.grd`)
- Presence/absence data in CSV format (`hooded_warb_locations.csv`)

## Results

The model outputs predicted suitable habitats for the Hooded Warbler under current conditions, as well as future forecasts under changing climate scenarios.

### Example Visualizations:
 - **Presence of the Species **
![Presence_absentvsEnv](https://github.com/user-attachments/assets/fb3123e6-47e3-429f-9e8f-3b09e0cc903d)

- **Current Climate Predictions**  
  ![precp](https://github.com/user-attachments/assets/e858ad3b-456c-48ba-a3f1-cf27405d36f3)
  
- **Future Forecast Habitat Suitability**  
  ![predict](https://github.com/user-attachments/assets/f2a89c70-6c74-4253-8d5a-d828d9f74532)

- **Predicted Changes Over 50 Years**  
  ![forecast](https://github.com/user-attachments/assets/3252fe50-1dfc-45e7-92b5-0e8396ccd467)

## How to Run

1. Download the necessary data files (`hooded_warb_locations.csv`, `env_current.grd`, `env_forecast.grd`).
2. Install required R packages:  
   ```R
   install.packages(c("dismo", "dplyr", "ggplot2"))
   ```
3. Load the data and run the R script provided. Adjust the file paths to your local data.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
