/**
 * Visualization of energy usage of utilities in a floorplan
 */

// create variables for background image, table of data, and font
PImage bg;
Table table;
PFont f;

/*
 * Class stores the location of a particular utility on the window
 * x position, y postion of center 
 * and average energy use to be displayed
 */
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

// create a list of Center objects
ArrayList<Center> centers = new ArrayList<Center>();


void setup() {
  //set the size of the window to match the picture
  size(600, 683);

  bg = loadImage("floorplan.jpg");
  
  // loading csv data and printing info to console
  table = loadTable("filteredDataForAlpha.csv", "header");
  println(table.getRowCount() + " total rows in table");
  
  // populate the centers with their correct locations on image
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
  
  // sum the energy usage for each utility
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
  
  // divide each sum by the number of rows in the data table
  // results in average energy use
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
  // display background
  background(bg);
  
  // select font
  textFont(f, 16);
  
  // select fill
  fill(0);
  
  // place averages in correct places on image with units
  for (Center c : centers) {
    text((c.avg + " KWH"), c.xpos, c.ypos);
  }
  
}
