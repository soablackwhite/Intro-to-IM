## Project description:
The plan was to have an interactive 3D game, but for time restrictions now it's more of a relaxing interactive 3D desert exploration. The game is themed after the series: Avatar: The Last Airbender. In this creative piece the player will incarnate Appa the flying bison, and can explore the procedurally generated terrain using ZQSD (my keyboard is French and so are the friends I shared this with so it was adapted for that audience). The background music and music visualizer are here to accentuate the melancholic atmosphere. The camera can be moved with the arrow keys and will affect the direction of movement. There are restrictions on camera rotation for practical reasons (if you look behind you you will see my debugging tools and empty space so I'd rather you don't haha). The lighting of the scene will change accordingly with the player's room lighting while the music visualizer's radius depends on the potentiometer's settings.
### Video link: https://vimeo.com/490341883


## Circuit:
![schematic](https://github.com/soablackwhite/Intro-to-IM/blob/master/finalProject/schematic.PNG)
<img src="https://github.com/soablackwhite/Intro-to-IM/blob/master/finalProject/130937397_3686292951436145_6384709591448649701_n.jpg" width="300" height="400">

## Process:

### Finding the model:
I found a model online but it wasn't colored so I tried my luck for the first time on Blender to texture-color it. It turned out to be a much harder task than I thought it would be as I'm not really an artist. I sticked to basic coloring without adding the traditional arrow on Appa's body because the model didn't come with the outline for it and it would've taken me too long.

### Generating textured terrain:
The code infrastructure was pretty much the same as the one in Shiffman's video. But I had to adjust parameters in order to get smooth dune surfaces, as the original code was mostly for mountain ranges with rough edges and straight lines. Texturing was something tricky when you consider how the terrain is generated. The terrain is a mesh of triangle strips on a rotated plane, with z coordinates mapped to perlin noise to generate a natural randomness effect. Now texturing doesn't work on triangles but on squares, with each of the four vertices corresponding to the top left, top right, bottom left, & bottom right corners of the image. The way I dealt with that was that for iterations of the for loop that were odd, the two triangle vertices would be assigned to bottom right & top right image vertices, while even iterations would be assigned to bottom left & top left vertices. To minimize "if" statements I took advantage of the fact that top right and bottom left just meant that in normalized coordinates the x & y were the same (1,1 and 0,0 respectively) and top left and bottom right were different (0,1 and 1,0 respectively).

![tricky](https://github.com/soablackwhite/Intro-to-IM/blob/master/finalProject/tricky1.png)

### Music Visualizer:
Took the supershape code I wrote for previous assignments and downgraded it to 2D. Then mapped the 3 exponential variables to arbitrary frequencies. While the frequency & numbers of vertices (or smoothness) were mapped to the amplitude.

### Camera & movement: (most time consuming)
To explain camera, I'll first start with movement:

#### Movement:
How the movement works, is that the character doesn't actually move. It's the terrain that is "moving". And again, the terrain itself isn't actually "moving" either. Since the terrain is generated through perlin noise, it's just that at the same plane coordinates, the vertices of the triangle mesh are incremented, which because of how perlin noise works,  gives a sort of smooth transition between high/low altitudes.

Example: let's say the player presses the button to move forward, what that does is increment the y coordinate of the perlin z coordinates for all vertices of the triangle mesh. In other words:
Zvertex[x, y] => Zvertex[x, y+1]; with x & y being the coordinates of the array in which all possible altitudes are stored.
Similarly if the player presses the button to move right:
Zvertex[x, y] => Zvertex[x+1, y]. Vice versa for going backwards or left.

#### Camera:
So first of all, this was so hard that at some point I needed to draw the XYZ coordinate plane in the processing sketch behind me to debug (you can't see it because I constrained your rotation hahaha). The rotation of the camera changes your direction which means that the coordinates x & y of the perlin noise are incremented by the speed. The speed is determined by this process: 
##### First we assign a speed to an input variable every time that input is provided (right, left, up, down). This allows us to move diagonally, add up speeds, and fade them individually as we release the buttons.
```java
if (keyDirection){
  x_speed_direction = sign(direction) * cos(angle) * speed_constant; //speed assignment horizontal
  y_speed_direction = sign(direction) * sin(angle) * speed_constant; //speed assignment vertical
}
else{
  x_speed_direction = 0.8*y_speed direction; //fading with friction, more realistic acceleration/velocity model of physics
  y_speed_direction = 0.8*y_speed direction;
}
```
##### Then, we sum up the speed x_speed and y_speed of all directions
```java
x_speed = x_speed_up + x_speed_down + x_speed_left + x_speed_right;
y_speed = y_speed_up + y_speed_down + y_speed_left + y_speed_right;
```

##### Finally, we assign these speeds to the current x & y positions of the noise, so that we have the illusion of changing directions
```java 
  y_offset = y_current + y_speed;
  for (int y = 0; y < rows; y++) {
    x_offset = x_current + x_speed;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(x_offset, y_offset), 0, 1, -25, 25);
      x_offset += 0.1;
    }
    y_offset += 0.1;
  }
```

### Character rotations
The only interesting feature here is that Appa will always slowly get back to his original rotation after the player rotates, I felt like this gave him a more natural movement pattern without having to animate the model. I also constrained his rotation angles.


###  Lighting:
Lighting of the 3D environment was a bit hard but not too much. I just had to learn about materials and types of lighting that processing works with. It helped that I added the direction of light to the 3D plane I drew on Processing (again, you can't see it because it's behind you, but you can check the "plane" tab to see how I was experimenting with it). ***The hardest and tricky part though, was applying lighting to the background.*** Now Processing doesn't have the option to apply a hue to background images, or a filter, or anything. So the way I did it was with pixel manipulation (I was running out of time to review Shiffman's videos so I studied **Sashank's** code from the beginning of the semester instead). In short, what I did was create an empty image object in the setup(), then in the draw function I'd load the pixels of the empty object image, save the background image pixels' red, green, & blue values into variables, multiply them by the photo resistor's coefficient, and assign the empty image's pixels to the new values.

```java
prev2=lerp(prev2,light_mapped2,0.05); //lerping light
bg2.loadPixels(); //loading empty image
//lights
for (int x = 0; x < bg.width; x++) {
  for (int y = 0; y < bg.height; y++ ) {
    // Calculate the 1D pixel location
    int loc = x + y*img.width;
    // Get the R,G,B values from image
    float r = red   (bg.pixels[loc]);
    float g = green (bg.pixels[loc]);
    float b = blue  (bg.pixels[loc]);
    // Change brightness according to Photores
    float adjustBrightness = (prev2) * 4; //multiplication by light factor
    r *= adjustBrightness;
    g *= adjustBrightness;
    b *= adjustBrightness;
    // Constrain RGB to between 0-255
    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);
    // Make a new color and set pixel to the new window
    color c = color(r, g, b);
    bg2.pixels[loc] = c; //assignment of pixels
  }
}
bg2.updatePixels();
```
Another tricky thing I had to deal with was that the photo resistor was jumping from one value to the other way too quickly! So I made it lerp from the previous value to the current value instead.

## Challenges:
Three big challenges here: the camera, time, and memory management. 

- Some of the files were too big so I learned many ways to compress files or change file extensions so that processing could take less time to run. I also had to play a lot with the variables in order to have something that runs smoothly (though it might run smooth on my computer it might not on others.) I also had to sacrifice some of the details in the model and pick a lower poly count to accommodate for more detailed terrain instead.
- In terms of the camera, my spatial/physical intelligence is mediocre at best. So positioning myself in a 3D plane was the hardest part in this assignment and took me way more than it would take the average human being.
- Timewise I wish I had more time on my hands to make what I wanted (see journal.md) but this is good enough I guess.

## Assets & Tutorial credits

Sashank's photoshop assignmentfor providing templates for pixel modification

Jack for solving a bug where my program would only work 1/5 times

Tutorial music analysis:
https://processing.org/tutorials/sound/

Tutorial procedurally generated terrain:
https://www.youtube.com/watch?v=IKB1hWWedMk

Supershape documentation:
http://paulbourke.net/geometry/supershape/

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
