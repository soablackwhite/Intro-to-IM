void visualize() {
  noStroke();
  fill(235,235,235,0.1);
  // smooth the rms data by smoothing factor
  sum += (rms.analyze() - sum) * smoothingFactor;
  // Perform the analysis for fft
  fft.analyze();

  for (int i = 0; i < bands; i++) {
    // Smooth the FFT spectrum data by smoothing factor
    sum2[i] += (fft.spectrum[i] - sum2[i]) * smoothingFactor;
  }
  a=1;
  b=1;
  n3=sum2[int(bands/3)]*500;
  n1=sum2[int(bands/6)]*200;
  n2=sum2[int(bands/9)]*100;
  println(m);

  //lights();
  pushMatrix();
  translate(width/2,100);
    // rms.analyze() return a value between 0 and 1. It's
  // scaled to height/2 and then multiplied by a fixed scale factor
  float potentio_scale=map(potentio_value,0,1023,0,10);
  float rms_scaled = sum * (height/2) * potentio_scale;
  fill(235);
  // We draw a circle whose size is coupled to the audio analysis
  //ellipse(0,0, rms_scaled*0.8, rms_scaled*0.8);
  osc= map(rms_scaled, 0, (height/2) * 5, 0, 2);
  m = map((float) Math.sin(osc), -1.0, 1.0, 0.0, 10);
  strokeWeight(1);
  noFill();
  radius = rms_scaled*0.6;
  int total = 200;
  float increment = TWO_PI / (float) total;
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += increment) {
    stroke(180, 180, random(220));
    float r = super_shape(angle);
    float x = radius * r * cos(angle);
    float y = radius * r * sin(angle);
    vertex(x, y);
  }
  endShape(CLOSE);
    beginShape();
  for (float angle = 0; angle < TWO_PI; angle += increment) {
    stroke(180, 180, random(220));
    float r = super_shape(angle);
    float x = radius*0.9 * r * cos(angle);
    float y = radius*0.9 * r * sin(angle);
    vertex(x, y);
  }
  endShape(CLOSE);
  beginShape();
  for (float angle = 0; angle < TWO_PI; angle += increment) {
    stroke(180, 180, random(220));
    float r = super_shape(angle);
    float x = radius*1.1* r * cos(angle);
    float y = radius*1.1 * r * sin(angle);
    vertex(x, y);
  }
  endShape(CLOSE);
    beginShape();
  for (float angle = 0; angle < TWO_PI; angle += increment) {
    strokeWeight(5);
    stroke(random(200,235), random(200,235), 235);
    float r = super_shape(angle+5);
    float x = radius*0.2* r * cos(angle+5);
    float y = radius*0.2 * r * sin(angle+5);
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}
