# Journal

## October 13th:
Started brainstorming for a game. Decided to do something that will help me practice my pixel art. I think I'm gonna make game that takes its mechanics from my favourite fantasy saga: Mistborn. I tried doing that last year but I was still missing some parts and had occasional bugs.
  - Whatever game I make, I know it will have collisions, so I just watched videos about it.
  - I reread the documentation about making a 2D Mario Game on Processing  http://processingjs.nihongoresources.com/test/PjsGameEngine/docs/tutorial/mario.html
  
  ![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/notes1.jpg)
  ![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/notes2.jpg)


## October 15th:
I don't think I have the time to overthink a new game so I think I'll revisit a prototype from last year. Today I rewrote the code of my "Mistborn" prototype to include game states and added a pause menu with buttons I drew during the summer. I had initially planned 3h tops for this but it took me a solid 7h because of how unflexible my code was.


![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/OmarOuldAli_GIF.gif)

## October 18th:
Nevermind, the Mistborn prototype is ugly. It feels pointless, sluggish, and it has no aesthetic. I also don't like how the code is written, it doesn't feel fresh in my mind. I think I'll make a whole new Mistborn game. I'll keep the same ideas I used during the brainstorming phase & I'll probably use libraries to save some time. For now I started working on the sprites for my main character by editing some poses I found from some other games' sprites (Fire Emblem, Legault).

![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/aseprite.png)

## October 19th: 
Finished the sprite animations for the push mechanic & the coin throw. I still need to do the running, jumping, and pull mechanic.
![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/coin_throw.gif)
![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/steel_push.gif)

## October 20th:
I've been trying to make a side scroller using a pre-made game but I don't know how to "move" the screen while also moving objects. "Translate" has been very tricky, and just moving the background wouldn't affect the procedurally generated objects. I'm taking a break and working on sprites only.

## October 21st:
Got done with the sprites for running/jumping/pushing.

![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/spr_sheet.gif)

## October 22nd:
Made a cool background using processing that would suit the Mistborn theme.

![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/ash.gif)

## October 24th:
Finished animation & movement code as well as the "pull/push" interaction on metal objects. Left: collision check, side scroll, game states, enemy chaser, dialogue boxes, sound & music.
![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/game0.gif)

## October 25th:
Spent way too long trying to code collisions, I finally figured it out by making an entirely new sketch with just squares and implementing collisions in it.

!![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/collision.gif)

## October 26th:
Implemented side scrolling, push/pull mechanic, and created enemy chaser. Credits to Joseph for the side scrolling. The way I had approached it was through translations (which messed with my ash flakes' angles for some reason). So I took a look at other people's repositories to see if anybody else was doing a side scroller and found out that Joseph too. So I asked him about how he approached it and he told me that a much easier, elegant, and more computation-efficient method existed: just incrementing the character's speed to objects & backgrounds to give the illusion of movement. I thought this was very counter intuitive at first, but after thinking about it I realized that it's a genius idea in the context of Processing.

![processing](https://github.com/soablackwhite/Intro-to-IM/blob/master/midtermProject/prototype.gif)

On this day, my collisions stopped working. I decided to fix them on the 27th.

# October 27th: 
The code completely bugged when I implemented "snapping" to my collisions. Either the collisions wouldn't work or the push/pull mechanic wouldn't work. It was annoying and depressing because I spent an insane amount of time on it. I could have done enemies, terrain, & graphics during that time. But without the push/pull mechanic nothing sets my game apart from another random platformer or side scroller. It was very frustrating that I couldn't show a completed work during class. Today I learned that two things: that I was a perfectionist, and that it's not actually a good thing. Apart from this, here's stuff I should probably take into account the next time I try to code a game:
1- Priorities matters. Work on the bigger picture rather than the small details.
2- Skip when you don't know. Don't get stuck on the same chunk of code for too long, write some other part of the game in the meanwhile or you'll be stuck with unreadable hardcoded spaghetti. Staring too long at the same code channels your brain on single problem to solve while forgetting the other parts of the code structure that may be affected by your solution.
3- Pareto Law. It takes 20% of the effort to finish 80% of the work, and 80% of the effort to finish the remaining 20%. The last 20% is what makes perfectionism a bad thing. That last part is polish, and takes an incredible amount of time to get running (surprisingly). I polished each part of the game as I finished coding it without having finished the whole thing. Even realizing some of the stuff I did wouldn't be implemented in the final game (the animated drawings for push/pull have been replaced by code, for example).
