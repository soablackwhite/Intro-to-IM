# Description
My project produces water ripples on the surface of an image. The algorithm for the wave spread is by Hugo Elias, which was translated to Processing code by Dan Shiffman to reproduce the same effect on a grayscale canvas. My objective here was to apply this imitation of space and color distortion to images rather than just a black canvas. I (for now) haven't succeeded in achieving the desired effect in terms of spatial distortion.


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week5/rippple.gif)

# Explaining the algorithm
The canvas is a grid of pixels, each pixel is a color value, we create two arrays, one holding the color values at the current time and the second holding the color values at the previous time. To expand the ripple outward, we make each pixel's color value a function of its neighbours, as opposed to making a distance function from the point of contact for example, which is what I did in my previous project about ripples.

We then bring back the pixel to its regular color using an exponential dampening—multiplied by 0.99 every frame. That way, as the main pixel returns to its original value, so will the neighbours. The whole process is triggered by changing the value of one pixel in the whole canvas, a sort of "trigger". The parts I added were the interactions with the image pixels. 

I previously stated that each pixel is a function of its neighbours, this is computed using their positions to output a final integer that will serve as an integer grayscale value for the pixel. In my code, instead of having a single integer as output, I made it output (or at least I tried, before I realized there was something wrong with my code) an RGB value that is proportional to the RGB value of the pixel in the image.

I also used Perlin noise to generate the "triggers" on the canvas that would change the color of a single pixel, which would, as an avalanche effect, trigger the change of color in the neighbours resulting in the ripple (I did not come up with this brilliant algorithm, as this was written in the 1990s by Hugo Elias, who in turn got inspired by a random genius whose name is now lost in the archives). I limited the noise mapping to a rectangular area in the image so that the ripple would only happen on the water puddle. I think this sums up the algorithm.

# Code version #1
Getting more specific about the image manipulation, I loaded both the canvas pixels and the image pixels, then applied the algorithm on the image's pixels, the result was very strange and not at all what I expected. This may be due to the fact that after the dampening, the value goes so low as to become
![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week5/code1.PNG)

# Code version #2
![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week5/code2.PNG)


# Ressources:
- Dan Shiffman on 2D Ripple Effect https://www.youtube.com/watch?v=BZUdGqeOD0w
- Dan Shiffman on pixel & Image interaction https://www.youtube.com/watch?v=j-ZLDEnhT3Q
- GameDev tutorial about wave simulation https://www.gamedev.net/tutorials/_/technical/graphics-programming-and-theory/the-water-effect-explained-r915/
- Hugo Elias 2D water ripple algorithm explanation

# Checklist & to-do:
- ripple & image interaction DONE
- noise generated ripples DONE
The way it works now, the pixels will change color but not revert to their regular shade (the previous image pixel color) because of how the dampening works. The dampening will simply keep decreasing the value of the rgb relative to the neighbour pixels with no threshold of when to stop. I have a couple ideas of how to fix this but I will need more time.

Cheat bugfix: changed the pixels of the canvas instead to have a ripple effect affecting color, but it doesn't affect the shape as it doesn't show distortion in space the same way it would do if the changed were applied directly to the pixels in the image.


