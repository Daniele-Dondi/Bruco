int[] SnakeX=new int[118+1];//number of elements + head
int[] SnakeY=new int[118+1];
String[] SnakeEl=new String[118+1];
int[][] PlayGrid=new int[100][100]; //board matrix
int SnakeLen;
int gridsize=50;
float x,y;
String direction;
int speed;
boolean grow;
int GAMEOVER;
int dx,dy,rx,ry,ex,ey,ax1,ay1,ax2,ay2;
int looking=0;
int MaxGridX,MaxGridY;
float Ofs=gridsize/2;
int[] rnd=new int[118];
int remainingElements;
int[] ElX = new int[118];
int[] ElY = new int[118];
int[] ElNum = new int[118];
String[] ElSymbol = new String[118];
int elementsongrid;
int BubbleX,BubbleY; String BubbleText;
String[] Compliments={"Good","Great","Beautiful","Keep it up","YUM","Nice shot!","Very well!","Go strong!","Prominent!","You're a myth!"};
String[] Criticisms={"Oh NO!","Ops","Caution!","Look what is required","Watch out","Error","This was not to eat","Mistaken!","Concentrated","Look at the table well"};
String[] periodsName ={"","first period element","second period element","third period element","fourth period element","fifth period element","sixth period element","seventh period element"};
String[] blocksName ={"","s block element","p block element","d block element","f block element"};
String[] typesName ={"","alkaline metal","alkaline-earth metal","transition metal","non metal","semimetal","lanthanide","actinide","noble gas","p block metal"};
String[] elementsName={"hydrogen","helium","lithium","beryllium","boron","carbon","nitrogen","oxygen","fluorine","neon","sodium","magnesium","aluminium","silicon","phosphorus",
"sulfur","chlorine","argon","potassium","calcium","scandium","titanium","vanadium","chromium","manganese","iron","cobalt","nickel","copper","zinc","gallium","germanium","arsenic",
"selenium","bromine","krypton","rubidium","strontium","yttrium","zirconium","niobium","molybdenum","technetium","ruthenium","rhodium","palladium","silver","cadmium","indium","tin",
"antimony","tellurium","iodine","xenon","cesium","barium","lanthanum","hafnium","tantalum","tungsten","rhenium","osmium","iridium","platinum","gold","mercury","thallium","lead",
"bismuth","polonium","astatine","radon","francium","radium","actinium","rutherfordium","dubnium","seaborgium","bohrium","hassium","meitnerium","darmstadtium","roentgenium","copernicium",
"nihonium","flerovium","moscovium","livermorium","tennessine","oganesson","cerium","praseodymium","neodymium","promethium","samarium","europium","gadolinium","terbium","dysprosium","holmium","erbium",
"thulium","ytterbium","lutetium","thorium","protactinium","uranium","neptunium","plutonium","americium","curium","berkelium","californium","einsteinium","fermium","mendelevium","nobelium","lawrencium"
};
String Elements="H HeLiBeB C N O F NeNaMgAlSiP S ClArK CaScTiV CrMnFeCoNiCuZnGaGeAsSeBrKrRbSrY ZrNbMoTcRuRhPdAgCdInSnSbTeI XeCsBaLaHfTaW ReOsIrPtAuHgTlPbBiPoAtRnFrRaAcRfDbSgBhHsMtDsRgCnNhFlMcLvTsOgCePrNdPmSmEuGdTbDyHoErTmYbLuThPaU NpPuAmCmBkCfEsFmMdNoLr";
int[] periods = {1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7};
int[] groups =  {1,18,1,2,13,14,15,16,17,18,1,2,13,14,15,16,17,18,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,
                 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

// 1 s, 2 p, 3 d, 4 f
int[] blocks =  {1,1,1,1,2,2,2,2,2,2,1,1,2,2,2,2,2,2,1,1,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,1,1,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,1,1,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,1,1,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4};
// 1 alkaline 2 alkaline-earth 3 transition, 4 non metal, 5 semimetal, 6 lanthanide, 7 actinide, 8 noble gas, 9 p block metal
int[] types =   {0,8,1,2,5,4,4,4,4,8,1,2,9,5,4,4,4,8,1,2,3,3,3,3,3,3,3,3,3,3,9,5,4,4,4,8,1,2,3,3,3,3,3,3,3,3,3,3,9,9,5,5,4,8,1,2,3,3,3,3,3,3,3,3,3,3,9,9,9,5,4,8,1,2,3,3,3,3,3,3,3,3,3,3,9,9,9,9,4,8,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7};

int selType,selNumber; //type of category and number of the selected elements
String eatThis; //String appearing on the bottom of the screen
int lives,points;
PImage img;

String lastElement;
int showLastElement;

String[] topPlayersName={"RAD ","CHEM","LAB ","----","----","----","----","----","----","----"};
int[] topPlayersPoints={300,299,298,0,0,0,0,0,0,0};
String shortname;

int timeBonus;
int tickBonusCounter;
int elementsSinceLastBonus;
int bonusLives,bLX,bLY;
int bonusHelp;

void initrandom(){//initialize the random array
  for (int i=0;i<118;i++)rnd[i]=i;
  remainingElements=118;//remaining elements to generate randomly
  elementsongrid=0;
}

boolean ThereIsSomethingHere(int X, int Y){
 boolean somethg=false;
 if (PlayGrid[X][Y]!=0) somethg=true;
  return somethg;
}

boolean IsNotAvail(int X, int Y){
  boolean tmp=false;
  int neighbours=0;
  int XP1=X+1,XM1=X-1,YP1=Y+1,YM1=Y-1;
  if (XM1<0) XM1=MaxGridX-1;   if (YM1<0) YM1=MaxGridY-1; //toroidal world
  if (XP1>MaxGridX-1) XP1=0;   if (YP1>MaxGridY-1) YP1=0;
  if (ThereIsSomethingHere(X,Y)) tmp=true;
  //avoid to create unreachable elements 
  if (ThereIsSomethingHere(XP1,Y))neighbours++;
  if (ThereIsSomethingHere(X,YP1))neighbours++;
  if (ThereIsSomethingHere(XM1,Y))neighbours++;
  if (ThereIsSomethingHere(X,YM1))neighbours++;  
  if(neighbours>0) tmp=true;
  return tmp;
}

String getElementOnGrid(int num, boolean isGood){
  elementsongrid--;
  PlayGrid[ElX[elementsongrid]][ElY[elementsongrid]]=num;
  num--;  // the board grid points on the element+1 of the array El
  String Symbol=ElSymbol[num];  
  lastElement=elementsName[ElNum[num]];
  showLastElement=30;//showing time
  ElX[num]=ElX[elementsongrid];//copy the content of the last element of the array in the num position
  ElY[num]=ElY[elementsongrid];
  ElNum[num]=ElNum[elementsongrid];
  ElSymbol[num]=ElSymbol[elementsongrid];
  //after eaten, add some elements more and chose another category to eat if the player took the correct element
  for (int i=0;i<1+random(2);i++)  putElementOnGrid();
  if (isGood) ChooseElementToEat();
  return Symbol;
}

void putElementOnGrid(){
  if (remainingElements==0) return;
  if (elementsongrid==118) return;
  int X,Y;
  int count=0;
  do
   {
     X=int(random(MaxGridX));
     Y=int(random(MaxGridY));
     count++;
   }
   while ((IsNotAvail(X,Y))&&count<1000); //avoid infinite loop
  if (count==1000) return;
  remainingElements--;
  int n=int(random(remainingElements));
  int choice=rnd[n];  
  rnd[n]=rnd[remainingElements];
  ElSymbol[elementsongrid]=Elements.substring(choice*2,choice*2+2);   
  ElX[elementsongrid]=X;
  ElY[elementsongrid]=Y;
  ElNum[elementsongrid]=choice;
  elementsongrid++;   
  PlayGrid[X][Y]=elementsongrid;// the board grid points on the element+1 of the array El
}

void ChooseElementToEat(){
  int elementNumber;
  String message="";
  do
  { 
    elementNumber=ElNum[int(random(elementsongrid))];
    selType=int(random(5));
    if (selType==0) {selNumber=periods[elementNumber]; message=periodsName[selNumber];}
    else
    if (selType==1) {selNumber=groups[elementNumber]; message="element group "+str(selNumber);}
    else
    if (selType==2) {selNumber=blocks[elementNumber]; message=blocksName[selNumber];}
    else 
    if (selType==3) {selNumber=types[elementNumber]; message=typesName[selNumber];}
    else {selNumber=elementNumber; message=elementsName[selNumber];}
  } while (selNumber==0);
  
  eatThis=message;
}

void InsertNameTopTen(){
  int i=0;
  while (topPlayersPoints[i]>points) i++;
  for (int j=9;j>i;j--){topPlayersPoints[j]=topPlayersPoints[j-1];topPlayersName[j]=topPlayersName[j-1];}
  topPlayersPoints[i]=points;
  topPlayersName[i]=shortname;
}

void initGame(){  
  for(int x=0;x<MaxGridX;x++) for(int y=0;y<MaxGridY;y++) PlayGrid[x][y]=0; // init board matrix
  initrandom();
  SnakeX[0]=3;SnakeY[0]=0;SnakeEl[0]=""; //starting snake position
  SnakeLen=1;
  PlayGrid[SnakeX[0]][SnakeY[0]]=200; // put snake position on board matrix  
  direction="S";
  BubbleY=-1;
  selType=0;selNumber=0;
  grow=false;
  speed=8;
  GAMEOVER=0;
  for (int i=0;i<4+random(3);i++)  putElementOnGrid(); //put starting elements on grid
  ChooseElementToEat();
  lives=5;
  points=0;
  lastElement="";
  showLastElement=0;
  timeBonus=0;
  tickBonusCounter=0; 
  elementsSinceLastBonus=0;
  bonusLives=0;
  bonusHelp=0;
}

PShape star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  PShape s=createShape();
  s.beginShape();
  s.fill(255, 12, 15);
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    s.vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    s.vertex(sx, sy);
  }
  s.endShape(CLOSE);
  return s;
}

