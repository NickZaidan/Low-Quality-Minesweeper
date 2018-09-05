//The minefield object
Cell[][] cells;

void setup(){
  background(255);
  size(801,801);
  cells = new Cell[10][10]; //Set for a 10x10
  
  for(int i = 0; i < cells[0].length; i++){
    for(int j = 0; j < cells.length; j++){
      cells[i][j] = new Cell(); //Creating all the cell objects
    }
  }
  for(int i = 0; i < 10; i++){
     int placementX = int(random(0, 9));
     int placementY = int(random(0, 9));
     if(!cells[placementY][placementX].bomb){
       cells[placementY][placementX].bomb = true; //Randomly place mines in
       //cell object, and if a mine already exists, pick again.
     } else{
       i--;
     }
  }
  //Figure out how many mines are near the selected cell
  for(int i = 0; i < cells[0].length; i++){
    for(int j = 0; j < cells.length; j++){
      int counter = countMines(i, j); //Function to count mines
      println("[" + i + "," + j + "]");
      cells[i][j].numberOfMines = counter;
    }
  }
}


void draw(){
  for(int i = 0; i < cells[0].length; i++){
    for(int j = 0; j < cells.length; j++){
      cells[i][j].show(i, j); //Constantly keep drawing the minefield
    }
  }
}
//A terrible count mine function which could be greatly improved. Was just
//as I was starting to get tired
int countMines(int i, int j){
  
  //Checks to see if the cell is an edge case. Edge cases being top left, top right
  //bottom left, bottom right, top row, bottom row, left column or right column
  //If not any of these, check for mines normally
  int counter = 0;
  //CORNERS
  //Top Left
  if(i == 0 && j == 0){
    if(cells[i + 1][j].bomb){
      counter++;
    }
    
    if(cells[i][j + 1].bomb){
      counter++;
    }
    
    if(cells[i + 1][j + 1].bomb){
      counter++;
    }
  }
  
  //Top right
  else if(i == 0 && j == cells.length - 1){
    if(cells[i][j - 1].bomb){
      counter++;
    }
    if(cells[i + 1][j - 1].bomb){
      counter++;
    }
    if(cells[i + 1][j].bomb){
      counter++;
    }
  }
  
  //Bottom Left
  
  else if(i == cells.length - 1 && j == 0){
    if(cells[i - 1][j].bomb){
      counter++;
    }
    if(cells[i - 1][j + 1].bomb){
      counter++;
    }
    if(cells[i][j + 1].bomb){
      counter++;
    }
  }
  
  
  //Bottom Right
  else if(i == cells.length - 1 && j == cells.length - 1){
    if(cells[i][j - 1].bomb){
      counter++;
    }
    if(cells[i - 1][j].bomb){
      counter++;
    }
    if(cells[i - 1][j - 1].bomb){
      counter++;
    }
  }
  
  
  //ROWS & COLUMNS
  
  //TOP ROW
  else if(i == 0 && j >= 0){    
    
    //To the left
    if(cells[i][j - 1].bomb){
      counter++;
    }
    //Down left
    if(cells[i + 1][j - 1].bomb){
      counter++;
    }
    
    //To the right
    if(cells[i][j + 1].bomb){
      counter++;
    }
    
    if(cells[i + 1][j].bomb){
      counter++;
    }
    
    if(cells[i + 1][j + 1].bomb){
      counter++;
    }
  }
  
  //Left Column
  
  else if(i >= 0 && j == 0){
    if(cells[i - 1][j].bomb){
      counter++;
    }
    if(cells[i - 1][j + 1].bomb){
      counter++;
    }
    
    if(cells[i][j + 1].bomb){
      counter++;
    }
    
    if(cells[i + 1][j].bomb){
      counter++;
    }
    
    if(cells[i + 1][j + 1].bomb){
      counter++;
    }
  }
  
  //Bottom row
  else if(i == cells.length - 1 && j >= 0){
    if(cells[i - 1][j - 1].bomb){
      counter++;
    }
    
    if(cells[i - 1][j].bomb){
      counter++;
    }
    
    if(cells[i][j - 1].bomb){
      counter++;
    }
    
    if(cells[i - 1][j + 1].bomb){
      counter++;
    }
    
    if(cells[i][j + 1].bomb){
      counter++;
    }
    
  }
  
  //Right row
  else if(i >= 0 && j == cells.length - 1){
   if(cells[i - 1][j - 1].bomb){
      counter++;
    }
    
    if(cells[i - 1][j].bomb){
      counter++;
    }
    
    if(cells[i][j - 1].bomb){
      counter++;
    }
    
    if(cells[i + 1][j - 1].bomb){
      counter++;
    }
    
    if(cells[i + 1][j].bomb){
      counter++;
    } 
  }
  
  //NOT EDGE CASE, EVERYTHING ELSE
  else{
    
    
    if(cells[i - 1][j - 1].bomb){
      counter++;
    }
    
    if(cells[i - 1][j].bomb){
      counter++;
    }
    
    if(cells[i - 1][j + 1].bomb){
      counter++;
    }
    
    
    if(cells[i][j - 1].bomb){
      counter++;
    }
    if(cells[i][j + 1].bomb){
      counter++;
    }
    
    
    if(cells[i + 1][j - 1].bomb){
      counter++;
    }
    
    
    if(cells[i + 1][j].bomb){
      counter++;
    }
    if(cells[i + 1][j + 1].bomb){
      counter++;
    }
  }
  
 return counter;
}

void mouseClicked(){ //If clicked on box, uncover it
  cells[mouseX / 80][mouseY / 80].revealed = true;
  if(cells[mouseX / 80][mouseY / 80].bomb){
    setup(); //If it is a mine, reset as the user has lost
  }
  
}
