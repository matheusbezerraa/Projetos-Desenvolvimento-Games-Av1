char[][] board; 
char currentPlayer = 'X'; 
boolean gameOver = false;
boolean vsBot = false; 
boolean selectingMode = true; // 

void setup() {
  size(300, 300);
}

void draw() {
  if (selectingMode) {
    selectMode();
  } else if (!gameOver && board != null) {
    background(154);
    drawBoard();
    if (vsBot && currentPlayer == 'O') {
      botMove();
    }
  } else if (board != null) {
    background(25);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(255, 0, 0);
    if (checkWinner() && vsBot && currentPlayer == 'X') {
      text("Você venceu!", width/2, height/2);
    } else if (checkWinner() && vsBot && currentPlayer == 'O') {
      text("Você perdeu!", width/2, height/2);
    } else if (checkWinner() && !vsBot) {
      text("Jogador " + currentPlayer + " venceu!", width/2, height/2);
    } else {
      text("Empate!", width/2, height/2);
    }
  }
}

void drawBoard() {
  float w = width / 3;
  float h = height / 3;
  strokeWeight(4);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      float x = i * w;
      float y = j * h;
      noFill();
      rect(x, y, w, h);
      if (board[i][j] == 'X') {
        drawX(x, y, w, h);
      } else if (board[i][j] == 'O') {
        drawO(x, y, w, h);
      }
    }
  }
}

void drawX(float x, float y, float w, float h) {
  line(x + w/4, y + h/4, x + 3*w/4, y + 3*h/4);
  line(x + 3*w/4, y + h/4, x + w/4, y + 3*h/4);
}

void drawO(float x, float y, float w, float h) {
  ellipse(x + w/2, y + h/2, w/2, h/2);
}

void selectMode() {
  background(200);
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(0);
  text("Escolha como quer jogar:", width/2, height/2 - 30);
  fill(0, 102, 153);
  rect(width/2 - 70, height/2, 60, 30);
  fill(255);
  text("1 vs 1", width/2 - 40, height/2 + 15);
  fill(0, 102, 153);
  rect(width/2 + 10, height/2, 60, 30);
  fill(255);
  text("vs Bot", width/2 + 40, height/2 + 15);
}

void initializeBoard() {
  board = new char[3][3]; 
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = ' ';
    }
  }
}

void mousePressed() {
  if (selectingMode) {
    if (mouseX > width/2 - 70 && mouseX < width/2 - 10 && mouseY > height/2 && mouseY < height/2 + 30) {
      vsBot = false;
    } else if (mouseX > width/2 + 10 && mouseX < width/2 + 70 && mouseY > height/2 && mouseY < height/2 + 30) {
      vsBot = true;
    }
    selectingMode = false;
    initializeBoard();
  } else if (!gameOver && board != null) {
    int i = int(mouseX / (width / 3));
    int j = int(mouseY / (height / 3));
    if (board[i][j] == ' ') {
      board[i][j] = currentPlayer;
      if (checkWinner()) {
        gameOver = true;
      } else {
        switchPlayer();
        if (vsBot && currentPlayer == 'O') {
          botMove();
        }
      }
    }
  } else if (board != null) {
    gameOver = false;
    selectingMode = true;
  }
}

boolean checkWinner() {
  if (board == null) return false; 
  for (int i = 0; i < 3; i++) {
    if (board[i][0] != ' ' && board[i][0] == board[i][1] && board[i][0] == board[i][2]) {
      return true;
    }
    if (board[0][i] != ' ' && board[0][i] == board[1][i] && board[0][i] == board[2][i]) {
      return true;
    }
  }
  if (board[0][0] != ' ' && board[0][0] == board[1][1] && board[0][0] == board[2][2]) {
    return true;
  }
  if (board[0][2] != ' ' && board[0][2] == board[1][1] && board[0][2] == board[2][0]) {
    return true;
  }
  boolean draw = true;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == ' ') {
        draw = false;
      }
    }
  }
  if (draw) {
    return true;
  }
  return false;
}

void switchPlayer() {
  currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
}

void botMove() {
  if (board == null) return; 
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == ' ') {
        board[i][j] = currentPlayer;
        if (checkWinner()) {
          gameOver = true;
        } else {
          switchPlayer();
        }
        return;
      }
    }
  }
}
