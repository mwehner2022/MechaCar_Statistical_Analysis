> #Challenge 1
> #import dplyr
> library(dplyr)

> #read csv
> MechaCarData <- read.csv(file='Starter_Code/MechaCar_mpg.csv', check.names=F,stringsAsFactors = F)
> head(MechaCarData)
  vehicle_length vehicle_weight spoiler_angle ground_clearance AWD      mpg
  1       14.69710       6407.946      48.78998         14.64098   1 49.04918
  2       12.53421       5182.081      90.00000         14.36668   1 36.76606
  3       20.00000       8337.981      78.63232         12.25371   0 80.00000
  4       13.42849       9419.671      55.93903         12.98936   1 18.94149
  5       15.44998       3772.667      26.12816         15.10396   1 63.82457
  6       14.45357       7286.595      30.58568         13.10695   0 48.54268
> # generate multiple linear regression model
> lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCarData) 
  
  Call:
    lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
         ground_clearance + AWD, data = MechaCarData)
  
  Coefficients:
    (Intercept)    vehicle_length    vehicle_weight     spoiler_angle  ground_clearance               AWD  
  -1.040e+02         6.267e+00         1.245e-03         6.877e-02         3.546e+00        -3.411e+00  
  
> #get summary stats
    > summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCarData)) 
  
  Call:
    lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
         ground_clearance + AWD, data = MechaCarData)
  
  Residuals:
    Min       1Q   Median       3Q      Max 
  -19.4701  -4.4994  -0.0692   5.4433  18.5849 
  
  Coefficients:
    Estimate Std. Error t value Pr(>|t|)    
  (Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
    vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
    vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
  spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
  ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
    AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
  ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
  
  Residual standard error: 8.774 on 44 degrees of freedom
  Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
  F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11
  
> #Challenge 2
> # read in Suspension_Coil.csv
> Suspension_coil <- read.csv(file='Starter_Code/Suspension_Coil.csv', check.names=F,stringsAsFactors = F)
> head(Suspension_coil)
  VehicleID Manufacturing_Lot  PSI
  1    V40858              Lot1 1499
  2    V40607              Lot1 1500
  3    V31443              Lot1 1500
  4     V6004              Lot1 1500
  5     V7000              Lot1 1501
  6    V17344              Lot1 1501
  
> # total summary dataframe
> total_summary <- Suspension_coil %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
  Mean     Median   Variance       SD
  1498.78   1500     62.29356      7.892627
  
> # total lot_summary dataframe
> lot_summary <- Suspension_coil %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
> head(lot_summary)
  # A tibble: 3 × 5
  Manufacturing_Lot  Mean Median Variance     SD
  <chr>             <dbl>  <dbl>    <dbl>  <dbl>
  1 Lot1              1500   1500     0.980  0.990
  2 Lot2              1500.  1500     7.47   2.73 
  3 Lot3              1496.  1498.    170.   13.0

> #Challenge 3
> # t-test all lots vs population
> t.test((Suspension_coil$PSI), mu=1500)
    One Sample t-test
  
  data:  (Suspension_coil$PSI)
  t = -1.8931, df = 149, p-value = 0.06028
  alternative hypothesis: true mean is not equal to 1500
  95 percent confidence interval:
    1497.507 1500.053
  sample estimates:
  mean of x 
    1498.78 

> # t-test for lot 1
> t.test(subset(Suspension_coil$PSI,Suspension_coil$Manufacturing_Lot=="Lot1"), mu=1500)
    One Sample t-test
    
  data:  subset(Suspension_coil$PSI, Suspension_coil$Manufacturing_Lot == "Lot1")
  t = 0, df = 49, p-value = 1
  alternative hypothesis: true mean is not equal to 1500
  95 percent confidence interval:
    1499.719 1500.281
  sample estimates:
  mean of x 
  1500     
> # t-test for lot 2
> t.test(subset(Suspension_coil$PSI,Suspension_coil$Manufacturing_Lot=="Lot2"), mu=1500)
    One Sample t-test
  
  data:  subset(Suspension_coil$PSI, Suspension_coil$Manufacturing_Lot == "Lot2")
  t = 0.51745, df = 49, p-value = 0.6072
  alternative hypothesis: true mean is not equal to 1500
  95 percent confidence interval:
    1499.423 1500.977
  sample estimates:
  mean of x 
  1500.2   

> # t-test for lot 3
>t.test(subset(Suspension_coil$PSI,Suspension_coil$Manufacturing_Lot=="Lot3"), mu=1500)
    One Sample t-test
  
  data:  subset(Suspension_coil$PSI, Suspension_coil$Manufacturing_Lot == "Lot3")
  t = -2.0916, df = 49, p-value = 0.04168
  alternative hypothesis: true mean is not equal to 1500
  95 percent confidence interval:
    1492.431 1499.849
  sample estimates:
  mean of x 
  1496.14

    