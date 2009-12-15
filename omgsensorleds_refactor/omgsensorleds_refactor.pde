int maxi[] = {0,0,0};
int mini[] = {1000,1000,1000};

int RGB_LEDS[] = {2,3,4};
int SAMPLE_DELAY = 100;
float NSAMPLES = 5;

int LDR_PIN = 0;

void setup() {
  
  pinMode(LDR_PIN, INPUT);
  pinMode(RGB_LEDS[0], OUTPUT);
  pinMode(RGB_LEDS[1], OUTPUT);
  pinMode(RGB_LEDS[2], OUTPUT);
  
  Serial.begin(9600);
  
  delay(1000);
  calibra();
}

void loop() {
  
/*  for (int i=0;i<3;i++) {
     Serial.println(getValCer(i));
  }
  Serial.println("--------------");
  delay(3000);*/
  
}

//controlar servo continuo
void cservo_forward (int pin, int units) {
  for (int i = 0; i < units; i++) {
    analogWrite (pin, 127);
    delay (20);
  }
  analogWrite (pin, 0);
 
}

//sensor de luz
//calibrar
void calibra() {
   Serial.println("----------------------");
   Serial.println("INSIRA PAPEL BRANCO!");
   delay(5000);
   for (int i=0;i<3;i++)
     mini[i] = getVal(i);
   Serial.println("OK!");
   Serial.println("----------------------");
   Serial.println("INSIRA PAPEL PRETO!");
   delay(5000);
   for (int i=0;i<3;i++)
     maxi[i] = getVal(i);
   Serial.println("OK!");
}

// faz 5 leituras e devolve a media
int getVal(int i) {
  digitalWrite(RGB_LEDS[i],HIGH);
  digitalWrite(RGB_LEDS[(i+1)%3],LOW);
  digitalWrite(RGB_LEDS[(i+2)%3],LOW);
  
  delay(1000);
  
  int j, v=0, minR=1024,maxR=0;
  for (j = 0; j < NSAMPLES; j++) {
      int R = analogRead(LDR_PIN);
      minR=R<minR?R:minR;
      maxR=R>maxR?R:maxR;
      delay (SAMPLE_DELAY);
      
      v+=R;
  }
  v -= minR+maxR;

  //Serial.println((int)(v/(NSAMPLES-2)));
  return (int)(v/(NSAMPLES-2));
}
//obter leitura do led i
float getValCer(int i) {
  int v = getVal(i);
  //Serial.println("val:");
  //Serial.println(v);
  float v2 = (v*1.0-mini[i]) / (maxi[i]-mini[i]);
  return 255*(1.0-v2);
}
