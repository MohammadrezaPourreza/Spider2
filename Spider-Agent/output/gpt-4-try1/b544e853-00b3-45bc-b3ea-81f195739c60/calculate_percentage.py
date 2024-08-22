import pandas as pd

# Load the data from the CSV file
data = pd.read_csv("result.csv")

# Calculate the percentage of PDP views
percentage = (data["pdp_views"][0] / data["total_views"][0]) * 100

# Print the result
print(f"The percentage of PDP views on January 2, 2021, was {percentage:.2f}%.")
