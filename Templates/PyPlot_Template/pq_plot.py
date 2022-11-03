import matplotlib.pyplot as plt
import pandas as pd

# Use latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# Import parquet file
df = pd.read_parquet('data.parquet')

# Prepare Data to Plot
x = df['x']
y = df['y']

# Prepare Plot
plt.figure(figsize=(10,6), dpi=300)
plt.title(r"Title", fontsize=16)
plt.xlabel(r'$x$', fontsize=14)
plt.ylabel(r'$y$', fontsize=14)

# Plot with Legends
plt.plot(x, y, label=r'$y=x$')

# Other options
plt.legend(fontsize=12)
plt.grid()
plt.savefig("plot.png", dpi=300)
