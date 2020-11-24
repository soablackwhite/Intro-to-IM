tl;dr: was very cocky, and ended up late in submitting this assignment.

I thought I could easily finish this because it made sense in my mind and completely forgot the salad that was my code and the errors that could pop up with the most simple interactions. I was wrong!

## Schematic:
![schematic](https://github.com/soablackwhite/Intro-to-IM/blob/master/Nov24th/schematic.jpg)

## Original Intent: multiplayer racing game:
I intended this to be a multiplayer racing game where both players would try to get through the obstacles to the finish line without dying. I had to recode most of the stuff, but forgot the many dependencies that my in-game objects have with the main player. In short, there is no camera per se, so in order to fake the camera sidescroller effect I subtracted the player's velocity from the objects' x coordinates. But many problems arise once you have two players, some of which I have tackled, and some of which confused me to the point where I decided to switch my arduino interaction.

#### which player's velocity is subtracted from the objects?
The player with the higher x coordinate. The late player gets left behind out of the screen.

#### does the other player get their position subtracted too?
Yes, otherwise it would seem unnatural.

#### The first player doesn't technically "move" in the screen, it's just objects around him that move towards the left. So what happens to the second player which belongs to the same class?
Headache. If the player with the highest x coordinate moves, it moves the other players too. However that means that one player would have to not be moving (and the objects around him would move) while the second player actually moving around the screen. I made many modifications to make their speeds match but ended up with many weird bugs (not errors, but unexpected interactions) that I couldn't understand. With over 1000 lines of code I got lost and  gave up on finding what was wrong.

## Current state of the game:
I added a little bird with no collisions and that doesn't belong to the player  class. The "camera" is independent of the bird, so the bird is like all other objects. It can move using the arduino buttons, while the player can move using the keyboard. This makes for a fun multiplayer game where players of different styles can enjoy the game. A casual non-serious player can pick up the bird, while the more intense, invested player can pick up the main character. The bird is essentially an additional anchor that the player could use to pull towards or push against. I frankly thing this was much better than the racing idea, and after playtesting I'm seriously considering making a real game with a similar interaction on GameMaker Studio. 
![schematic](https://github.com/soablackwhite/Intro-to-IM/blob/master/Nov24th/multiplayer.gif)



