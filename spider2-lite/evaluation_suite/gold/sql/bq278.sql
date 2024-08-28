SELECT
  #name of state
  state_name,
  
  #number of buildings in Google Map suitable for solar
  SUM(count_qualified) Google_Maps_Buildings_Avail_for_Solar,
  
  #percent of buildings in Google Maps covered by Project Sunroof
  ROUND(CAST(AVG(percent_covered) AS numeric), 1) Percent_GMap_Covered_by_Proj_Sunroof,
  
  #percent of buildings covered by Project Sunroof that are suitable for solar
  ROUND(CAST(AVG(percent_qualified)AS numeric), 1) Percent_Covered_that_Suitable_for_Solar,
  
  #total number of available buildings for solar
  ROUND(SUM(count_qualified) * (ROUND(CAST(AVG(percent_covered)AS numeric), 1)/100) * (ROUND(CAST(AVG(percent_qualified)AS numeric), 1)/100), 0) Available_Buildings,
  
  #number of solar panels potential for all roof space in the region, assuming 1.650m .992m panels
  SUM(number_of_panels_total) Total_Panels_Potential,
  
  #number of kW of solar potential for all roof types in region (assuming 250 watts per panel)
  SUM(kw_total) Kw_total_all_panel_250w,
  
  #total solar energy generation potential for all roof space in region
  SUM(yearly_sunlight_kwh_total) Total_Energy_Potential,
  
  #potential carbon dioxide abatement (The calculation uses eGRID subregion CO2 equivalent non-baseload output emission rates. https://www.epa.gov/sites/production/files/2015 10/documents/egrid2012_summarytables_0.pdf)
  ROUND(CAST(SUM(carbon_offset_metric_tons)AS numeric),0) Carbon_Offset,
  
  #number of existing buildings with solar installation
  SUM(existing_installs_count) Current_Buildings_with_Solar_Panel,
  
  #number of buildings without solar that potential for solar install
  ROUND(SUM(count_qualified) * (ROUND(CAST(AVG(percent_covered)AS numeric), 1)/100) * (ROUND(CAST(AVG(percent_qualified)AS numeric), 1)/100), 0) - SUM(existing_installs_count) Building_Gap
FROM
  `bigquery-public-data.sunroof_solar.solar_potential_by_postal_code` sp
GROUP BY
  sp.state_name
ORDER BY
  SUM(sp.count_qualified) DESC
LIMIT 1;