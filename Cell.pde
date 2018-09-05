class Cell{
  
 boolean revealed; //If user has clicked on the cell
 boolean bomb; //If the cell has a bomb
 int numberOfMines; //How many mines are next to it
 
 Cell(){
   this.numberOfMines = 0;
   this.revealed = false;
   this.bomb = false;
   
 }
 
 void show(int i, int j){
   if(!revealed){
     fill(192,192,192);
     rect(i * 80, j * 80, 80, 80);  //If it hasn't been revealed, make it this shade
   }
   else if(revealed){
     fill(255,255,255); //If it is revealed, make cell white
     rect(i * 80, j * 80, 80, 80); 
     if(bomb){
       textSize(32);
       fill(0);
       textAlign(CENTER);
       text("B", i * 80 + 40, j * 80 + 45); //Useless text as it will 
       //never been showed, but useful if I change its implementation later
     }
     
     else if(!bomb){
       if(numberOfMines != 0){
         textSize(32); //If it is not a bomb, show the amount of mines unless it is 0
         //In which case you show an empty cell
         fill(0);
         textAlign(CENTER);
         text(numberOfMines, i * 80 + 40, j * 80 + 45);
       }
       
     }
   }
   
 }
}
