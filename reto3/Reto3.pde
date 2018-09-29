/*
 * Variables
 */
int time_now;
int time_old;
int time_delta;
int time_total;
float time_chrono;
boolean run;

/*
 * Variables Bola
 */
int ball_x;
int ball_y;
int ball_radius;
int inc_x;
int inc_y;

/*
 * Función inicialización
 */
void setup() {
  size(800, 400);
  
  background(0, 0, 0);
  stroke(255, 255, 255);
  
  // No es un valor exacto.
  frameRate (24);
  
  // Valor de la bola.
  ball_x = 10;
  ball_y = 200;
  ball_radius = 10;
  inc_x = 5;
  inc_y = 2;
  
  time_old = 0;
  time_chrono = 0;
}
      
/*
 * Función de repintado / actualización
 */
void draw() {
  
  // Devuelve la cantidad de milisegundos (milésimas de segundo) desde que se inició el programa.
  // Esta información se usa a menudo para sincronizar eventos y secuencias de animación.
  time_now = millis();
  // Cuanto ha pasado desde que se ejecuto por última vez.
  time_delta = time_now - time_old;
  // El tiempo viejo ahora es el tiempo actual.
  time_old = time_now;
  
  background(0, 0, 0);
  // Cambiamos a blanco.
  stroke(255,255,255);
  fill(255,255,255);
  
  textSize (30);
  text (time_delta, 50, 35);
  text ("ms entre frames", 130, 35);
  
  textSize(30);
  
  // Se formatea el crono para que aparezca en segundos con dos decimales.
  String time_chrono_round = nf((time_chrono/1000), 0, 2);
  text(time_chrono_round + " segundos", 325, 230);

  // Cambiamos a verde.
  stroke(80,150,120);
  fill(80,150,120);
  
  // Pintamos la bola.
  ellipse (ball_x, ball_y, ball_radius, ball_radius);
  
  // Si run está activo y el tiempo de cuenta atrás es mayor que 0.
  if (run == true) { 
    // Se suma al cronómetro el tiempo que ha pasado desde el último fotograma.
    time_chrono = time_chrono + time_delta;
    
    // Mover la bola como un billar.
    ball_x = ball_x + inc_x;
    ball_y = ball_y + inc_y;
    // Poner límites de la bola en el tablero.
    // Rebotar.
    if ( (ball_x <= 0) || (ball_x >= width)) {
      inc_x = inc_x * -1;
    }
    if ( (ball_y <= 0) || (ball_y >= height)) {
      inc_y = inc_y * -1;
    }
    
  }  
}
     
/*
 * Captura click ratón
 */
void mousePressed() {
  // Cuando se hace clic en el botón izquierdo, se activa run.
  // Si se hace clic en cualquier botón estando en true se desactiva run.
  if ((mouseButton == LEFT) && (run == false)){
      run = true;    
   } else {
     run = false; 
   } 
}
