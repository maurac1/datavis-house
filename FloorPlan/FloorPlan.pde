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

class Center{
  int xpos, ypos, avg;
  Center(int x, int y){
    xpos = x;
    ypos = y;
    avg = 0;
  }
  void SetAvg(int a){
    avg = a;
  }
}

ArrayList<Center> centers = new ArrayList<Center>();


void setup() {
  //set the size of the window to match the picture
  size(600, 683);

  bg = loadImage("floorplan.jpg");
  
  // loading csv data and printing info to console
  table = loadTable("filteredDataForAlpha.csv", "header");
  println(table.getRowCount() + " total rows in table");
  
  centers.add(new Center(80, 605));
  centers.add(new Center(86, 554));
  centers.add(new Center(481, 336));
  centers.add(new Center(483, 275));
  centers.add(new Center(434, 448));
  centers.add(new Center(307, 157));
  centers.add(new Center(490, 82));
  centers.add(new Center(214, 460));
  centers.add(new Center(300, 341));
  centers.add(new Center(300, 341));
  
  for (TableRow row : table.rows()) {
   centers.get(0).SetAvg(centers.get(0).avg + row.getInt("KWHCDR"));
   centers.get(1).SetAvg(centers.get(1).avg + row.getInt("KWHCW"));
   centers.get(2).SetAvg(centers.get(2).avg + row.getInt("KWHDWH"));
   centers.get(3).SetAvg(centers.get(3).avg + row.getInt("KWHRFG"));
   centers.get(4).SetAvg(centers.get(4).avg + row.getInt("KWHCOK"));
   centers.get(5).SetAvg(centers.get(5).avg + row.getInt("KWHTV1"));
   centers.get(6).SetAvg(centers.get(6).avg + row.getInt("KWHLGT"));
   centers.get(7).SetAvg(centers.get(7).avg + row.getInt("KWHWTH"));
   centers.get(8).SetAvg(centers.get(8).avg + row.getInt("KWHCOL"));
   centers.get(9).SetAvg(centers.get(9).avg + row.getInt("KWHSPH"));
  }
  int rows = table.getRowCount();
  centers.get(0).SetAvg(centers.get(0).avg / rows);
  centers.get(1).SetAvg(centers.get(1).avg / rows);
  centers.get(2).SetAvg(centers.get(2).avg / rows);
  centers.get(3).SetAvg(centers.get(3).avg / rows);
  centers.get(4).SetAvg(centers.get(4).avg / rows);
  centers.get(5).SetAvg(centers.get(5).avg / rows);
  centers.get(6).SetAvg(centers.get(6).avg / rows);
  centers.get(7).SetAvg(centers.get(7).avg / rows);
  centers.get(8).SetAvg(centers.get(8).avg / rows);
  centers.get(9).SetAvg(centers.get(9).avg / rows);
  
  
  // font creation
  f = createFont("Arial", 16, true);
  
}

void draw() {
  background(bg);
  textFont(f, 16);
  fill(0);
  
  // place averages in correct places
  
  
  //int total1=0,total2=0,total3=0,total4=0;
  //int count1=0,count2=0,count3=0,count4=0;
  //for (TableRow row : table.rows()) {
  // int DOEID = row.getInt("DOEID");
   //int REGIONC = row.getInt("REGIONC");
   //int KWH = row.getInt("KWH");
  /*switch(REGIONC) {
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
  }*/
  //y = y + 20;
  //text(("id:" + " " + DOEID + " has an KWH of" + KWH+ " and is loacated in region "+REGIONC), 100, y);
  //}
  /*textSize(20);
  text(("Region 1's KWH average = "+total1/count1+
   "\n"+"Region 2's KWH average = "+total2/count2+
   "\n"+"Region 3's KWH average = "+total3/count3+
   "\n"+"Region 4's KWH average = "+total4/count4+"\n"), 150, 300);*/
}