void setup() {  // main procedure. This is the entry point. The program starts here. Then only draw is called each frame
  fullScreen(P2D);
  frameRate(15);  // 15 frames per second
  noCursor();    // the cursor is hidden
  MaxGridX=int(width/gridsize);  // calculate the grid size accordingly to resolution
  MaxGridY=int(height/gridsize)-1;  
  textAlign(CENTER,CENTER);
  img = loadImage("start.png");  // load the starting screen
  initGame();  
  GAMEOVER=1;
}

boolean BelongsToSelection(int num){// return true if the element belongs to the request
  boolean tmp=false;
  if ((selType==0)&&periods[num]==selNumber) tmp=true;
   else
  if ((selType==1)&&groups[num]==selNumber) tmp=true;
   else
  if ((selType==2)&&blocks[num]==selNumber) tmp=true;
   else
  if ((selType==3)&&types[num]==selNumber) tmp=true;
   else
  if ((selType==4)&&num==selNumber) tmp=true;  
  
  return tmp;
}

void drawSmallPeriodicTable(int ofsX, int ofsY){ // draw a small periodic table with highlighted the requested element(s)
 int sqsize=5;
 int i;
 stroke(204, 102, 0);
 for (i=0;i<Elements.length()-28*2;i=i+2)   {if (BelongsToSelection(i/2)) fill(#FFFFFF); else fill(0); square(groups[i/2]*sqsize+ofsX,periods[i/2]*sqsize+ofsY,sqsize);} //draw elements except lanthanides and actinides
 for (i=Elements.length()-28*2;i<Elements.length()-14*2;i=i+2)   {if (BelongsToSelection(i/2)) fill(#FFFFFF); else fill(0); square((i-174)/2*sqsize+ofsX,sqsize*8+2+ofsY,sqsize);} //draw lanthanides
 for (i=Elements.length()-14*2;i<Elements.length();i=i+2)   {if (BelongsToSelection(i/2)) fill(#FFFFFF); else fill(0); square((i-202)/2*sqsize+ofsX,sqsize*9+2+ofsY,sqsize);} //draw actinides
}

void draw() {// main procedure. Called every frame
 background(0,40,40);  
 stroke(204, 102, 0);
 fill(104, 200, 0);
 if (GAMEOVER!=1){// if it is not gameover draw the game!
 tickBonusCounter++;
 for (int i=0;i<=MaxGridX;i++)line(i*gridsize,0,i*gridsize,MaxGridY*gridsize);  for (int i=0;i<=MaxGridY;i++)line(0,i*gridsize,MaxGridX*gridsize,i*gridsize); //draw board grid
 fill(#606060);textSize(gridsize/2); for (int j=0;j<elementsongrid;j++) //draw elements on screen
 {
  fill(#FFFFFF);
  if ((BelongsToSelection(ElNum[j]))&&(bonusHelp==1)) fill(#FF00FF); 
  text(ElSymbol[j],ElX[j]*gridsize+Ofs,ElY[j]*gridsize+Ofs);  
 }
 if (tickBonusCounter>1500) bonusHelp=1;  // if you wait too long it helps to find elements highlighting them
 if ((bonusLives==0)&&(elementsSinceLastBonus>2)&&(random(300)>float(timeBonus/elementsSinceLastBonus))) { // you got a life bonus!
      int count=0,X,Y;
      do  // try to find and empty place for the bonus
    {
     X=int(random(MaxGridX));
     Y=int(random(MaxGridY));
     count++;
    }
    while ((IsNotAvail(X,Y))&&count<1000); //avoid infinite loop
   if (count<1000) {PlayGrid[X][Y]=300; bonusLives=1; bLX=X; bLY=Y;}
   } // end of create lives bonus proc
   if (bonusLives!=0) {fill(#FF0000); text("♥",bLX*gridsize+Ofs,bLY*gridsize+Ofs);}// finally draw the bonus!
   
   for (int i = 0; i <SnakeLen; i++) //draw the snake
  {
    stroke(204, 102, 0);
    fill(104+i,200-i,0);
    ellipse(SnakeX[i]*gridsize+Ofs,SnakeY[i]*gridsize+Ofs,gridsize,gridsize);
    if (i==0) //for the head only
     { dx=dy=0;rx=ry=7;ex=ey=0;ax1=ay1=ax2=ay2=0;
   if (direction=="N") {dy=-5;ry=10;ey=-3;ax1=10;ay1=10;ax2=30;ay2=30;}
   else
   if (direction=="S") {dy=5;ry=10;ey=3;ax1=10;ay1=-10;ax2=30;ay2=-30;}
   else
   if (direction=="E") {dx=5;rx=10;ex=2;ax1=10;ay1=-10;ax2=30;ay2=-30;}
   else
    {dx=-5;rx=10;ex=-2;ax1=10;ay1=-10;ax2=30;ay2=-30;}    
       fill(#FFFFFF); 
       int rry;
       if (random(50)>49) rry=1; else rry=ry;//blink eyes
       ellipse(SnakeX[i]*gridsize+dx+ry+Ofs,SnakeY[i]*gridsize+dy+Ofs,rx,rry);//eyes
       ellipse(SnakeX[i]*gridsize+dx-ry+Ofs,SnakeY[i]*gridsize+dy+Ofs,rx,rry);    
       fill(0); noStroke();     
       if ((looking==0)&&(random(200)>199)) looking=20+int(random(10));//duration of staring 
       if (looking>0) {ex=0; ey=0;looking--;}
       ellipse(SnakeX[i]*gridsize+dx+ry+ex+Ofs,SnakeY[i]*gridsize+dy+ey+Ofs,3,3);//pupils
       ellipse(SnakeX[i]*gridsize+dx-ry+ex+Ofs,SnakeY[i]*gridsize+dy+ey+Ofs,3,3); 
       stroke(#FFFFFF);
       line(SnakeX[i]*gridsize+ax1+Ofs,SnakeY[i]*gridsize+ay1+Ofs,SnakeX[i]*gridsize+ax2+Ofs,SnakeY[i]*gridsize+ay2+Ofs);//antennas
       line(SnakeX[i]*gridsize-ax1+Ofs,SnakeY[i]*gridsize+ay1+Ofs,SnakeX[i]*gridsize-ax2+Ofs,SnakeY[i]*gridsize+ay2+Ofs);
       fill(#FFFFFF);        
       ellipse(SnakeX[i]*gridsize+ax2+Ofs,SnakeY[i]*gridsize+ay2+Ofs,3,3);//circle at the end of antennas
       ellipse(SnakeX[i]*gridsize-ax2+Ofs,SnakeY[i]*gridsize+ay2+Ofs,3,3);
     }
     else {fill(#126060);textSize(16);text(SnakeEl[i],SnakeX[i]*gridsize+Ofs,SnakeY[i]*gridsize+Ofs);}//write element symbol inside snake
   }
   
   if (showLastElement>0) {//write a string with the name of the element taken 
     int Xpos=gridsize;
     if (direction=="W") Xpos=-Xpos;
     fill(#FFFFFF);textSize(16);text(lastElement,SnakeX[0]*gridsize+Xpos+Ofs,SnakeY[0]*gridsize+Ofs);
     showLastElement--;
   }

 if (BubbleY>=0) {fill(#FFFFFF);textSize(gridsize);text(BubbleText,BubbleX,BubbleY); BubbleY=BubbleY-5;}//draw bubble text

 drawSmallPeriodicTable(gridsize*4,MaxGridY*gridsize);  // draw the periodic table scheme
 
 fill(#FFFFFF); textSize(gridsize); text(eatThis,MaxGridX*gridsize/2,MaxGridY*gridsize+gridsize/2);//draw which elements to eat
 textSize(gridsize/2); text("points: "+str(points),(MaxGridX-2)*gridsize,MaxGridY*gridsize+gridsize/2);//draw points
 text("lives: "+str(lives),gridsize*2,MaxGridY*gridsize+gridsize/2);//draw bonus
 }
 else //GAMEOVER, write top players + instructions
  {textAlign(LEFT);
    int fontsize=width/48;
    fill(#FFFFFF); textSize(fontsize); textMode(SHAPE);
    image(img, 0, 0, width, height);    
    for (int i=0;i<10;i++){text(topPlayersName[i],width/2-fontsize*7.5,height/2+i*(fontsize+5)); text(topPlayersPoints[i],width/2+fontsize*5,height/2+i*(fontsize+5));}
    textAlign(CENTER,CENTER);
  }
  
if (GAMEOVER==0){ //if it is not game over move snake
 if (frameCount%speed==0) {
   int tailX=SnakeX[SnakeLen-1];
   int tailY=SnakeY[SnakeLen-1];
   for (int i = SnakeLen-1; i > 0; i--) {SnakeX[i]=SnakeX[i-1];SnakeY[i]=SnakeY[i-1];}   
   if (direction=="N") SnakeY[0]--;
   else
   if (direction=="S") SnakeY[0]++;
   else
   if (direction=="E") SnakeX[0]++;
   else
    SnakeX[0]--;
  if (SnakeX[0]>=MaxGridX) SnakeX[0]=0;//toroidal world
  if (SnakeX[0]<0) SnakeX[0]=MaxGridX-1;    
  if (SnakeY[0]>=MaxGridY) SnakeY[0]=0;
  if (SnakeY[0]<0) SnakeY[0]=MaxGridY-1;  
  int cell=PlayGrid[SnakeX[0]][SnakeY[0]];
  String food="";
  if (cell!=0) // the cell contains something 
    if (cell==200) GAMEOVER=100; //you bited yourself
    else
    if (cell==300) {points+=600; bonusLives=0; lives++; timeBonus=0; elementsSinceLastBonus=0;BubbleX=int(SnakeX[0]*gridsize+Ofs);BubbleY=int(SnakeY[0]*gridsize+Ofs);BubbleText="GREAT!\nYou got an extra life!";}
    else
     { //hitted an element
     bonusHelp=0;
       if (SnakeLen%5==0) speed=speed-1; if (speed<5) speed=5; //every 5 elements increase game speed up to a maximum
       boolean isGood=BelongsToSelection(ElNum[cell-1]); //is it the requested element?
       food=getElementOnGrid(cell,isGood);grow=true; //actually eat it
       BubbleX=int(SnakeX[0]*gridsize+Ofs);BubbleY=int(SnakeY[0]*gridsize+Ofs); //starting bubble text coordinates close to snake's head
       if (isGood) {BubbleText=Compliments[int(random(Compliments.length))]; points=points+100; // earn points
                    timeBonus+=tickBonusCounter; tickBonusCounter=0; elementsSinceLastBonus++; } // prepare variables for bonus
        else
         { //this is not the requested one
           if (bonusLives!=0){bonusLives=0; timeBonus=0; elementsSinceLastBonus=0; PlayGrid[bLX][bLY]=0;} // if a life bonus is on the screen remove it!
           BubbleText=Criticisms[int(random(Criticisms.length))];
           points=points-50;
           lives--;
           if (lives<0) {GAMEOVER=100;lives=0;}
         }
     }
  if(grow) {SnakeX[SnakeLen]=tailX;SnakeY[SnakeLen]=tailY;SnakeEl[SnakeLen]=food;grow=false; SnakeLen++;}  else PlayGrid[tailX][tailY]=0;
  PlayGrid[SnakeX[0]][SnakeY[0]]=200;  
 } 
 }
 else //GAMEOVER PROCEDURE
  {if (GAMEOVER>1){
     BubbleY=-1;//eventually remove bubble text
     shape(star(SnakeX[0]*gridsize+Ofs,SnakeY[0]*gridsize+Ofs, gridsize/2, gridsize/2+10, 11));
     if (GAMEOVER%5==0) fill(#FFFFFF); else fill(#606060); 
     textSize(gridsize/3);
     text("OUCH!",SnakeX[0]*gridsize+Ofs,SnakeY[0]*gridsize+Ofs);
      textSize(gridsize*4);  textMode(SHAPE); fill(#FFFFFF); text("GAME OVER",width/2,map(GAMEOVER,100,0,0,height/2-gridsize));
      if (points>topPlayersPoints[9]) {textAlign(LEFT); textSize(gridsize);
            if (GAMEOVER==100) {shortname=elementsName[int(random(118))].substring(0,4).toUpperCase(); InsertNameTopTen();}
          text("GREAT! You established a new record!\nyour new name is: "+shortname,width/5,height-280);textAlign(CENTER,CENTER); }
      GAMEOVER--;          
    }
  }
if (keyPressed) { 
     if (GAMEOVER==1){GAMEOVER=0; initGame(); return;} // if it is gameover start the game!
    if ((key == 'w')&&!((SnakeLen>1)&&direction=="S")) direction="N"; // if snake is more than 1 in length avoid self biting while reversing
    if ((key == 'a')&&!((SnakeLen>1)&&direction=="E")) direction="W";
    if ((key == 's')&&!((SnakeLen>1)&&direction=="N")) direction="S";    
    if ((key == 'd')&&!((SnakeLen>1)&&direction=="W")) direction="E";
    if (key == 'm') saveFrame();
}
}
