
float eksb = 4.000605096; //eksponentialfunktionen øvre værdi (b værdi)
float eksa = 0; //eksponentialfunktionen nedre værdi (a værdi)

float andb = 10.99413364; //andengradsfunktion øvre værdi (b værdi)
float anda = 4.000605096; //andengradsfunktion nedre værdi (a værdi)

float sinb = 12.87; //sinuskurvens øvre værdi (b værdi)
float sina = 10.99413364; //sinuskurvensnedre værdi (a værdi)

float scl = 100; //skala

float num = 0.00001; //steps

float fx1, fx2, fx3; //funktionen til eksponentialfunktionen (fx1), andengradsfunktion (fx2), sinuskurven (f3)

float x1, x2, x3 = 0.0;

float deltax1 = (eksb-eksa)/num; //intervaller til eksponentialfunktionen
float deltax2 = (andb-anda)/num; //intervaller til andengradsfunktion
float deltax3 = (sinb-sina)/num; //intervaller til sinuskurven

float eksareaV = 0.0; //areal til venstresummen for eksponentialfunktionen
float eksareaH = 0.0; //areal til højresummen for eksponentialfunktionen
float eksareaM = 0.0; //areal til midtsummen for eksponentialfunktionen

float andareaV = 0.0; //areal til venstresummen for andengradsfunktion
float andareaH = 0.0; //areal til højresummen for andengradsfunktion
float andareaM = 0.0; //areal til midtsummen for andengradsfunktion

float sinareaV = 0.0; //areal til venstresummen for sinuskurven
float sinareaH = 0.0; //areal til højresummen for sinuskurven
float sinareaM = 0.0; //areal til midtsummen for sinuskurven

void setup () {
  size (1800, 800);
}

void draw () {
  noLoop();
  background(200);
float m = millis();

  //regner arealet ud for eksponentialfunktionen ved brug af højresum
  for (float x1=eksa+num; x1<=eksb; x1 = num + x1 ) {
    float fx1 = 3.8*pow(0.8, x1);
    eksareaH += num*fx1;
    pushMatrix();
    strokeWeight(1);
    translate(width/5.5, height/1.1);
    rotate(1.5*PI);
    line((num * scl)-50, ((x1 + num) * scl)-100, (fx1 * scl)-50, ((x1 + num) * scl)-100);
    popMatrix();
  }

  //regner arealet ud for eksponentialfunktionen ved brug af venstresum
  for (float x1=eksa; x1<=eksb; x1 = num + x1 ) {
    float fx1 = 3.8*pow(0.8, x1);
    eksareaV += num*fx1;
  }
  //regner arealet ud for eksponentialfunktionen ved brug af midtsummen
  for (float x1=eksa+0.5*num; x1<=eksb; x1 = x1 + num) {
    float fx1 = 3.8*pow(0.8, x1);
    eksareaM += num*fx1;
  }

  //regner arealet ud for andengradsfunktion ved brug af venstresum
  for (float x2=anda; x2<=andb; x2 = num + x2 ) {
    float fx2 = pow(0.0025*x2, 2)-(0.04*x2)+1.75;
    
    andareaV += num*fx2;
    
    
    pushMatrix();
    strokeWeight(1);
    translate(width/5.5, height/1.1);
    rotate(1.5*PI);
    line((num * scl)-50, ((x2 + num) * scl)-100, (fx2 * scl)-50, ((x2 + num) * scl)-100);
    popMatrix();
  }

  //regner arealet ud for andengradsfunktion ved brug af højresum
  for (float x2=(anda+num); x2<=andb; x2 = num + x2 ) {
    float fx2 = pow(0.0025*x2, 2)-0.04*x2+1.75;
    andareaH += num*fx2;
  }

  //regner arealet ud for andengradsfunktion ved brug af mindtsummen
  for (float x2=anda+0.5*num; x2<=andb; x2 = num + x2 ) {
    float fx2 = pow(0.0025*x2, 2)-0.04*x2+1.75;
    andareaM += num*fx2;
  }
  //regner arealet ud for sinuskurven ved brug af venstresum
  for (float x3=sina; x3<=sinb; x3 = num + x3 ) {
    float fx3 = 2*sin(0.5*x3+2.99);
    sinareaV += num*fx3;
    pushMatrix();
    strokeWeight(1);
    translate(width/5.5, height/1.1);
    rotate(1.5*PI);
    line((num * scl)-50, ((x3 + num) * scl)-100, (fx3 * scl)-50, ((x3 + num) * scl)-100);
    popMatrix();
  }

  //regner arealet ud for sinuskurven ved brug af højresummen
  for (float x3=sina+num; x3<=sinb; x3 = num + x3 ) {
    float fx3 = 2*sin(0.5*x3+2.99);
    sinareaH += num*fx3;
  }

  //regner arealet ud for sinuskurven ved brug af midtsummen
  for (float x3=sina+0.5*num; x3<=sinb; x3 = num + x3 ) {
    float fx3 = 2*sin(0.5*x3+2.99);
    sinareaM += num*fx3;
  }
  //printer værdierne ud
  println ("areal højresum for eksponentialfunktionen " + eksareaH);
  println ("areal venstreesum for eksponentialfunktionen " + eksareaV);
  println ("Gennemsnittet af begge arealer af eksponentialfunktionen er " + (eksareaH+eksareaV)/2);
  println ("midtsummen for eksponentialfunktionen " + eksareaM);
  println ("intervaller for eksponentialfunktionen " + deltax1);
  println (" ");

  println ("areal højresum for andengradsfunktion " + andareaH);
  println ("areal venstreesum for andengradsfunktion " + andareaV);
  println ("Gennemsnittet af begge arealer af andengradsfunktion er " + (andareaH+andareaV)/2);
  println ("midtsummen for andengradsfunktion " + andareaM);
  println ("intervaller for andengradsfunktion " + deltax2);
  println (" ");

  println ("areal højresum for sinuskurven " + sinareaH);
  println ("areal venstreesum for sinuskurven " + sinareaV);
  println ("Gennemsnittet af begge arealer af sinuskurven er " + (sinareaH+sinareaV)/2);
  println ("midtsummen for sinuskurven " + sinareaM);
  println ("intervaller for sinuskurven " + deltax3);
  

  //hele figurens areal af gennemsnittet fra højre og venstre sum
  float geneks = (eksareaH+eksareaV)/2;
  float genand = (andareaH+andareaV)/2;
  float gensin = (sinareaH+sinareaV)/2;
  float ialtgennemnit = geneks + genand + gensin;
  println (" ");
  println ("arealet af hele figuren af gennemsnitne fra højre og venstresum er " + ialtgennemnit);
  println (" ");

  //hele figurens areal af midtsummen
  float ialtmidt = eksareaM + andareaM + sinareaM;
  println ("arealet af hele figuren af gennemsnitne fra midtsum er " + ialtmidt);
  println (" ");
  println ("tid brugt " +  m);
}
