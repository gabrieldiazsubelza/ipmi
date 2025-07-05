//Diaz Subelza Gabriel
//tp2 Comisión 3

PFont fuente1, fuente2;
PImage sangre, sangreTexto, sangreTexto2, limpiador, robot1, robot2, balde, baldeSpill;
int diapositiva;
int contador;
boolean playON = false;
boolean REplay = false;
float opacidad = 0;
float playX, playY, playDiam, playDiam2;
float sangreX = -34, sangreY = height*3.5;
float movimientoX = width*4.5, movimientoY = height*4.5;
float limpiadorX, limpiadorY, rect1Y, rect2Y;
float sangreTextoY = -850, sangreTexto2Y = -650;
float imagenX = -900, imagenY = 0;
float robot2Y = -900;
String titulo1 = "Can't Help Myself";
String titulo2 = "SÍSIFO 2.O";
String texto1 = "«Can't help myself» es una instalación de arte conceptual creada por Sun Yuan y Peng Yu, establecida en el museo Guggenheim en Nueva York. Esta obra consiste en un robot que va perdiendo líquido hidráulico, y el cual está programado para que, cuando los sensores detecten que el fluido se está expandiendo demasiado, use su brazo con una pala para retenerlo.";
String texto2 = "Antes, el robot tenía tiempo de sobra e incluso bailaba cuando finalizaba su tarea. A día de hoy, está demasiado estresado y no consigue retenerlo correctamente, dejado zonas del suelo manchadas y las paredes salpicadas con líquido rojizo. Ya no tiene tiempo para bailar, sólo puede intentar mantenerse «vivo».";

void setup() {
  size(640, 480);
  frameRate(30);
  background(245);
  fuente1 = loadFont("chiller82.vlw");
  fuente2 = loadFont("agency52.vlw");
  sangre = loadImage("OPA.png");
  sangreTexto = loadImage("sangreTexto.png");
  sangreTexto2 = loadImage("sangreTexto2.png");
  limpiador = loadImage("limpiador.png");
  balde = loadImage("balde.png");
  baldeSpill = loadImage("baldeSpill.png");
  robot1 = loadImage("robot1.jpg");
  robot2 = loadImage("robot2.jpg");
  playX = width/2;
  playY = height/2 + 150;
  playDiam = 80;
  playDiam2 = 80;
  reset();
}

