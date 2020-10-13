# Description
My project produces water ripples on the surface of an image. The algorithm for the wave spread is by Hugo Elias, which was translated to Processing code by Dan Shiffman to reproduce the same effect on a grayscale canvas. My objective here was to apply this imitation of space and color distortion to images rather than just a black canvas. I (for now) haven't succeeded in achieving the desired effect in terms of spatial distortion.


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week5/ripple.gif)

# Explaining the algorithm


# Code version #1
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


