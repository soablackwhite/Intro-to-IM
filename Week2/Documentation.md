# Description
The goal was to make a simulation of water ripples on a surface

# Failures
I didn't manage to make it look how I wanted, and the resources I found didn't have to do with the effect I was trying to simulate.

# Effect 1
Basically an on-click ripple effect that depends on where you click on the screen. It's mapped using HSV, with the hue mapped to the x coordinate, the saturation to the y coordinate, and the value fixed. Ripples go transparent as they grow larger.


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week2/rippleEx2.gif)

# Effect 2
Same as effect 1, this one is incomplete though and has performance issues when parameters aren't tweaked (Processing can't handle too many object instances). The effect is basically a radiating trail when dragging the mouse, based on the same HSV values as Effect 1.


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week2/rippleEx1.gif)

