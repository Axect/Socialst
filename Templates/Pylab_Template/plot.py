import pickle
import pylab as plt

with open("data.pickle", "rb") as fr:
    data = pickle.load(fr)

n = len(data)

# Use latex
plt.rc('text', usetext=True)
plt.rc('font', family='serif')

# Plot
plt.figure(figsize=(10,6), dpi=300)
plt.title(r"Title", fontsize=16)
plt.xlabel(r'$x', fontsize=14)
plt.ylabel(r'$y$', fontsize=14)
plt.legend(fontsize=12)
plt.grid()

x = data[0]
for i in range(1, n):
    plt.plot(x, data[i], label=r'$i='+str(i)+'$')

plt.savefig("plot.png", dpi=300)
