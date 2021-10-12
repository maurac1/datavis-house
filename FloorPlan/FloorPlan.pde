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
  table = loadTable("test.csv", "header");
  println(table.getRowCount() + " total rows in table");
  
  for (TableRow row : table.rows()) {
   int id = row.getInt("id");
   String species = row.getString("species");
   String name = row.getString("name");
   println(name + " (" + species + ") has an ID of" + id);
  }
  
  // font creation
  f = createFont("Arial", 16, true);
  
}

void draw() {
  background(bg);
  textFont(f, 16);
  fill(0);
  int y = 100;
  for (TableRow row : table.rows()) {
   int id = row.getInt("id");
   String species = row.getString("species");
   String name = row.getString("name");
   y = y + 20;
   text((name + " (" + species + ") has an ID of" + id), 200, y);
  }
}
