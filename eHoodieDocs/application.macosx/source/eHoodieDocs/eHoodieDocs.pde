import java.awt.*;
import java.awt.event.*;
import java.awt.datatransfer.*;
import javax.swing.*;
import java.io.*;

PFont f;
String[] lbl = { 
  "[01] skeleten program", 
  "[02] int led=5;", 
  "[03] delay(<duration in ms>);", 
  "[04] for(int i=0;i<255;i++){\n\n}", 
  "[05] pinMode( <pin>, OUTPUT );", 
  "[06] pinMode( <pin>, INPUT );", 
  "[07] digitalWrite(<pin>,HIGH);", 
  "[08] digitalWrite(<pin>,LOW);", 
  "[09] digitalRead(<pin>);", 
  "[10] analogWrite ( <pin>, <val 0 - 255> );", 
  "[11] analogRead ( <pin> );", 

  "[12] tone( <pin>, <note>, <noteDuration> );", 
  "[13] noTone( <pin>);", 
  "[14] Serial.begin(9600);", 
  "[15] if( Serial.available() ){ \n\n }", 
  "[16] Serial.parseInt();", 
  "[17] Serial.println( \"<string here>\"  )"
};

String[] lbl_toCopy = {
  "void setup() {" + "\n\n\n" +
    "}" + "\n\n\n" +
    "void loop() {\n\n\n\n}", 

  "int led=5;", 
  "delay(<duration in ms>);", 
  "for(int i=0;i<255;i++){\n\n   }", 
  "pinMode( <pin>, OUTPUT );", 
  "pinMode( <pin>, INPUT );", 

  "digitalWrite(<pin>,HIGH);", 
  "digitalWrite(<pin>,LOW);", 
  "digitalRead(<pin>);", 
  "analogWrite ( <pin>, <val 0 - 255> );", 
  "analogRead ( <pin> );", 
  "tone( <pin>, <note>, <noteDuration> );", 
  "noTone( <pin>);", 
  "Serial.begin(9600);", 
  "if( Serial.available() ){ \n\n }", 
  "Serial.parseInt();", 
  "Serial.println( \"<string here>\" );"
};

color[] c = {
  //grey
  color(200, 200, 200), 
  color(200, 200, 200), 
  color(200, 200, 200), 
  color(200, 200, 200), 
  //green
  color(112, 184, 50), 
  color(112, 184, 50), 
  color(112, 184, 50), 
  color(112, 184, 50), 
  //orange
  color(112, 184, 50), 
  color(255, 153, 0), 
  color(255, 153, 0), 
  //yellow
  color(255, 255, 0), 
  color(255, 255, 0), 
  //blue
  color(51, 102, 255), 
  color(51, 102, 255), 
  color(51, 102, 255), 
  color(51, 102, 255)
};


Btn[] b;

String msg= "mouse over buttons to find \n out more, click to copy.";
String coppied = "blah";


void setup() {
  smooth();
  size( 380, 32*lbl.length );
  background( 255 );


  b = new Btn[lbl.length];
  int yPos=-24;
  for (int i=0;i<b.length;i++) {
    b[i]= new Btn(20, yPos+=31, 340, 30, lbl[i], lbl_toCopy[i], c[i]);
  }
  f = loadFont("Courier-12.vlw");
  textFont(f, 12);
}

void draw() {
  background(255);

  for (int i=0;i<b.length;i++) {
    b[i].disp();
  }
}
void mouseMoved() {
  for (int i=0;i<b.length;i++) {
    b[i].mouseOver(mouseX, mouseY);
  }
}
void mousePressed() {
  for (int i=0;i<b.length;i++) {
    b[i].buttonPressed(mouseX, mouseY);
  }
}

class Btn {
  String lbl="lbl();";
  String toCopy="";
  int x=0;
  int y=0;
  int w=0;
  int h=0;
  color c;
  color sk = color(255, 255, 255);
  public Btn(int x, int y, int w, int h, String lbl, String toCopy, color c) {
    this.x=x;
    this.y=y;
    this.h=h;
    this.w=w;
    this.lbl=lbl;
    this.toCopy=toCopy;
    this.c= c;
  }

  public void disp() {
    noStroke();
    //strokeWeight(1);
    // stroke(sk);

    fill(sk);
    ellipse(this.x-10, this.y+(this.h/2), 13, 13);
    ellipse(this.x+this.w+10, this.y+(this.h/2), 13, 13);
    fill(c);
    rect(x, y, w, h); 
    fill(0);
    text(lbl, x+5, y+(2*(h/3)) );
  }
  public void mouseOver(float mx, float my) {
    if (mx>x && mx<x+w && my>y && my <y+h) {
    }
    else {
    }
  }
  public void buttonPressed(float mx, float my) {

    if (mx>x && mx<x+w && my>y && my <y+h && mousePressed) {
      for (int i =0; i<b.length;i++) {
        b[i].sk = color(255, 255, 255);
      }
      sk = color(100, 100, 100);


      StringSelection data = new StringSelection(toCopy);
      Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
      clipboard.setContents( data, data);
      //text("[copied]", x+w+5, y+(2*(h/3)) );
      msg = lbl;
    } 
    else {
    }
  }
}

