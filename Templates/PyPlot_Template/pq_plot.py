import pandas as pd
import matplotlib.pyplot as plt
import scienceplots

# Import parquet file
df = pd.read_parquet('data.parquet')

# Prepare Data to Plot
x = df['x']
y = df['y']

# Plot params
pparam = dict(
    xlabel = r'$x$',
    ylabel = r'$y$',
    title = r"Title",
    xscale = 'linear',
    yscale = 'linear',
    xlim = (0, 1),
    ylim = (0, 1),
)

# Plot
with plt.style.context(["science", "nature"]):
    fig, ax = plt.subplots()
    ax.autoscale(tight=True)
    ax.set(**pparam)
    ax.plot(x, y, label=r'$y=x$')
    ax.legend()
    fig.savefig('plot.png', dpi=600, bbox_inches='tight')
