![final](https://github.com/soablackwhite/Intro-to-IM/blob/master/finalProject/final1.jpg)
![final](https://github.com/soablackwhite/Intro-to-IM/blob/master/finalProject/final2.jpg)
![final](https://github.com/soablackwhite/Intro-to-IM/blob/master/finalProject/final3.jpg)

## Project description:
The plan was to have an interactive 3D game, but for time restrictions now it's more of a relaxing interactive 3D desert exploration. The game is themed after the series: Avatar: The Last Airbender. In this creative piece the player will incarnate Appa the flying bison, and can explore the procedurally generated terrain using ZQSD (my keyboard is French and so are the friends I shared this with so it was adapted for that audience). The background music and music visualizer are here to accentuate the melancholic atmosphere. The camera can be moved with the arrow keys and will affect the direction of movement. There are restrictions on camera rotation for practical reasons (if you look behind you you will see my debugging tools and empty space so I'd rather you don't haha). The lighting of the scene will change accordingly with the player's room lighting while the music visualizer's radius depends on the potentiometer's settings.
https://vimeo.com/490341883

## Process:

### Finding the model

### Generating textured terrain:
The code infrastructure was pretty much the same as the one in Shiffman's video. But I had to adjust parameters in order to get smooth dune surfaces, as the original code was mostly for mountain ranges with rough edges and straight lines. Texturing was something tricky when you consider how the terrain is generated. The terrain is a mesh of triangle strips on a rotated plane, with z coordinates mapped to perlin noise to generate a natural randomness effect. Now texturing doesn't work on triangles but on squares, with each of the four vertices corresponding to the top left, top right, bottom left, & bottom right corners of the image. The way I dealt with that was that for iterations of the for loop that were odd, the two triangle vertices would be assigned to bottom right & top right image vertices, while even iterations would be assigned to bottom left & top left vertices. To minimize "if" statements I took advantage of the fact that top right and bottom left just meant that in normalized coordinates the x & y were the same (1,1 and 0,0 respectively) and top left and bottom right were different (0,1 and 1,0 respectively).

### Music Visualizer:
Took the supershape code I wrote for previous assignments and downgraded it to 2D. Then mapped the 3 exponential variables to arbitrary frequencies. While the frequency & numbers of vertices (or smoothness) were mapped to the amplitude. This wasn't hard because it was done in a rush 2h before class so I didn't have to overthink.

## Camera & movement:
To explain camera, I'll first start with movement:
#### Movement:
How the movement works, is that the character doesn't actually move. It's the terrain that is "moving". And again, the terrain itself isn't actually "moving" either. Since the terrain is generated through perlin noise, it's just that at the same plane coordinates, the vertices of the triangle mesh are incremented, which because of how perlin noise works,  gives a sort of smooth transition between high/low altitudes.

Example: let's say the player presses the button to move forward, what that does is increment the y coordinate of the perlin z coordinates for all vertices of the triangle mesh. So Zvertex[x,y] => Zvertex[x,y+1]; with x & y being the coordinates of the array in which all possible altitudes are stored. Similarly if the player presses the button to move right:
Zvertex[x,y] => Zvertex[x+1,y]. Vice versa for going backwards or left.


## Challenges:
Three big challenges here: the camera, the feedback, and memory management.

## Assets & Tutorial credits

Tutorial music analysis:
https://processing.org/tutorials/sound/

Tutorial procedurally generated terrain:
https://www.youtube.com/watch?v=IKB1hWWedMk

Background image:
https://www.freepik.com/free-photo/beautiful-night-sky-with-shiny-stars_2791954.htm#page=1&query=night%20sky&position=16

Sand texture:
https://www.freepik.com/free-photo/sand_3501151.htm#page=1&query=Sand%20texture&position=0

3D model:
http://3dmag.org/en/market/item/6665/

3D model textures:
https://www.artstation.com/artwork/q8Wve

Background music:
https://www.youtube.com/watch?v=P4YIg1DupB8
