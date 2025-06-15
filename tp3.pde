//Diaz Subelza Gabriel
//tp3 Comisión 3
//enlace al video explicatorio: https://youtu.be/7XzCS0-IiEM

PImage ref;
float centroX = 600;
float centroY = 200;

void setup() {
  size(800, 400);
  ref = loadImage("D_5.jpeg");
}

void draw() {
  background (36, 181, 116);
  int cantCapas = 8;
  int cantCirculos = 16;
  int radioMax = 220;

  for (int r = 0; r < cantCapas; r++) {
    float escalado = 1.19 - (float)r / cantCapas;
    float radio = radioMax * escalado;
    float tam = 40 * escalado;

    float giro = 0;

    if (mousePressed == true && r % 2 == 0) {
      giro = frameCount * 0.02;
    } else if (r % 2 == 0) {
      giro = PI / cantCirculos;
    }

    for (int i = 0; i < cantCirculos; i++) {
      float angulo = TWO_PI / cantCirculos * i + giro;
      float x = centroX + cos(angulo) * radio;
      float y = centroY + sin(angulo) * radio;
      float rotacion = radians(22.5 * i);

      push();
      translate(x, y);
      rotate(rotacion);
      circulo(0, 0, tam);
      pop();
    }

    image(ref, 0, 0, 400, 400);
    fill(0);
    stroke(15);
    line(400, 0, 400, 400);
  }
}

color colorRandom (int opacidad) {
  return color(random(255), random (255), random (255), opacidad);
}

void circulo (float x, float y, float tam) {
  noStroke();
  if (keyPressed == true) {
    fill(colorRandom (200));
  } else {
    fill(255);
  }
  arc(x, y, tam + 4, tam + 6, PI, TWO_PI);
  if (keyPressed == true) {
    fill(colorRandom (200));
  } else {
    fill(0);
  }
  arc(x, y, tam + 4, tam + 6, TWO_PI, PI + TWO_PI);
  if (keyPressed == true) {
    fill(colorRandom (200));
  } else {
    fill(102, 47, 148);
  }
  ellipse(x, y, tam, tam);
}
