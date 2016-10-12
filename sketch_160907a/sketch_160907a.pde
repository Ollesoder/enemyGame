import ddf.minim.*;
import ddf.minim.effects.*;
boolean repeat;


int randomColor;
int score;
float speed;
int timer;
int ammo;

Minim minimLib;
AudioPlayer groove;

//Enemy[] e = new Enemy[1000]; // max 200 enemys
ArrayList<Enemy> enemyList;



int ex2;
int ey2;
int ex;
int ey;
int backgrund1;
boolean dead1;
boolean dead2;
void setup() {
  enemyList=new ArrayList<Enemy>();
  size(1920, 1000);
  noCursor();

  minimLib = new Minim(this);
  groove = minimLib.loadFile("The Chainsmokers - Closer (Lyric) ft. Halsey.mp3", 2048);
  randomColor=#FFFFFF;
  backgrund1=#FFFFFF;
  ex2=(int)random(1920);
  ey2=(int)random(1080);
  ex=(int)random(1920);
  ey=(int)random(1080);
  ammo = 11;


  for (int r = 0; r < 1000; r = r +1) {
    enemyList.add( new Enemy()  );
  }
  /*for (int i=0; i < 1000; i = i + 1 ) {
   e[i]  = new Enemy(); // förta
   }*/

  groove.loop();





  //e = new Enemy();
}
// dec 0123456789
// hex 0123456789abcdef



void draw() {

  if(timer+3000<millis()){
    timer=millis();
        enemyList.add( new Enemy()  );
    
   
  }
     println(+millis()+"   :   "+timer);

  
  
  //           röd grön blå
  background(backgrund1);

  textSize(100);

  text("score: " + score, 50, 100 );
  textSize(100);
  text("ammo: " + ammo, 1400, 100);

  for (int r = 0; r < enemyList.size(); r = r +1) {
    enemyList.get(r).move(int(random(-5, 5)), int(random(-10, 10)));
  }

  for (int r = 0; r < enemyList.size(); r = r +1) {
    enemyList.get(r).draw();
  }
  for (int r = enemyList.size()-1; r >=0; r = r - 1 ) {
    if (enemyList.get(r).dead==true)enemyList.remove(r);
  }

  /* for (int i=0; i < 1000; i = i + 1 ) {
   e[i].draw();// förta
   } */

  if (dead1==false) {
    ellipse(ex, ey, 15, 15);
  }


  if (dead2==false) {
    ellipse(ex2, ey2, 15, 15);
  }



  fill(randomColor);
  ellipse(mouseX, mouseY, 50, 50 );
  line(mouseX, mouseY+25, mouseX, mouseY-25);
  line(mouseX-25, mouseY, mouseX+25, mouseY);
}

void mousePressed() {

  if (ammo > 0) {
    for (int r = 0; r < enemyList.size(); r = r +1) { // kör alla enemy hit kod
      enemyList.get(r).mousePressed();
    }
    ammo = ammo -1;
  }




  if (dist( mouseX, mouseY, ex, ey)< 50 ) {
    dead1=true;
  }

  if (dist(mouseX, mouseY, ex2, ey2)< 50 ) {
    dead2=true;
  }

  // 47       0            255
  randomColor=  color( random(255), random(255), random(255));
  backgrund1= color( random(255), random(255), random(255));
}
void keyPressed() {
  if ( key=='r'  ||  key=='R') {
    ammo=10;
  }
}