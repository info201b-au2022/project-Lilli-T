# Creates a table of summary information in report

rooms <- read.csv("../data/building_aq_analysis_data.csv")
library(knitr)
library(tidyverse)

period_mean <- function(building, priod) {
  summary <- rooms %>%
    filter(bldg == building) %>%
    filter(period == priod) %>%
    group_by(room) %>%
    summarize(mean = mean(value, na.rm = TRUE))
  return(summary)
}

# show each room average when Typical period vs Forest Fire period
# group by 

# filter Wurster corridor1, pantry, cubicle3, outside
# filter typical
# group by room
# summarize average
avgs_wur_typ <- period_mean("Wurster (NV)", "Typical") %>%
  rename(mean_typ = mean)
avgs_wur_typ$room <- paste0("w", avgs_wur_typ$room)

# filter Wurster corridor1, pantry, cubicle3, outside
# filter forest fire
# group by room
# summarize average
avgs_wur_ff <- period_mean("Wurster (NV)", "Forest fire") %>%
  rename(mean_ff = mean)
avgs_wur_ff$room <- paste0("w", avgs_wur_ff$room)

# left join
avg_wur <- left_join(avgs_wur_typ, avgs_wur_ff, by = "room")

# filter 4th inside, outside
# filter typical
# group by room
# summarize average
avgs_fth_typ <- period_mean("4th St (MV)", "Typical") %>%
  rename(mean_typ = mean)
avgs_fth_typ$room <- paste0("f", avgs_fth_typ$room)

# filter 4th inside, outside
# filter forest fire
# group by room
# summarize average
avgs_fth_ff <- period_mean("4th St (MV)", "Forest fire") %>%
  rename(mean_ff = mean)
avgs_fth_ff$room <- paste0("f", avgs_fth_ff$room)

# left join
avg_fth <- left_join(avgs_fth_typ, avgs_fth_ff, by = "room")

# stack dfs rbind
avgs <- rbind(avg_wur, avg_fth) %>%
  arrange(-mean_typ)

summ_table <- function() {
  return(kable(avgs))
}
