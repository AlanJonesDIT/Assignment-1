class PlanetText{

  int planetIndex;
  String planetName;
  float radius;
  int tempMin;
  int tempMax;
  String population;
  int habitable; // convert to boolean using boolean()
  int orbitVel;
  
  PlanetText(TableRow row){
    planetIndex = row.getInt("index");
    planetName = row.getString("name");
    radius = row.getFloat("radius");
    tempMin = row.getInt("tempMin");
    tempMax = row.getInt("tempMax");
    population = row.getString("population");
    habitable = row.getInt("habitable"); // convert to boolean using boolean()
    orbitVel = row.getInt("orbitVel");
  }
  
  
  
  String toString()
  {
    return planetIndex + "," + planetName + "," + radius
      + "," + habitable
      + "," + tempMin
      ;
  }
}