void draw() {
  if (diapositiva == 0) {
    background(245);
    image(balde, width/2 - 115, height/2 - 100, 200, 200);
    noStroke();
    fill(0);
    ellipse(playX, playY, playDiam, playDiam);
    fill(245);
    triangle(345, 391, 302, 370, 302, 412);
    if (playON) {
      diapositiva = 1;
    }
  }
  if (diapositiva == 1) {
    println("esta es la diapositiva 1");
    contador++;
    background(245);
    image(baldeSpill, sangreX + 230, sangreY - 175, 306, 200);
    image(sangre, sangreX, sangreY, 720, 650);
    textFont(fuente1, 90);
    textAlign(CENTER, CENTER);
    fill(212, 0, 0);
    text(titulo1, width/2, movimientoY);
    text(titulo2, width/2, movimientoY+100);
    if (contador > 60 && sangreY >= -380) {
      sangreY = sangreY - 2.5;
    }
    if (contador > 120 && movimientoY >= height/2 + height/8) {
      movimientoY = movimientoY - 1.9;
    }
    if (contador > 510) {
      diapositiva = 2;
      reset();
    }
  }
  if (diapositiva == 2) {
    background(245);
    image(sangre, sangreX, sangreY, 720, 650);
    textFont(fuente1, 90);
    textAlign(CENTER, CENTER);
    fill(212, 0, 0);
    text(titulo1, width/2, movimientoY);
    text(titulo2, width/2, movimientoY+100);
    fill(245);
    rect(-200, rect1Y, 600, 585);
    rect(100, rect2Y, 600, 485);
    image(limpiador, limpiadorX, limpiadorY, 600, 600);

    if (limpiadorY >= -4 && limpiadorX == -220) {
      limpiadorY -= 6;
      rect1Y -= 6;
    } else if (limpiadorY <= 0 && limpiadorX <= 120) {
      limpiadorX += 5;
    } else {
      limpiadorY += 6;
      rect2Y += 6;
    }
    if (rect2Y >= 0) {
      diapositiva = 3;
      reset();
    }
  }
  if (diapositiva == 3) {
    contador++;
    background(245);
    image(robot1, imagenX, imagenY, 742, 480);
    image(sangreTexto, 320, sangreTextoY, 320, 900);
    rect(-200, rect1Y, 600, 585);
    rect(100, rect2Y, 600, 485);
    image(limpiador, limpiadorX, limpiadorY, 600, 600);
    textFont(fuente2, 24);
    textAlign(CENTER);
    fill(245);
    text(texto1, 370, sangreTextoY+90, 250, 780);

    if (sangreTextoY <= -45 && imagenX <= 220) {
      sangreTextoY += 3.7;
      imagenX += 4;
    }
    if (contador == 520) {
      diapositiva = 4;
      reset();
    }
  }
  if (diapositiva == 4) {
    background(245);
    image(robot1, imagenX, imagenY, 742, 480);
    image(sangreTexto, 320, sangreTextoY, 320, 900);
    textFont(fuente2, 24);
    textAlign(CENTER);
    fill(245);
    text(texto1, 370, sangreTextoY+90, 250, 780);
    rect(-200, rect1Y, 600, 585);
    rect(100, rect2Y, 600, 485);
    image(limpiador, limpiadorX, limpiadorY, 600, 600);

    if (limpiadorY >= -4 && limpiadorX == -220) {
      limpiadorY -= 6;
      rect1Y -= 6;
    } else if (limpiadorY <= 0 && limpiadorX <= 120) {
      limpiadorX += 5;
    } else {
      limpiadorY += 6;
      rect2Y += 6;
    }
    if (rect2Y >= 0) {
      diapositiva = 5;
      reset();
    }
  }
  if (diapositiva == 5) {
    contador++;
    background(245);
    image(robot2, 0, robot2Y, 640, 480);
    image(sangreTexto2, 0, sangreTexto2Y, 640, 572);
    textFont(fuente2, 22);
    textAlign(CENTER);
    fill(245);
    text(texto2, 20, sangreTexto2Y + 230, 600, 300);

    if (sangreTexto2Y <= -200) {
      sangreTexto2Y += 2.5;
      robot2Y += 5.8;
    }
    if (contador == 500) {
      diapositiva = 6;
      reset();
    }
  }
  if (diapositiva == 6) {
    background(245);
    image(robot2, 0, robot2Y, 640, 480);
    image(sangreTexto2, 0, sangreTexto2Y, 640, 572);
    textFont(fuente2, 22);
    textAlign(CENTER);
    fill(245);
    text(texto2, 20, sangreTexto2Y + 230, 600, 300);
    rect(-200, rect1Y, 600, 585);
    rect(100, rect2Y, 600, 485);
    image(limpiador, limpiadorX, limpiadorY, 600, 600);

    if (limpiadorY >= -4 && limpiadorX == -220) {
      limpiadorY -= 6;
      rect1Y -= 6;
    } else if (limpiadorY <= 0 && limpiadorX <= 120) {
      limpiadorX += 5;
    } else {
      limpiadorY += 6;
      rect2Y += 6;
    }
    if (rect2Y >= 0) {
      diapositiva = 7;
      reset();
    }
  }
  if (diapositiva == 7) {
    println("fin");
    contador++;
    background(245);
    textFont(fuente1, 90);
    textAlign(CENTER, CENTER);
    fill(212, 0, 0, opacidad);
    text("FIN.", width/2, height/2);

    if (contador <= 10) {
      opacidad += 0.5;
    } else if (contador < 900 && opacidad < 255) {
      opacidad += 3;
    }
    if (contador >= 70) {
      noStroke();
      fill(0);
      ellipse(playX, playY, playDiam2, playDiam2);
      fill(245);
      triangle(345, 391, 302, 370, 302, 412);
      if (REplay) {
        diapositiva = 0;
        SUPERreset();
      }
    }
  }
}

void mousePressed() {
  float distancia = dist(mouseX, mouseY, playX, playY);
  if (distancia < playDiam/2) {
    playON = true;
  }
  if (distancia < playDiam2/2 && diapositiva == 7) {
    REplay = true;
  }
}
