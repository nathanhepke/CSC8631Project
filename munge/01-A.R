# Example preprocessing script.
View(cyber_security_1_enrolments)
View(cyber_security_6_enrolments)
View(cyber_security_7_enrolments)

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

fully_participated_run1 = fully_participated_run1 %>% mutate(run_number="Run 1")
fully_participated_run2 = fully_participated_run2 %>% mutate(run_number="Run 2")
fully_participated_run3 = fully_participated_run3 %>% mutate(run_number="Run 3")
fully_participated_run4 = fully_participated_run4 %>% mutate(run_number="Run 4")
fully_participated_run5 = fully_participated_run5 %>% mutate(run_number="Run 5")
fully_participated_run6 = fully_participated_run6 %>% mutate(run_number="Run 6")
fully_participated_run7 = fully_participated_run7 %>% mutate(run_number="Run 7")

fully_participated_runs = merge(fully_participated_run1,fully_participated_run2, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run3, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run4, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run5, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run6, all = TRUE)
fully_participated_runs = merge(fully_participated_runs, fully_participated_run7, all = TRUE)

fully_participated_runs
