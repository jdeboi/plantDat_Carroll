import java.util.*;
String url = "http://www.plantdat.com/";
ArrayList<Plant> spawnedPlants;
ArrayList<Plant> permPlants;
Map spawnedPlantIDs;
int lastSpawnCheck = 0;
float spawnedFloat = 0;
PShape shovel;

void initPermPlants() {
  permPlants = new ArrayList<Plant>();

  //for (int x = 0; x <= 100; x += 20) {
  //  for (int y = 0; y <= 100; y+= 20) {
  //    PVector temp = getSpawnedXY(x, y);
  //    permPlants.add(new Lizard(temp, 1.0, false));
  //  }
  //}

  // middle
  permPlants.add(new Clasping(getSpawnedXY(35, 0), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(36, 3), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(37, 0), 1.0, false));

  permPlants.add(new Lizard(getSpawnedXY(55, 2), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(53, 0), 1.0, false));

  // right side plants
  permPlants.add(new Lizard(getSpawnedXY(77, 0), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(85, 0), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(87, 0), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(90, 0), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(92, -10), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(93, 0), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(95, -20), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(97, -5), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(98, -22), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(100, -12), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(101, -32), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(102, -22), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(103, -12), 1.0, false));

  // left side plants
  //for (int i = 0; i < 20; i++) {
  //  //permPlants.add(new Lizard(getSpawnedXY(random(-3, 10), random(-40, -8)), 1.0, false));
  //  if (i%5 == 0)  permPlants.add(new Stokes(getSpawnedXY(random(-3, 10), random(-40, -8)), 0, -1));
  //  else if (i%5 == 1)  permPlants.add(new Lizard(getSpawnedXY(random(-3, 10), random(-40, -8)), 0, -1));
  //  else if (i%5 == 2)  permPlants.add(new Beauty(getSpawnedXY(random(-3, 10), random(-40, -8)), 0, -1));
  //  else if (i%5 == 3)  permPlants.add(new Clasping(getSpawnedXY(random(-3, 10), random(-40, -8)), 0, -1));
  //  else if (i%5 == 4)  permPlants.add(new Obedient(getSpawnedXY(random(-3, 10), random(-40, -8)), 0, -1));
  //}
  //float inc = 0.5;
  //for (int i = -2; i <= 10; i+=2) {
  //  permPlants.add(new Lizard(getSpawnedXY(i, -30-(i+inc)), 1.0, false));
  //  permPlants.add(new Beauty(getSpawnedXY(i, -20-(i+inc)), 1.0, false));
  //  permPlants.add(new Beauty(getSpawnedXY(i, -10-(i+inc)), 1.0, false));
  //  inc+=1;
  //}



  permPlants.add(new Lizard(getSpawnedXY(-2, -15), 1.0, false));
  permPlants.add(new Beauty(getSpawnedXY(-1, -35), 1.0, false));
  permPlants.add(new Beauty(getSpawnedXY(0, -30), 1.0, false));
   permPlants.add(new Lizard(getSpawnedXY(1, -30), 1.0, false));
   permPlants.add(new Beauty(getSpawnedXY(3, -30), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(2, -20), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(3, 0), 1.0, false));
   permPlants.add(new Beauty(getSpawnedXY(4, -35), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(5, -15), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(6, -25), 1.0, false));
  permPlants.add(new Stokes(getSpawnedXY(6, -5), 1.0, false));
  permPlants.add(new Stokes(getSpawnedXY(7, -5), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(8, -30), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(10, -10), 1.0, false));

  permPlants.add(new Obedient(getSpawnedXY(21, -2), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(20, 0), 1.0, false));
  permPlants.add(new Lizard(getSpawnedXY(22, 0), 1.0, false));
}

void displaySpawned(PGraphics s) {
  for (int i = 0; i < spawnedPlants.size(); i++) {
    spawnedPlants.get(i).display(s);
    spawnedPlants.get(i).grow();
  }
}

void displayPermanent(PGraphics s) {
  for (int i = 0; i < permPlants.size(); i++) {
    permPlants.get(i).display(s);
    permPlants.get(i).grow();
  }
}

