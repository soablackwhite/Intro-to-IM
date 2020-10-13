# Description
The project is a program that converts the data about TV shows I watched into three dimensional supershapes (I'll get back on what this is later), this can facilitate finding similar shows without having to read reviews or tags, there's a sort of data visualization here but it's much more to give a vague intuition of similarity between shows than to inform the user about the show.


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week4/dataSphere.gif)

# The Data
I basically imported a list of my favourite anime from a website where I already had the list (in XLM format). Then I edited it, added some more data, and filtered rows to get only what I need for the program. Then I exported the file as CSV (it's just easier to work with for what I wanted to do). 


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week4/excel.PNG)
###


# Supershapes
Here comes the part where I suffered the most. I love maths and abstract logic, but I hate geometry and everything that has to do with physical objects. My decision to use 3D shapes came from a friend's dare after he watched a shiffman video about supershapes. And so I found myself watching the same video over and over again, trying to figure out how all of that math worked. The problem was that he didn't write the code with the intention to have data input to change the shape of the sphere, and so I had to figure out most of the code myself, with no ressources about Supershape data visualization.

So what's a supershape? A supershape is basically the embodiment of any physical object, primitive or irregular, as coded through a superformula. This superformula basically uses the same formula as an ellipse's equation in 3D, but with some extra parameters that can bend it to any shape desired (so you can even code the shape of an apple!). Then a thought hit me, what if abstract concepts can be given a physical shape by configuring the parameters? I thought this was a mindblowing idea, like imagine a physical object that embodies the tv shows you watched, or a feeling you've had, or a thought that occurred to you. This was my drive for this project, attempting to use characteristics from a data set as the parameters of the superformula to create a shape that is representative of the anime.


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week4/formula.PNG)


The "a" and "b" will stretch the shape vertically or horizontally, the "n" exponents have special interaction effects described below in Johan Gielis' mathematical equations:


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week4/formula2.PNG)

# Ressources:
- Dan Shiffman on 2D Ripple Effect https://www.youtube.com/watch?v=BZUdGqeOD0w
- Dan Shiffman on pixel & Image interaction https://www.youtube.com/watch?v=j-ZLDEnhT3Q
- GameDev tutorial about wave simulation https://www.gamedev.net/tutorials/_/technical/graphics-programming-and-theory/the-water-effect-explained-r915/
- Hugo Elias 2D water ripple algorithm explanation

# Checklist & to-do:
The way it works now, the pixels

Cheat bugfix: changed the pixels of the canvas instead to have a ripple effect affecting color, but it doesn't affect the shape as it doesn't show distortion in space the same way it would do if the changed were applied directly to the pixels in the image.


