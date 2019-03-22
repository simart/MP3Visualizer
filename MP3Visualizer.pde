import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
int bufferSize;

 
void setup()
{
  size(800, 600 );
 
  minim = new Minim(this);
  
  song = minim.loadFile("test.mp3");
  song.play();
  background(0);
}
 
void draw()
{
  fill(0,0,0,4);
  noStroke();
  rect(0,0,width,height);
  noStroke();
  blueCircle();
  redPolarGraph();
  greenBarGraph();
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}
void blueCircle()
{
  int x = width/4;
  int y = height/2-100;
  fill(0);
  ellipse(x,y,width/2,width/2);
  float max = song.left.get(0);
  for(int i = 0; i < song.bufferSize(); i++)
    if(song.left.get(i) > max)
      max = song.left.get(i);
  float diameter = max*width/2;
  fill(0,0,255);
  ellipse(x,y,diameter,diameter);
}
void redPolarGraph()
{
  int x = 3*width/4;
  int y = height/2-100;
  int divider = 1;
  for(int i = 0; i < song.bufferSize() - divider; i+=divider)
  {
    stroke(255,0,0,222);
    float theta = 2*float(i)/song.bufferSize() * PI*2;
    float amp1 = Math.abs(song.left.get(i));
    float amp2 = Math.abs(song.left.get(i+divider));
    float x1 = x + height/4*amp1*cos(theta);
    float y1 = y + height/4*amp1*sin(theta);
    float x2 = x + height/4*amp2*cos(theta);
    float y2 = y + height/4*amp2*sin(theta);
    line(x1,y1,x2,y2);
  }
}
void greenBarGraph()
{
  int divider = 1;
  fill(0);
  stroke(0,255,0);
  for(int i = 0; i < song.bufferSize() - divider; i+=divider)
  {
    float x = float(width)/song.bufferSize() * i;
    float y = height;
    float high = 200 * Math.abs(song.left.get(i));
    float wid = divider * width/song.bufferSize();
    fill(0,255,0,222);
    rect(x,y-high,wid,high);
  }
}
