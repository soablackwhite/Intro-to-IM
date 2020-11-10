## RGB Analog Controller
My program is an RGB LED controller that allows to change each of the RGB values using the light sensor as input. First, the program is in a preparation state where it's registering the minimum and maximum value. The maximum value is likely your room's standard lighting, so we provide a minimum value by covering the photoresistor with our fingers.

Next, we hold one of the momentary switches, which will move us from the adjustment state to the color selection state. Depending on which button is pressed, we are affecting a different value of the RGB switch. Red, Green, or Blue. The value starts as 255 when there is no dimming of the photoresistor, and decreases as we dim it. Once the button is released, the value of the color is fixed and we can choose another color (or adjust the same color!). The colors are mapped to the photoresistors' minimum and maximum values set at the beginning. Thanks to the real-time adjustment of minimum and maximum values, there is no usage of the constrain function in this program.

### Schematic:


### Link to video:
https://vimeo.com/477599583
