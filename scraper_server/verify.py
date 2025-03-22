import pandas as pd

filename = input()
writeData  = []

# Read the CSV into a DataFrame
df = pd.read_csv(filename)

# Drop rows where the 'email' column is empty or NaN
df = df.dropna(subset=['email'])

# Write the cleaned data back to the same file (overwrite)
df.to_csv(filename, index=False)
