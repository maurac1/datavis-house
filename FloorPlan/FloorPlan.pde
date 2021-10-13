/**
 * Background Image. 
 * 
 * This example presents the fastest way to load a background image
 * into Processing. To load an image as the background, it must be
 * the same width and height as the program.
 */

PImage bg;
Table table;
PFont f;

void setup() {
  size(600, 683);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 640 x 360 pixels.
  bg = loadImage("floorplan.jpg");
  
  // loading csv data and printing info to console
  table = loadTable("filteredDataForAlpha.csv", "header");
  println(table.getRowCount() + " total rows in table");
  int i=0;
  for (TableRow row : table.rows()) {
   int DOEID = row.getInt("DOEID");
   String REGIONC = row.getString("REGIONC");
   String KWH = row.getString("KWH");
   println("id:" + " (" + DOEID + ") has an KWH of" + KWH+ "and is loacated in region"+REGIONC);
   i+=1;
   if(i==5){
     break;
   }
  }
  
  // font creation
  f = createFont("Arial", 16, true);
  
}

void draw() {
  background(bg);
  textFont(f, 16);
  fill(0);
  int y = 100;
  int total1=0,total2=0,total3=0,total4=0;
  int count1=0,count2=0,count3=0,count4=0;
  for (TableRow row : table.rows()) {
   //int DOEID = row.getInt("DOEID");
   int REGIONC = row.getInt("REGIONC");
   int KWH = row.getInt("KWH");
  switch(REGIONC) {
    case 1: 
      total1+=KWH;
      count1+=1;
      break;
    case 2: 
      total2+=KWH;
      count2+=1;
      break;
    case 3: 
      total3+=KWH;
      count3+=1;
      break;
    case 4: 
      total4+=KWH;
      count4+=1;
      break;
}
   y = y + 20;
  }
  textSize(20);
  text(("Region 1's KWH average = "+total1/count1+
   "\n"+"Region 2's KWH average = "+total2/count2+
   "\n"+"Region 3's KWH average = "+total3/count3+
   "\n"+"Region 4's KWH average = "+total4/count4+"\n"), 250, 300);
}
