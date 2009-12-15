int maxi;
int mini;

void setup() {
  
  maxi = 0;
  mini = 4550;
  
  pinMode(1, INPUT);
  Serial.begin(9600);
}

void loop() {
  
  
  int sensor = analogRead(0);
  
  if(sensor < mini) {
    mini = sensor;
    Serial.println("MIN: ");
    Serial.println(mini);
  }
  else {
    if(sensor > maxi) {
          maxi = sensor;
          Serial.println("MAX: ");
          Serial.println(maxi);
    }
  }
          
  //Serial.println("----------------------");
  //Serial.println("SENSOR: ");
  //Serial.println(sensor);
  delay(100);
}
