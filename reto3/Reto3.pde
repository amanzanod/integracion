/*
 * Variables
 */
int time_now;
int time_old;
int time_delta;
int time_total;
float time_countdown;
boolean run;


/*
 * Función inicialización
 */
void setup() {
  size(800, 400);
  
  background(0, 0, 0);
  stroke(255, 255, 255);
  
  // No es un valor exacto.
  frameRate (24);
  
  time_old = 0;
  time_countdown = 0;
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
  
  textSize (30);
  text (time_delta, 50, 35);
  text ("ms entre frames", 130, 35);
  
  textSize(30);
  text(time_countdown/1000 + " segundos", 325, 230);
  
  // Si run está activo y el tiempo de cuenta atrás es mayor que 0.
  if (run == true) { 
    // Se resta a la cuenta atrás el tiempo que ha pasado desde el último fotograma.
    time_countdown = time_countdown + time_delta;
  }
  
}
     
/*
 * Captura click ratón
 */
void mousePressed() {
  // Cuando se hace clic en el botón izquierdo, se activa run.
  if (mouseButton == LEFT){
      run = true;    
   }  
}
