class Place implements Comparable {
  float longitude;
  float latitude;
  String name;
  int postalCode;
  float population;
  float density;
  
  int x() {
    return int(map(this.longitude, minX, maxX, 20, width-20));
  }
  
  int y() {
    return int(map(this.latitude, minY, maxY, height-20, 20));
  }
  
  int density() {
    return int(map(
      log(1+density), 
      log(1+minDensity), 
      log(1+maxDensity), 
      0, 255));
    //return int(map(density, minDensity, maxDensity, 0, 255));
  }
  
  int population() {
    return int(map(log(1+population), log(1+minPop), log(1+maxPop), 150, 255));
    //return int(map(population, minPop, maxPop, 150, 255));
  }
  
  void draw() {
    int d = density();
    int p = population();
    fill(255, 255-d, 0);
    //fill(255, 0, 0, d);
    
    ellipse(x(), y(), p/72., p/72.);
  }
  
  String label() {
    return name +
      "\nPopulation: " + population +
      "\nDensity: " + density +
      "\nPostal code: " + postalCode;
  }
  
  int compareTo(Object other) {
    return int(population - ((Place)other).population);
  }
}