# Description
The project is a game that uses image recognition input from camera in a turn-by-turn battle against a frankly unsophisticated AI (it just uses a random function to choose between the 4 elements). There is no particular goal besides casual fun and the entertainment of seeing computer interaction from physical motion. The concept is simple and would've most likely taken much less time if I had planned the coding structure from the beginning. 


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week3/gameCapture.gif)

# The Art

### Icons
I couldn't find same-style icons for the hand gestures I wanted, so I decided to make my own. The icons are simply pictures of my own hands that I later pixelized and recolored on Aseprite (a pixel art software). But then the pixelization turned out to be very time consuming so I decided to stick with some light editing and coloring.


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week3/comparison.png)
### Animations
I made my own animations for the monster's shield and fire bending using Aseprite, but it was again very time consuming so I replaced the elementary animations with a pixel art animation package I had from last year. The animations work through a for loop on a spritesheet. The spritesheet contains every frame of the animation process, and the for loop just increments the x coordinate of the image with the frame size, which basically loops through every frame. To avoid hardcoding this, I used multiple arrays that grabbed the player's element to use as index input for loading the appropriate image, and then dividing the image size by the frame size to determine how many iterations of the for loop would be called. 

# p5 & ml5
p5 is just Processing for the web, and ml5 is one if its libraries that allows lightweight machine learning for creative purposes. You can use a pretrained model or train your own, I used a pretrained model called "Teachable Machine" which is a project by Google for accessible machine learning. I uploaded over 1000 images to Teachable Machine under different angles and positions with different light exposition to make a comprehensive dataset. Then I trained the model based on my own parameters after learning the gist of it on youtube, then linked it to my code on Processing. ml5 did the rest of the work for me, the reference and functions were clear and everything went smoothly.

![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/Week3/teachable.PNG)

# to be improved:
- Adding healthbars to the user and the monster & just overall aesthetic tweaks to the interface
- Diversifying the image dataset that the model is trained on to avoid overfitting
- Sounds for animations
- Recoding for cleaner structure, more flexibility, and less memory consumption (2D arrays).

I really regret hardcoding the win/lose conditions. I could have easily done a 2D array to store all possible scenarios, and that could've served as input or index for other arrays that would store the images and coordinates of animations depending on the scenario. Three-hundred lines of code could've been cut to two-hundred. This will teach me to carefully plan before coding.
