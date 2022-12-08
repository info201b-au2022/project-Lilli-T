genenerate_report <- function() {
  report <- "

  # Integrating Wildfire Protection: Project Proposal

  ## Code Name: Smoky Shelters

  ## Authors

  Lilli Toone; tlilli@uw.edu  
  
  Patricia Ma; aidim@uw.edu  
  
  Rachel He; rachelxw@uw.edu  

  ## Affiliation

  INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

  ## Date

  Autumn 2022

  ## Abstract

  In this project, we aim to thoroughly examine datasets on wildfire’s negative impact on participants’
  physical health and the correlation between their health condition and personal cautiousness with the
  declining air quality. We will educate ourselves by analyzing three datasets and providing an in-depth
  report on our research questions regarding wildfire and physical well being.

  ## Key Words

  Wildfire, community development, air quality, building safety

  ## Introduction

  As climate change continues to affect our ecosystems, the rate and intensity of annual wildfires have
  increased in the Pacific Northwest ([EPA, 2021](https://www.epa.gov/climate-indicators/climate-change-indicators-wildfires)).
  With this increase comes a threat to public health, as people have no choice but to breathe in smoke
  particles. We are concerned with how these community members currently protect themselves from hazardous
  health conditions caused by wildfires. Answering this question can not only suggest to urban planners
  methods to keep their residents safe, but it can also encourage these residents to be more conscious
  of the negative effects of wildfires. We hope to provide an in-depth analysis of the safest places to
  stay during wildfire season. We will address this concern by examining three data sets on recent trends
  of wildfire intensities, how college students perceive and navigate poor air quality from smoke, and the
  safest locations within buildings during wildfire seasons.

  ## Problem Domain

  **Background:** Wildfires emit carbon dioxide and other greenhouse gasses that will continue to warm
  the planet well into the future. They damage forests that would otherwise remove CO2 from the air.
  They also emit soot and other aerosols into the atmosphere, with complex effects on global warming
  and cooling ([Berwyn, 2020](https://insideclimatenews.org/news/23082018/extreme-wildfires-climate-change-global-warming-air-pollution-fire-management-black-carbon-co2/)).
  The increased air pollution can cause a range of health issues such as respiratory problems. Even in
  healthy people, exposures to fine particles can potentially lead to transient reductions in lung function,
  and pulmonary inflammation ([EPA, 2021](https://www.epa.gov/wildfire-smoke-course/health-effects-attributed-wildfire-smoke)).

  **Relevance:** Wildfires and volcanic activities affected 6.2 million people between 1998-2017
  with 2400 attributable deaths worldwide from suffocation, injuries, and burns
  ([WHO, 2018](https://www.who.int/health-topics/wildfires#tab=tab_1)), but the size and frequency of
  wildfires are increasing due to climate change.

  **Human values:** We value accessibility and inclusivity. Although there may be protective facilities
  regarding wildfire smoke, those may not be available to people with differing abilities. We examine
  data beyond the PMI levels of rooms by using results from surveys. We believe that health resources
  should be available to everyone, and we take into account how people define accessibility and
  inclusiveness of healthy spaces.

  **Indirect Stakeholders:** Policy makers are indirect stakeholders since they can get access
  to recent development of wildfires and people’s responses about it. If community members are
  passionate and share our concern of wildfire threat, policy makers may respond to that by using
  our data analysis as evidence. If people take wildfires less seriously than researchers, for
  example, policymakers can also take action to increase awareness through advocacy efforts.
  Additionally, student advocacy groups are indirect stakeholders because they may use our report
  as a starting point to poll university members on their wildfire concerns.

  **Direct Stakeholders:** Our project team is one of the direct stakeholders as our project
  success depends on our decisions and contributions. The researchers who collected the data
  we are using are also stakeholders because their work is being used to produce a report that
  could impact others.

  **Potential Benefits and Harms:** The potential benefits of our project is to provide motivations
  and inspirations for engineers and architects to construct safer buildings in areas prone to wildfires.
  The potential harm is that the analysis might induce anxiety in some readers because natural
  disasters like wildfires are uncontrollable events which happen annually, and corresponding
  building reconstructions require substantial capital investment and design dedication.

  ## Research Questions

  1. Does the general health of a survey participant affect their consciousness of the negative health effects of wildfires? This is a question to expose possible disparities between the health concerns of a generally healthy individual versus a generally unhealthy individual. Knowledge of this encourages building planners to consider the accessibility of the shelters available.
  2. Does the geographic location of a survey participant affect their perception of wildfires? This question explores how an individual’s analysis of perceived danger correlates to their daily surroundings. Data analysts must be aware that a survey respondent answers in the context of their daily life, so answers are affected by intersectionality.
  3. Which rooms do people imagine to be the safest during an increase in air pollutants due to wildfire smoke? This question is crucial to understanding possible reasons for taking shelter in certain areas, and this more clearly defines the meaning of safety as the mix between emotional and physical safety.
  4. Which rooms have the best measured air quality during an increase in wildfire smoke? This question allows for a comparison between perceived safety and scientific safety, as measured by the amount of pollutants in the air. Building planners can use this data to create spaces that both protect against pollutants and are an inviting environment.

  ## The Data Set

  #### Room Pollution

  Our first data file came from 3 researchers; Jovan Pantelic, Megan Dawe, and Dusan Licina.
  They conducted the study at UC Berkeley in 2019. This set contains air quality data of
  pm2.5 particles, the primary pollutant in wildfire smoke, in specific buildings and
  rooms at UC Berkeley. The data is a time series, documented throughout different times
  of the day. This data set came from the researchers' examination of building’s
  resilience to wildfires and associated emissions of particulate matter indoors.
  We will use this data set to answer our third research question, which demands a
  quantitative analysis of building safety per room. We expect this data set to provide
  insight to the volume of pollution particles that people breathe in during wildfire season.
  The set will also help us to examine and how building structure protests individuals.
  The data is credible because it is a peer-reviewed scholarly article.

  Pantelic J, Dawe M, Licina D (2019) Use determining the resilience of buildings to forest fire generated PM2.5. PLoS ONE 14(10): e0223136.
  https://doi.org/10.1371/journal.pone.0223136

  #### Wildfire Records

  Our second data file came from the US Forest Service. It was published in May 2022, and
  it contains the wildfires documented since 1984 on a national scale. The data measures the
  acreage of damage, the high and low thresholds of temperature, and the coordinates for the fire.
  This data will be used for us to understand wildfire recurrence and severity. It will help us to
  answer the second research question, which is concerned with the locations that experience
  wildfires most frequently and most severely. It can be used in conjunction with our last data
  set to determine how the wildfire frequency of the locations of survey participants affect their
  responses to the survey. The data is credible because it comes from the federal Department of Agriculture.

  U.S., F. S. (2022, May 19). Monitoring trends in burn severity fire occurrence locations (feature layer). Catalog. Retrieved October 31, 2022, from https://catalog.data.gov/dataset/monitoring-trends-in-burn-severity-fire-occurrence-locations-feature-layer-67d6a

  #### Survey Data

  Our third and last data file contains survey results that record behavior of Boise Metropolitan Area
  residents in response to the 2018 summer California wildfires. It will help to answer our first research
  question, which is concerned with individuals' perceptions of wildfire threat. We will compare the
  perception of people with varying levels of physical and general health. We will also compare this
  data set to the first data set to examine if people's perceived safety of a room aligns with the relative
  level of pollution particles, pm2.5, in the room. The data is credible because it is a peer-reviewed scholarly article.

  Fowler, Mariah; Rad, Arash Modaresi; Utych, Stephen; Adams, Andrew; Alamian, Sanazsadat; Pierce, Jennifer; et al. (2019): A Dataset on Human Response to Wildfire Smoke. figshare. Collection. https://doi.org/10.6084/m9.figshare.c.4316795.v1

| Data Set Name | File Name | Number of Observations | Number of Variables |
|:--------------|:---------:|:----------------------:|:-------------------:|
| PM2.5 measurments of all sensors from 10/8/2018 until 10/21/2018 | building_aq_analysis_data.csv | 88,611 | 11 |
| Monitoring Trends in Burn Severity Fire Occurrence Locations (Feature Layer) | burn_severity_trends_data.csv | 29,533 | 24 |
| A Dataset on Human Response to Wildfire Smoke | human_response_data.csv | 614 | 29 |


  ## Expected Implications

  * Architects and building planners will reference our analysis to construct buildings with designated spaces that limit smoke. They will recognize that these spaces should also be accessible to people of lower general health. Additional experiments with new building materials and structures may be considered.

  * Governors will use our analysis to understand the general public’s cautiousness of wildfires' negative impacts on their physical health and how well the civilians are protected indoors during wildfire seasons. They will set up education and protective protocols to help citizens protect themselves, and budget fundings for infrastructure amelioration.

  * Other researchers in communities prone to wildfires, such as the Pacific Northwest, will begin to conduct their own surveys and experiments to test how local residents feel about the threats of wildfires. Policymakers may use their published work to establish possible regulations on building safety.

  ## Limitations

  Our data set surveys people in the Boise Metropolitan Area, so our data analysis is not
  representative of the general public in other cities; there may be different proportions of the elderly,
  college students, those in poverty, and other demographics compared to national levels. This narrows the
  scope of our study and reduces applicability to other urban buildings. Additionally, the building air
  quality data that we will use are based on university campuses in California, so our findings may only
  be applicable to a culture, environment, and buildings similar to those of California and its annual
  wildfires. We may address these limitations by adjusting our research question to also question
  community safety in California. However, this adjustment excludes possible implications for the
  increasing wildfires in the Pacific Northwest such as Washington, Idaho, and Southwestern Canada.
  By including implications for the Pacific Northwest, we hope to encourage the development of data
  sets that also contain survey results and building safety in locations outside of California.

  ## Findings

  #### Research Question 1

  **Does the general health of a survey participant affect their consciousness of the negative health effects of wildfires?**

  Using the chart shown in the _Action Responses_ tab, we can conclude that study participants
  who rank themselves as having excellent health take different courses of action compared
  to those who rank themselves as having poor health during wildfire season. In particular,
  those in excellent and good health voted **staying at home** as the most common course of action,
  while those in fair and poor health reported that **taking medication** was the most common
  course of action. Although we discovered a key difference in courses of action, one could
  suggest that this finding is insufficient to assess participants' _consciousness_ of
  wildfires. We argue that this is a fair indicator because the two actions require different
  levels of care; in particular, obtaining and taking medication requires extra consciousness of
  one's base level health, being evaluated by a professional, and in some cases paying money to
  receive treatment for negative health effects caused by wildfires.

  #### Research Question 2

  **Does the geographic location of a survey participant affect their perception of wildfires?**

  We decided to not focus on this research question due to the workload. We wanted to focus on
  delivering quality work for the other research questions.

  #### Research Question 3

  **Which rooms do people imagine to be the safest during an increase in air pollutants due to wildfire smoke?**

  The chart showing the occupancy of each room can be used to answer this question. It appears that
  rooms in Wurster Hall were the most populated during wildfire season, with the exception of
  4th street hotdesk number one. This room tied for second most occupied room. Comparing this to the
  results of our fourth research question, we can conclude that people in these buildings occupied the
  building with the **worst air quality**. Several rooms had the same occupancy proportion, and there
  was a large difference between rooms that were occupied and rooms with little occupation. Not many rooms
  were in the average occupancy rate.

  #### Research Question 4

  **Which rooms have the best measured air quality during an increase in wildfire smoke?**

  The chart showing the measured pm2.5 levels for each room suggests that all of the rooms followed
  a similar trend of pollutant levels throughout November of 2018, and all of the rooms provided
  significant protection compared to the pollutant levels outside. However, a clear pattern showed
  in which rooms in the 1608 4th Street Building, which used **mechanical ventilation**, contained
  significantly **less pollutant particles** than Wurster Hall, which used mixed ventilation overall
  and full natural ventilation during the study period. This occurred despite data that the air
  just outside of the 4th Street building was generally more polluted than the air outside of
  Wurster Hall. Another point seen from the graphs are that the rooms in Wurster Hall had a wider
  range of pollutant levels compared to the rooms in the 4th Street Building. Possible questions to
  study further include if particular features of a room can make a room more resistant to external
  pollutants.

  ## Discussion

  Before our intended audience can use our findings to build safer structures during wildfire season,
  it is important to recognize that further study of our current and other data sets should be conducted
  to confirm our thoughts. The reason for the discrepancy betweem actions taken depending on health
  level is one such topic that should be studied further. It may be because those in fair and poor
  health experienced negative health symptoms from poor air quality, or it may be that they acted out
  of precaution. This study could be executed using further analysis of this same dataset of survey results.

  Another topic of study is the unusual trend of people occupying the building with worse air quality.
  We assumed that participants would stay away from building with poor ventilation and lower perceived air quality,
  but our research suggested otherwise. We read in the metadata that people in the study perceived that
  Wurster Hall would have higher levels of pollutants. The reason for this should be investigated further.
  Possible explanations include the inability to determine which building contains more pollutants,
  the ignorance to the type of ventilation that each building uses, the total possible
  occupancy of the rooms, or classes, meetings, and other responsibilities that require the people
  to be in Wurster Hall. In addition, a study on what factors affect air pollution in a room, such as
  elevation, building material, door location, and window size should be conducted.

  After such a collection of information that is needed before fulfilling our original expected implications,
  we can conclude that the purpose of this study is to reveal the lack of attention given to this issue.
  Buildings with poor and natural ventilation are still in use on college campuses, despite the lack of
  protection they give to the occupants inside. Additionally, we found inconsistencies with the measured
  amount of pollutant versus how people responded when given the choice of where to stay. If the reason for
  this is because of ignorance, there is not enough care given to educate them on the buildings that support
  their health.

  With more research on the mentioned points, we imagine a future in which architects and urban planners
  take more care to support occupants' health when designing buildings in wildfire-prone areas. As research
  efforts improve, we expect government parties to also turn their attention to this currently neglected
  effect of wildfire smoke. We can rely on further data analysis and visualization to improve this aspect
  of public health.

  ## Conclusion

  We can conclude that this topic is under researched, despite having many potential effects for the good
  of public health. We struggled to find a data set that contained the information that we wanted to analyze,
  which were both survey responses and observations of the pollutant levels in rooms with different
  characteristics, such as ventilation, location, and size. When we did find a data set, one was limited to
  a college campus, which does not represent the general population, and the other was limited to the Idaho
  Metropolitan Area, which is a small region of the Pacific Northwest that we wished to examine.

  We then began our data analysis and visualization, which, supporting our main conclusive claim, revealed
  that the data sets contained information with important implications. Our findings suggest that people
  tend to occupy the building with higher pollutants in a study with one building with mechanical ventilation
  and one building with natural ventilation. Until more research reveals the reason for this behavior,
  we cannot generalize this result to the general population in areas outside of UC Berkeley.
  Our exploration also showed that buildings with mechanical ventilation contained less pollutants than
  buildings with natural ventilation. This idea comes from the fact that nearly every room in the building
  with natural ventilation reported higher levels of pollutants than rooms in the building with mechanical
  ventilation. The last key finding was that people remained in rooms with lower air quality during a documented study.
  This comes from our third chart of exploration, which shows that people occupied the rooms in the building
  with worst air quality more than the other rooms.It is deducible that people are not mindfully choosing their 
  indoor shelters based on the air quality, but based on their normal daily routine and convenience. We suppose 
  that there was little to no communication around UC Berkeley where the study was done, that explained to people
  the infrastrctures inability to protect folks against air pollution, nor was there enough personal awareness or room
  of choice when deciding an indoor location. 

  This data and research can promote holistic health for occupants of public spaces. We can combine
  the survey data of questions about perceptions of certain rooms with the data of questions about the
  actions that people take when presented with these rooms. Scholars and policymakers interested in subjects
  like inclusivity, diversity, mental and physical health, building material, physics might find value in this study.
  The result of these have implications for occupants of public buildings, especially those with pulmonary
  health issues. Those in control of creating and regulating our buildings should consider these factors
  in regions where wildfires are common. With successful implementation of safer building air quality,
  perhaps people in poor health would not have to struggle through an isolating medical experience and
  those who are already excellent health would not have to stay home from work or school during wildfire
  season. As health becomes a more holistic and intersectional study, we hope and expect that research
  in this field continues.

  ## Acknowledgements

  Raina Scherer, for providing resources to finding a credible and extensive data set.

  ## References

  Berwyn, B. (2020, December 7). How wildfires can affect climate change (and vice versa). Inside Climate News. Retrieved October 31, 2022, from https://insideclimatenews.org/news/23082018/extreme-wildfires-climate-change-global-warming-air-pollution-fire-management-black-carbon-co2/

  Environmental Protection Agency. (2021, August 1). Climate Change Indicators: Wildfires. EPA. Retrieved October 31, 2022, from https://www.epa.gov/climate-indicators/climate-change-indicators-wildfires

  Environmental Protection Agency. (2021, November 17). EPA. Retrieved October 31, 2022, from https://www.epa.gov/wildfire-smoke-course/health-effects-attributed-wildfire-smoke

  Organization, W. H. (2018). Wildfires. Retrieved October 31, 2022, from https://www.who.int/health-topics/wildfires#tab=tab_1
  "

  return(report)
}
