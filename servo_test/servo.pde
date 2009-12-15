void setup() {
   
}

void loop() {
  cservo_forward(200);
}

void cservo_forward (int units) {
	for (int i = 0; i < units; i++) {
		analogWrite (10, 127);
		delay (20);
	}
        analogWrite (10, 0);
 
}
