MP3 Visualizer
==================
			
			
In this program, we'll use the [minim sound library](http://code.compartmental.net/tools/minim/)
to load and play an mp3 file.
We'll then create some sort of animation
that changes with the *amplitude* (loudness) of the music.
Your visualizer doesn't have to look like any other. Your visualizer could change color, shape, size or any other aspect to 
changes in amplitude in the music. Have fun and be creative!


Suggested steps to complete the assignment
-------------------------------------------

1. You will first need to install minim. Just choose *Sketch | Import Library*, Type  *Minim* in the filter and click *install*.   

2. The program code is already written to play an mp3 file. Just make sure the mp3 file is stored in a folder
called "data" inside your sketch folder, and if you use a different mp3 file
change `test.mp3` to the name of your song.

```java
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
 
void setup()
{
  minim = new Minim(this);
  
  // this loads test.mp3 from the data folder
  song = minim.loadFile("test.mp3");
  song.play();
}
 
void draw()
{
  //empty for now
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}
```


3. The repo has a royalty free mp3 file you can use called `test.mp3`. Make sure the program runs and you can hear the song play before moving on to the next step.

4. Now we need to add some code to `draw()` that responds to the music. The music is stored in two 
*buffers* of `float`s each called `song.left` and `song.right`. Just like an `ArrayList` you can find out how many elements are in the buffer with `song.left.size()`. Let's have an
ellipse get bigger or smaller depending on the amplitude of the element in the middle of the left
buffer. Try adding the following code to `draw()`:
```java
  background(255,0,0);
  int mid = song.left.size()/2;
  float diameter = mid * 200);
  ellipse(50,50,diameter,diameter);
```

5. While there seems to be some connection between the ellipse and the music, it's not really apparent. That's because
we are only looking at one small part of the sound. Let's modify the code, so that it looks for the **biggest**
amplitude (the loudest part) of the buffer:
```java
  background(255,0,0);
  float biggest = 0;
  for(int i = 0; i < song.bufferSize(); i++)
  {
    if(song.left.get(i) > biggest)
    {
      biggest = song.left.get(i);
    }
  }
  int diameter = int(200 * biggest);
  ellipse(50,50,diameter,diameter);
```java

6. Another thing we could do would be to display **all** of the elements of the buffer to the screen using a loop.
Try adding `size(512,100);` to `setup()` and this code to `draw()`:
```java
  background(255,0,0);
  for(int i = 0; i < song.bufferSize(); i++)
  {
    float amplitude = song.left.get(i);
    int height = int(200 * amplitude);
    rect(i,50,2, height);
  }
```
7. These are just some ideas to get you started. Your visualizer could change color, shape, size or any other aspect to 
changes in amplitude in the music.


8. Submit the URL of your finished program to Google classroom when you are finished with the assignment.

Samples of Student Work
-----------------------
[Mr. Simon](https://simart.github.io/MP3Visualizer/)  