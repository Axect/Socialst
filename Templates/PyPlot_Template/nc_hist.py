from netCDF4 import Dataset
import matplotlib.pyplot as plt
import seaborn as sns

# Import netCDF file
ncfile = './data.nc'
data = Dataset(ncfile)
var = data.variables

# Use latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# Prepare Plot
plt.figure(figsize=(10,6), dpi=300)
plt.title(r"Math Score", fontsize=16)
plt.xlabel(r'Score', fontsize=14)
plt.ylabel(r'Density', fontsize=14)

# Prepare Data to Plot
y = var['y'][:]  

# Plot with Legends
sns.distplot(y, label=r"Score", bins=20)

# Other options
plt.legend(fontsize=12)
plt.grid()
plt.savefig("hist.png", dpi=300)
