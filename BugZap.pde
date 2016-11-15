  import processing.sound.*;
  SoundFile laser;
  SoundFile boom;
  
  float bugX = random(20,500);
  float bugY = 5;
  int xpos = 250;
  int playerW = 50;
  int playerH = 15;
  int score = 0;
  int gameover = 0;

void setup(){
  size(500,500);
  background(0);
  stroke(255,255,0);
}
void drawBug()
{
  //Draw the bug
    noStroke();
    fill(255, 0, 0);
    rect(bugX, bugY, 20, 20);
    //To move bug once every second
    if (frameCount % 60 == 0)
    {
      bugY = bugY + 20;
      bugX = bugX + random(-60,60);

    }
    if (bugX < 0)
      {
      bugX = 0;
      bugX += 10;
      }
    else if(bugX > width - 20)
      {
        bugX = width - 20;
        bugX -=10;
      }
    }

void drawPlayer(){
      noStroke();
      rect(xpos,480, playerW, playerH);
      text("Score: " +score,450,10);
      if (keyPressed)
{
  if (keyCode == LEFT)
  {
    xpos -= 2;
    // This will happen if the left key is pressed
  }
  else if (keyCode == RIGHT)
  {
    xpos += 2;
    // This will happen if the right key is pressed
  }
}

if (xpos <= 0){
  xpos += 2;
}

if (xpos >= 450){
  xpos -= 2;
}

  }

void laser(){ 
  if (keyPressed && keyCode == UP)
  {
  laser = new SoundFile(this, "laser.mp3");
  laser.play();
  laser.rate(2);
  laser.amp(0.1);
  fill(255,(255),random(255));
  rect(xpos+10,-20,playerW-20, 500);
  }
  
  //If statement to check if laser hits then bug and if it does resets the bug
  if(xpos > bugX-playerW && xpos < bugX + playerW && keyPressed && keyCode == UP)
  {
      score += 1;
      ellipse(bugX, bugY, 100,100);
      bugX = random(0,500);
      bugY = 5;
      println("Your score is " +score);
      boom = new SoundFile(this, "boom.mp3");
      boom.play();
      boom.rate(0.5);
      boom.amp(0.1);
    }
  }

void gameover()
{
  if(bugY > 480)
  {
  gameover = 1;
  background(0);
  textSize(25);
  textAlign(CENTER);
  text("GAME OVER."  +" Your score is " +score, width/2, height/2);
  }

}

void menu()
{
  textSize(25);
  textAlign(CENTER);
  text("Press ENTER to start", width/2, height/2);
}

void draw(){
  background(0);
  drawBug(); 
  drawPlayer();
  laser();
  gameover();

}