//long lastPlantRemoval = 0;
void removeDeadPlants() {
  //if (millis() - lastPlantRemoval > delay) {
  //lastPlantRemoval = millis();
  int i = 0;
  while (i < spawnedPlants.size()) {
    if (!spawnedPlants.get(i).alive) {
      //int code = spawnedPlants.get(i).id;
      spawnedPlants.remove(i);
      println("removed old plant");
      // can forsee an issue where time delay means plant will respawn, flash, based on timing differences of web app and this program
      //spawnedPlantIDs.remove(code);
    } else {
      i++;
    }
  }
  //}
}



void incSpawnedFloat() {
  int spz = spawnedPlants.size();
  if (spawnedFloat < spz) {
    spawnedFloat += 0.01;
  } else if (spawnedFloat > spz) {
    spawnedFloat -= 0.01;
  }
}

void initSpawned() {
  spawnedPlants = new ArrayList<Plant>();
  spawnedPlantIDs = new HashMap();
  checkForSpawned(0);
  shovel = loadShape("images/shovel.svg");
}

void  checkForSpawned(int delayT) {
  if (millis() - lastSpawnCheck > delayT) {
    thread("requestData");
    lastSpawnCheck = millis();
  }
}

// This happens as a separate thread and can take as long as it wants
void requestData() {
  JSONArray sp = loadJSONArray(url + "api/allspawned");
  for (int i = 0; i < sp.size(); i++) {
    JSONObject pObj = sp.getJSONObject(i); 
    JSONObject plant = pObj.getJSONObject("plant");
    int code = plant.getInt("code");
    if (!spawnedPlantIDs.containsKey(code)) {
      addNewPlant(pObj, code);
      spawnedPlantIDs.put(code, 1);
    } else {
      //println(code, " already exists");
    }
  }
}

void addNewPlant(JSONObject pObj, int code) {
  float age = pObj.getFloat("age");
  //age = constrain(age, 0, 1);
  JSONObject plant = pObj.getJSONObject("plant");
  String name = plant.getString("plantType"); 
  int x = plant.getInt("x");
  int y = plant.getInt("y");
  PVector xy = getSpawnedXY(x, y);

  if (name.equals("Lizard's Tail")) {
    spawnedPlants.add(new Lizard(xy, age, code));
    println("added new plant", name);
  } else if (name.equals("American Beautyberry")) {
    println("asd");
    spawnedPlants.add(new Beauty(xy, age, code));
    println("added new plant", name);
  } else if (name.equals("Clasping Cone Flower")) {
    spawnedPlants.add(new Clasping(xy, age, code));
    println("added new plant", name);
  } else if (name.equals("Correll’s Obedient Plant")) {
    spawnedPlants.add(new Obedient(xy, age, code));
    println("added new plant", name);
  } else if (name.equals("Stokes Aster")) {
    spawnedPlants.add(new Stokes(xy, age, code));
    println("added new plant", name);
  }

  println("Num spawned plants: ", spawnedPlants.size());
}

void displaySpawnedPlants(PGraphics s) {

  if (spawnedPlants != null) {

    for (int i = 0; i < spawnedPlants.size(); i++) {
      try {
        spawnedPlants.get(i).display(s);
      }
      catch(Exception e) {
        println(e);
        println("spawned plants is an issue...");
      }
    }
  }
}

// remeber that y is zero at the top of the screen...
PVector getSpawnedXY(float x, float y) {
  float zMin = getBackWater();
  float zMax = -50;
  float newZ = map(y, 0, 100, zMin, zMax);
  float newY =  map(y, 100, 0, canvas.height+10, 150);
  float newX = map(x, 0, 100, newZ*.8 + 15, canvas.width-newZ*.8-70);
  //println("spawned x " + x + "y" + y + " dx " + newX + " dy " + newY + " dz " + newZ);
  return new PVector(newX, newY, newZ);
}

float getSpawnedY(float z) {
  float zMin = getBackWater();
  float zMax = -50;
  float newY =  map(z, zMax, zMin, canvas.height+10, 150);
  return newY;
}

