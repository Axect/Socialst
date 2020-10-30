import matplotlib.pyplot as plt
import pyarrow as pa

# Import Apache arrow IPC file
reader = pa.ipc.open_file("data/test.dat")
data = reader.read_pandas()

# Use latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# Prepare Plot
plt.figure(figsize=(10,6), dpi=300)
plt.title(r"Title", fontsize=16)
plt.xlabel(r'$x$', fontsize=14)
plt.ylabel(r'$y$', fontsize=14)

# Prepare Data to Plot
x = data['x'][:]
y = data['y'][:]  

# Plot with Legends
plt.plot(x, y, label=r'$y=x$')

# Other options
plt.legend(fontsize=12)
plt.grid()
plt.savefig("plot.png", dpi=300)
