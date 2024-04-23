float p1y = 212;
float p2y = 212;
float bx = 429;
float by = -10;
float x;
float y = 5;
float p1 = 0;
float p2 = 0;
boolean p1win = false;
boolean p2win = false;
boolean gamestart = false;
boolean[] pressed = new boolean[256];

void setup() {
  noStroke();
  size(858, 525);
  background(0);
  x = random(1, 3);
  x = floor(x);
  if (x == 1) {
    x = 5;
  } else {
    x = -5;
  }
}

void draw() {
  background(0);
  println("p1:", p1, "  ", "p2:", p2, "  ", "x:", x, "  ", "y:", y);
  if (p1 == 11) {
    p1win = true;
    rect(198, 212, 10, 30);
    rect(198, 232, 50, 10);
    rect(238, 212, 10, 30);
    rect(218, 212, 10, 30);
    rect(258, 212, 10, 30);
    rect(278, 212, 10, 30);
    rect(278, 212, 30, 10);
    rect(298, 212, 10, 30);
  }
  if (p2 == 11) {
    p2win = true;
    rect(550, 212, 10, 30);
    rect(550, 232, 50, 10);
    rect(590, 212, 10, 30);
    rect(570, 212, 10, 30);
    rect(610, 212, 10, 30);
    rect(630, 212, 10, 30);
    rect(630, 212, 30, 10);
    rect(650, 212, 10, 30);
  }

  fill(250);
  for (int i = 10; i < 500; i += 30) {
    rect(427, i, 10, 20);
  }

  if (by >= p1y && by <= p1y + 100 && bx < 30) {
    x = 5;
  }

  if (by >= p2y && by <= p2y + 100 && bx > width - 30) {
    x = -5;
  }

  if (bx <= 0) {
    p2 = p2 + 1;
    bx = 429;
    by = 10;
  }

  if (bx >= 858) {
    p1 = p1 + 1;
    bx = 429;
    by = 10;
  }

  if (by < 0) {
    y = 5;
  }
  if (by > 525) {
    y = -5;
  }

  rect(20, p1y, 10, 100);
  rect(828, p2y, 10, 100);

  if (p1win == false && p2win == false && gamestart == true) {
    rect(bx, by, 10, 10);
    bx = bx + x;
    by = by + y;
  }

  updateBats();
  if (p1 == 0 || p1 == 0 || p1 == 2 || p1 == 3 || p1 == 5 || p1 == 7 || p1 == 8 || p1 == 9 || p1 == 10) {
    rect(370, 20, 30, 5); //top
  }
  if (p1 == 2 || p1 == 3 || p1 == 4 || p1 == 5 || p1 == 6 || p1 == 8 || p1 == 9) {
    rect(370, 37.5, 30, 5); //mid
  }
  if (p1 == 0 || p1 == 2 || p1 == 3 || p1 == 5 || p1 == 6 || p1 == 8 || p1 == 10) {
    rect(370, 60, 30, 5); //bot
  }
  if (p1 == 0 || p1 == 4 || p1 == 5 || p1 == 6 || p1 == 8 || p1 == 9 || p1 == 10) {
    rect(370, 20, 5, 20); //leftT
  }
  if (p1 == 0 || p1 == 2 || p1 == 6 || p1 == 8 || p1 == 10) {
    rect(370, 40, 5, 25); //leftB
  }
  if (p1 == 0 || p1 == 1 || p1 == 2 || p1 == 3 || p1 == 4 || p1 == 7 || p1 == 8 || p1 == 9 || p1 == 10 || p1 == 11) {
    rect(395, 20, 5, 20); //rightT
  }
  if (p1 == 0 || p1 == 1 || p1 == 3 || p1 == 4 || p1 == 5 || p1 == 6 || p1 == 7 || p1 == 8 || p1 == 9 || p1 == 10 || p1 == 11) {
    rect(395, 40, 5, 25); //rightB
  }
  if (p1 == 10 || p1 == 11) {
    rect(360, 20, 5, 45); //10 & 11
  }

  if (p2 == 0 || p2 == 0 || p2 == 2 || p2 == 3 || p2 == 5 || p2 == 7 || p2 == 8 || p2 == 9 || p2 == 10) {
    rect(469, 20, 30, 5); //top
  }
  if (p2 == 2 || p2 == 3 || p2 == 4 || p2 == 5 || p2 == 6 || p2 == 8 || p2 == 9) {
    rect(469, 37.5, 30, 5); //mid
  }
  if (p2 == 0 || p2 == 2 || p2 == 3 || p2 == 5 || p2 == 6 || p2 == 8 || p2 == 10) {
    rect(469, 60, 30, 5); //bot
  }
  if (p2 == 0 || p2 == 4 || p2 == 5 || p2 == 6 || p2 == 8 || p2 == 9 || p2 == 10) {
    rect(469, 20, 5, 20); //leftT
  }
  if (p2 == 0 || p2 == 2 || p2 == 6 || p2 == 8 || p2 == 10) {
    rect(469, 40, 5, 25); //leftB
  }
  if (p2 == 0 || p2 == 1 || p2 == 2 || p2 == 3 || p2 == 4 || p2 == 7 || p2 == 8 || p2 == 9 || p2 == 10 || p2 == 11) {
    rect(494, 20, 5, 20); //rightT
  }
  if (p2 == 0 || p2 == 1 || p2 == 3 || p2 == 4 || p2 == 5 || p2 == 6 || p2 == 7 || p2 == 8 || p2 == 9 || p2 == 10 || p2 == 11) {
    rect(494, 40, 5, 25); //rightB
  }
  if (p2 == 10 || p2 == 11) {
    rect(459, 20, 5, 45); //10 & 11
  }

  if (gamestart == false) {
    fill(255);
    textAlign(LEFT, TOP);
    textSize(16);
    text("Player 1: Q | A     Player 2: P | L", 20, 25);
    textAlign(RIGHT, TOP);
    textSize(16);
    text("Pressione Enter para começar", width - 20, 25);
  }
}

void keyPressed() {
  pressed[key] = true;
  if (pressed[' ']) {
    gamestart = true;
  }
}

void keyReleased() {
  pressed[key] = false;
}

void updateBats() {
  // Movimento do jogador 1
  if ((pressed['Q'] || pressed['q']) && p1y > 0) {
    p1y -= 5; // Move para cima
  }
  if ((pressed['A'] || pressed['a']) && p1y < height - 100) {
    p1y += 5; // Move para baixo
  }

  // Movimento do jogador 2
  if ((pressed['P'] || pressed['p']) && p2y > 0) {
    p2y -= 5; // Move para cima
  }
  if ((pressed['L'] || pressed['l']) && p2y < height - 100) {
    p2y += 5; // Move para baixo
  }
}
