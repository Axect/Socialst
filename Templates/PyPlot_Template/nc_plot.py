from netCDF4 import Dataset
import matplotlib.pyplot as plt

# Use latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# Import netCDF file
ncfile = './data.nc'
data = Dataset(ncfile)
var = data.variables

# Prepare Data to Plot
x = var['x'][:]
y = var['y'][:]  

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
