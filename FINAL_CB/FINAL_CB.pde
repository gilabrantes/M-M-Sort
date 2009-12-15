#include <Stepper.h>

#define STEPS 48

Stepper stepper1(STEPS, 2, 3, 4, 5); // braco
Stepper stepper2(STEPS, 6, 7, 8, 9); // trap

int previous = 0;
int braco = 0;
int trap = 0;
int sensor = 0;



void setup( ) {
  stepper1.setSpeed(30);
  stepper2.setSpeed(30);
  reset();
}

void loop() {
  
  feed();
  braco(-90); // empurra m&m para baixo do sensor
  braco(90); // sai do caminho
  sensor(-90); // fecha sensor
  getVal(); // mede cor
  sensor(90); // abre sensor
  
  // se vermelho
    // braco(-90);
    // trap(180);
    
  // se verde
    // trap(270);
    
  // se azul
    // trap(-270);
    
  // se amarelo
    // trap(90);
    // braco(-180);
  
}

void sensor(int deg) {
  // TODO
}

void trap(int deg) {
  trap += deg; // guarda pos do trap
  deg = (deg / 90)*12;
  stepper2.step(deg);
}

void braco(int deg) {
  braco += deg; // guarda pos do braco
  deg = (deg / 90)*12;
  stepper1.step(deg);
}

void feed() {
  // TODO
}

void reset() {
  // TODO
}
