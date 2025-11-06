# week4 main
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import math


pi = math.pi

# Waves
# 1.	Create a time variable that starts at 0 and ends at 2*pi
    # a.	use whatever granularity you want

time = np.linspace(0, 0.0025, int(2*pi))

# 2.	Create a sine wave variable
sine1 = np.sin(time)

# 3.	Create an animation of the sine wave over time 
    # a.	You should see the wave get created    
fig, ax = plt.subplots()

ax.set(xlim=[0, 10000], ylim=[-4, 1000])

scat = ax.scatter(time[0],sine1[0])
line2 = ax.plot(time[0],sine1[0])
def update(frame):
    # for each frame, update the data stored on each artist
    x = time[frame]
    y = sine1[frame]
    # update scat
    data = np.stack([x, y]).T
    scat.set.offsets(data)
    # update line plot
    line2.set.xdata(time[:,frame])
    line2.set.ydata(sine1[:,frame])
    return(scat,line2)

ani = animation.FuncAnimation(fig, func=update, frames = 100, interval=30)
plt.show()

    
    # b.	Save .gif


# 4.	Create a cosine wave variable



# 5.	Create an animation of the cosine wave over time 
    # a.	Save .gif


# 6.	Create a figure with 2 subplots
    # a.	Sine wave and Cosine wave over time
    
    
    # b.	Sine (x) and cosine (y) waves together

 

# Extra Credit

# Create a 3D Spiral


# 1.	Create a time variable from 1 to 1000




# 2.	Create an x variable that is a sine wave across time





# 3.	Create an y variable that is a sine wave across time





# 4.	Animate  X (on x axis),Y (on y axis), and Time (on z axis) on the same figure to produce a 3D spiral (see examples below)
