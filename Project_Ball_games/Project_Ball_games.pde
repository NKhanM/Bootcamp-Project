Ball[] balls;
Ball specialBall;
color infectedColour;
int score,x;
Timer startTimer;


void setup()
{
  size(600, 600);
  startTimer = new Timer(30);
 
  infectedColour = color(116, 8, 80);
  balls = new Ball[80];
  for (int i=0; i<balls.length; i = i+1)
  {
    balls[i] = new Ball();
    balls[i].colour = color(random(72, 32), random(32, 209), random(60, 120));
    balls[i].radius = random(4, 16);
  }
  
  specialBall = new Ball();
  specialBall.radius = 25;
  specialBall.colour = infectedColour;
  specialBall.position.x = 0;
  specialBall.position.y = 0;
  specialBall.velocity.x = 1.0;
  specialBall.velocity.y = 1.0;
  score = 0;
}


void draw()
{
  background(255,255, 240);
  startTimer.countDown();
  for (Ball ball : balls) // a for-each loop
  {
    ball.draw();
    ball.move();

    // See if any ball makes contact with special ball.
    if (dist(specialBall.position.x, specialBall.position.y, 
      ball.position.x, ball.position.y) < specialBall.radius+ball.radius)
    {
      ball.colour = infectedColour;
      score = score + 1;
      println(score);
    }
  }

  specialBall.draw();
  specialBall.move();

  stroke(150);
  text(startTimer.getTime(), 10, 20);
  
  
}
