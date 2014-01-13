String[] images;
String api_key = "YOUR_API_KEY_GOES_HERE"; //Get an API Key from Bing's Static Imagery service: http://msdn.microsoft.com/en-us/library/ff701724.aspx
String zoom = "ZOOM_LEVEL_GOES_HERE"; // Start with 16 or 17; Bing accepts values from 0-21

void setup() {
}

void draw() {
  images = loadStrings("images.csv");
  for(int i = 0; i < images.length; i++) {
    String[] values = split(images[i], ",");
    String lon = values[0];
    String lat = values[1];
    String id = values[2];
    PImage img = getSatImage(lat,lon);
    img.save("img" + id + ".png");
  }
  
}

PImage getSatImage(String lat, String lon) {
    String url = "http://dev.virtualearth.net/REST/v1/Imagery/Map/Aerial/" + lat + "," + lon + "/" + zoom + "?mapSize=900,900&format=png&key=" + api_key + "&junk=.png";
    return(loadImage(url));
}