void reduceWaterPlants() {
  if (TESTING) {
    if (permPlants != null) {
      for (Plant p : permPlants) {
        //PVector temp = getWaterLoc(p.x, p.y, p.z);
        //reduceWater(int(temp.x), int(temp.y), p.plantHeight);
        reduceWater(int(p.x), int(p.y), int(p.z), p.plantHeight);
      }
    }
  } else {
    if (spawnedPlants != null) {
      for (Plant p : spawnedPlants) {
        //PVector temp = getWaterLoc(p.x, p.y, p.z);
        //reduceWater(int(temp.x), int(temp.y), p.plantHeight);
        reduceWater(int(p.x), int(p.y), int(p.z), p.plantHeight);
      }
    }
  }
}

//PVector getWaterLoc(float x, float y, float z) {
//  float zMin = getBackWater();
// origin of water starts at
//


//float zMax = 0;
//float minX = map(z, zMax, zMin, 22, 8);
//float maxX = map(z, zMax, zMin, 32, 45);
//float minY = 0;
//float maxY = 25;

//float newX = map(x, z*.6 + 15, canvas.width-z*.55-80, minX, maxX);
//float newY = map(z, zMax, zMin, maxY, minY);

//float dis = sqrt(y*y + z *z);
//float newY = map(dis, 0, rowsTerr*spacingTerr*(3.0/4.0), rowsTerr*(1.0/4), rowsTerr);
//newY = constrain(newY, 0, rowsTerr-1);

//float newX = colsTerr/2 - (x - canvas.width/2)*1.0/spacingTerr; 
//newX = constrain(newX, 0, colsTerr-1);

//return new PVector(newX, newY);
//}

void spawnFakePlants() {
  int i = 0;
  for (int x = 0; x <10; x ++) {
    if (i%5 == 0) spawnedPlants.add(new Stokes(getSpawnedXY(random(100), random(100)), 1.0, false));
    else if (i%5 == 1) spawnedPlants.add(new Lizard(getSpawnedXY(random(100), random(100)), 1.0, false));
    else if (i%5 == 2) spawnedPlants.add(new Beauty(getSpawnedXY(random(100), random(100)), 1.0, false));
    else if (i%5 == 3) spawnedPlants.add(new Clasping(getSpawnedXY(random(100), random(100)), 1.0, false));
    else if (i%5 == 4) spawnedPlants.add(new Obedient(getSpawnedXY(random(100), random(100)), 1.0, false));
    i++;
  }
}

long recurringPlantTime = 0;
void spawnRecurringPlants(int delayt) {
  randomSeed(millis());
  int i = int(random(5));
  if (millis() - recurringPlantTime > delayt) {
    recurringPlantTime = millis();
    if (i == 0) spawnedPlants.add(new Stokes(getSpawnedXY(random(100), random(100)), 0, -1));
    else if (i == 1) spawnedPlants.add(new Lizard(getSpawnedXY(random(100), random(100)), 0, -1));
    else if (i == 2) spawnedPlants.add(new Beauty(getSpawnedXY(random(100), random(100)), 0, -1));
    else if (i == 3) spawnedPlants.add(new Clasping(getSpawnedXY(random(100), random(100)), 0, -1));
    else if (i == 4) spawnedPlants.add(new Obedient(getSpawnedXY(random(100), random(100)), 0, -1));
  }
}

void displayBoundaries(PGraphics s) {
  PVector temp;
  for (int x = 0; x <= 100; x += 25) {
    for (int y = 0; y <= 100; y+= 25) {
      temp = getSpawnedXY(x, y);
      s.pushMatrix();
      s.fill(255, 0, y*100);
      s.translate(temp.x, temp.y, temp.z);
      reduceWater(temp.x, temp.y, temp.z, 1.0);
      //println("tz" + temp.z);
      //PVector temp2 = getWaterLoc(temp.x, temp.y, temp.z);
      //reduceWater(int(temp2.x), int(temp2.y), 1);
      //reduceWater(int(temp.x), int(temp.y), 1);
      //println(temp.x + " " + temp.y + " " + temp.z);
      s.ellipse(0, 0, 30, 30);
      s.popMatrix();
    }
  }
}
