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
- Dan Shiffman on coding spherical geometry & supershapes in Processing https://www.youtube.com/watch?v=m8WhMeW8jj0
- Paul Bourke's mathematical models http://paulbourke.net/geometry/supershape/
- Artistic inspiration: https://www.syedrezaali.com/#/3d-supershapes/

# Checklist:
- manipulating spherical geometry through data => Done!
- texturing spherical geometry with images (from the data) => canceled, thought I had a logic to do this but the texture function in Processing doesn't work the way I intend, so I'll have to map my image pixel by pixel to the the shape I'm drawing, which is honestly a hassle and I think there should be a cleaner, more elegant way of doing it.
- animating transitions => X, still can't find a way of doing it without hardcoding, will get back to it.
- text labels => sort of done, need to find a way to isolate it from the peasy rotation.
- camera interaction with the user: Done! (peasy library!)
- keyboard interaction: Done!

Overall satisfied with this project, I ended up assigning the variables to the parameters at random. The mapping was accurate and calculated, but whether the complexity has to be assigned to the exponent n or to the m is something that still escapes me, because changing one parameter brings almost no change, other parameters must change as well and they all affect each other, which means that there's no way for me to signal that TV show X is more complex than TV show Y, or that TV show X is genre Z. I realized (too late) that supershapes aren't good for informative data visualization, so here I'd like to echo my point from the beginning: the visualization here is meant to give an intuition, or a sense of similarity between objects, rather than to inform the user of what the object actually is and what its proportions mean (this can be inferred once the user has scrolled through multiple TV shows that he is familiar with).

