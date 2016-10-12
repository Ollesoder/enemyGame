



class Enemy {
  int enemyX;
  int enemyY;
  boolean dead =false;



   Enemy() { 
    enemyX=(int)random(1920);
    enemyY=(int)random(1080);
  }

  void draw() {
    if (dead==false) {
      ellipse(enemyX, enemyY, 20, 20);
    }
  }
  
  void move(int x, int y){
    enemyX += x;
    enemyY += y;
  }


  void mousePressed() {
    if (dist(mouseX, mouseY, enemyX, enemyY)< 20 ) {
      dead=true;
      score = score +1;
    }
  }
}