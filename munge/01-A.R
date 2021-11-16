# Example preprocessing script.
library(dplyr)

View(cyber_security_1_enrolments)
View(cyber_security_6_enrolments)
View(cyber_security_7_enrolments)

# removing all the NA's that are included in any of the rows that I need data from

fully_participated_run1 = filter(cyber_security_1_enrolments, fully_participated_at != "NA",
                                 gender != "Unknown", country != "Unknown", age_range != "Unknown",
                                 highest_education_level != "Unknown", employment_status != "Unknown",
                                 employment_area != "Unknown")

fully_participated_run2 = filter(cyber_security_2_enrolments, fully_participated_at != "NA",
                                 gender != "Unknown", country != "Unknown", age_range != "Unknown",
                                 highest_education_level != "Unknown", employment_status != "Unknown",
                                 employment_area != "Unknown")

fully_participated_run3 = filter(cyber_security_3_enrolments, fully_participated_at != "NA",
                                 gender != "Unknown", country != "Unknown", age_range != "Unknown",
                                 highest_education_level != "Unknown", employment_status != "Unknown",
                                 employment_area != "Unknown")

fully_participated_run4 = filter(cyber_security_4_enrolments, fully_participated_at != "NA",
                                 gender != "Unknown", country != "Unknown", age_range != "Unknown",
                                 highest_education_level != "Unknown", employment_status != "Unknown",
                                 employment_area != "Unknown")

fully_participated_run5 = filter(cyber_security_5_enrolments, fully_participated_at != "NA",
                                 gender != "Unknown", country != "Unknown", age_range != "Unknown",
                                 highest_education_level != "Unknown", employment_status != "Unknown",
                                 employment_area != "Unknown")

fully_participated_run6 = filter(cyber_security_6_enrolments, fully_participated_at != "NA",
                                 gender != "Unknown", country != "Unknown", age_range != "Unknown",
                                 highest_education_level != "Unknown", employment_status != "Unknown",
                                 employment_area != "Unknown")

fully_participated_run7 = filter(cyber_security_7_enrolments, fully_participated_at != "NA",
                                 gender != "Unknown", country != "Unknown", age_range != "Unknown",
                                 highest_education_level != "Unknown", employment_status != "Unknown",
                                 employment_area != "Unknown")

# adding a run_number column to each data frame
fully_participated_run1 = fully_participated_run1 %>% mutate(run_number="Run 1")
fully_participated_run2 = fully_participated_run2 %>% mutate(run_number="Run 2")
fully_participated_run3 = fully_participated_run3 %>% mutate(run_number="Run 3")
fully_participated_run4 = fully_participated_run4 %>% mutate(run_number="Run 4")
fully_participated_run5 = fully_participated_run5 %>% mutate(run_number="Run 5")
fully_participated_run6 = fully_participated_run6 %>% mutate(run_number="Run 6")
fully_participated_run7 = fully_participated_run7 %>% mutate(run_number="Run 7")

# merging all of the data frames together to make a complete data frame with everyone
# that has completed the course with a full set of data

fully_participated_runs = merge(fully_participated_run1,fully_participated_run2, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run3, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run4, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run5, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run6, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run7, all = TRUE)

fully_participated_runs

# identifying the unique country codes
unique(fully_participated_runs$country)

# adding a region column
fully_participated_runs <- mutate (fully_participated_runs, region = case_when(country %in%
                                                         c("GB","PT","IT","GR","CH","IE","DE","BY","FR","MD",
                                                           "UA","NL","SE","AT","ME","ES","CY","AL","RS","MT","AZ")~ "Europe",
                                                       country %in% c("JP","IN","SA","OM","TH","MM","YE","IQ","MY","PH","ID","LK",
                                                         "NP","CN","JO","QA","AE","SG","AF","KR","IR","TL")~"Asia",
                                                       country %in% c("VE","BR","CW","AR","PE","BO","CL","GY")~"South America",
                                                       country %in% c("AU","FJ")~"Oceania", 
                                                       country %in% c("US","MX","CA","BB")~"North America",
                                                       country %in% c("NG","GH","TZ","ZA","KE","MU","EG","ZM","SN","UG","AO",
                                                           "CI","LR","ET")~"Africa"))

# adding a time column from first enrolled to time participated
library(lubridate)
time_completed_in_secs = as_datetime(fully_participated_runs$fully_participated_at)- as_datetime(fully_participated_runs$enrolled_at)
time_completed_in_days = time_completed_in_secs / 86400

# adding the time column
fully_participated_runs <- mutate (fully_participated_runs, time_completed_in_days = time_completed_in_days)

View(fully_participated_runs)

#removing columns that are not needed 
fully_participated_runs <- select(fully_participated_runs, -c(unenrolled_at, purchased_statement_at, time_completed_in_days))

View(fully_participated_runs)
