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
class Appliance{
  int xpos, ypos, avg;
  String name;
  Appliance(int x, int y){
    xpos = x;
    ypos = y;
    avg = 0;
    name = "";
  }
  void SetAvg(int a){
    avg = a;
  }
}

class Color{
 int r, g, b;
 Color(int red, int green, int blue){
  r = red;
  g = green;
  b = blue;
 }
}

// create a list of Center objects
ArrayList<Appliance> appliances = new ArrayList<Appliance>();


void setup() {
  //set the size of the window to match the picture
  size(600, 683);

  bg = loadImage("floorplan.jpg");
  
  // loading csv data and printing info to console
  table = loadTable("filteredDataForAlpha.csv", "header");
  println(table.getRowCount() + " total rows in table");
  
  // populate the centers with their correct locations on image
  appliances.add(new Appliance(80, 605));
  appliances.add(new Appliance(86, 554));
  appliances.add(new Appliance(481, 336));
  appliances.add(new Appliance(483, 275));
  appliances.add(new Appliance(434, 448));
  appliances.add(new Appliance(307, 157));
  appliances.add(new Appliance(490, 82));
  appliances.add(new Appliance(214, 460));
  appliances.add(new Appliance(300, 320));
  appliances.add(new Appliance(300, 375));
  
  // sum the energy usage for each utility
  for (TableRow row : table.rows()) {
   appliances.get(0).SetAvg(appliances.get(0).avg + row.getInt("KWHCDR"));
   appliances.get(0).name = "KWHCDR";
   appliances.get(1).SetAvg(appliances.get(1).avg + row.getInt("KWHCW"));
   appliances.get(1).name = "KWHCW";
   appliances.get(2).SetAvg(appliances.get(2).avg + row.getInt("KWHDWH"));
   appliances.get(2).name = "KWHDWH";
   appliances.get(3).SetAvg(appliances.get(3).avg + row.getInt("KWHRFG"));
   appliances.get(3).name = "KWHRFG";
   appliances.get(4).SetAvg(appliances.get(4).avg + row.getInt("KWHCOK"));
   appliances.get(4).name = "KWHCOK";
   appliances.get(5).SetAvg(appliances.get(5).avg + row.getInt("KWHTV1"));
   appliances.get(5).name = "KWHTV1";
   appliances.get(6).SetAvg(appliances.get(6).avg + row.getInt("KWHLGT"));
   appliances.get(6).name = "KWHLGT";
   appliances.get(7).SetAvg(appliances.get(7).avg + row.getInt("KWHWTH"));
   appliances.get(7).name = "KWHWTH";
   appliances.get(8).SetAvg(appliances.get(8).avg + row.getInt("KWHCOL"));
   appliances.get(8).name = "KWHCOL";
   appliances.get(9).SetAvg(appliances.get(9).avg + row.getInt("KWHSPH"));
   appliances.get(9).name = "KWHSPH";
  }
  
  // divide each sum by the number of rows in the data table
  // results in average energy use
  int rows = table.getRowCount();
  appliances.get(0).SetAvg(appliances.get(0).avg / rows);
  appliances.get(1).SetAvg(appliances.get(1).avg / rows);
  appliances.get(2).SetAvg(appliances.get(2).avg / rows);
  appliances.get(3).SetAvg(appliances.get(3).avg / rows);
  appliances.get(4).SetAvg(appliances.get(4).avg / rows);
  appliances.get(5).SetAvg(appliances.get(5).avg / rows);
  appliances.get(6).SetAvg(appliances.get(6).avg / rows);
  appliances.get(7).SetAvg(appliances.get(7).avg / rows);
  appliances.get(8).SetAvg(appliances.get(8).avg / rows);
  appliances.get(9).SetAvg(appliances.get(9).avg / rows);
  
  
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
  
  // color ranges
  Color c1 = new Color(119, 255, 0);
  Color c2 = new Color(246, 255, 0);
  Color c3 = new Color(255, 204, 0);
  Color c4 = new Color(255, 136, 0);
  Color c5 = new Color(255, 0, 0);
  
  int c2_range_start = 400;
  int c3_range_start = 800;
  int c4_range_start = 1200;
  int c5_range_start = 1600;
  
  
  // place averages in correct places on image with units
  for (Appliance a : appliances) {
    //text((c.avg + " KWH"), c.xpos, c.ypos);
    if(a.avg < c2_range_start){
      fill(c1.r, c1.g, c1.b, 120);
    }else if(a.avg < c3_range_start){
      fill(c2.r, c2.g, c2.b, 120);
    }else if(a.avg < c4_range_start){
      fill(c3.r, c3.g, c3.b, 120); 
    }else if(a.avg < c5_range_start){
      fill(c4.r, c4.g, c4.b, 120); 
    }else{
      fill(c5.r, c5.g, c5.b, 150); 
    }
    circle(a.xpos, a.ypos, 50);
  }
  
}
