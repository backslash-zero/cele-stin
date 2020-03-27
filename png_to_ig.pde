PImage img;
PImage shadow;
color averageColor;
int ammount = 116;
float shadowOffset = 0.2;
float shadowYOffset = 0.075;

void setup() {
    size(1080, 1350);
    noLoop();
    String dir = "./assets/Posters_Edited/";
    shadow = loadImage("./assets/shadow.png");
    int i = 1;
    int max = i - 1 + ammount;
    while(i <= max){
        img = loadImage(dir + "poster_" + str(i) + ".png");
        averageColor = extractColorFromImage(img);
        processingImg(img, shadow, averageColor, i);
        i++;
    }
    exit
}

void processingImg(PImage img, PImage shadow, color averageColor, int i) {
    background(averageColor);
    imageMode(CENTER);
    float imgH;
    float imgW;
    if (img.width < img.height)
    {
        imgH = 0.8 * width;
        imgW = img.width * imgH / img.height;
    }
    else {
        imgW = 0.8 * width;
        imgH = img.height * imgW / img.width;
    }
    image(shadow, width/2, height/2 + (shadowYOffset * imgH), imgW * (1 + shadowOffset) , imgH * (1 + shadowOffset) );
    image(img, width/2, height/2, imgW , imgH);
    saveFrame("/Users/celestin/Documents/Processing/png_to_ig/output/posterIG_" + str(i) + ".png");
}

void draw() {}

color extractColorFromImage(PImage img) {
    float lightFactor = 1.2;
    img.loadPixels();
    int r = 0, g = 0, b = 0;
    for (int i=0; i<img.pixels.length; i++) {
        color c = img.pixels[i];
        r += c>>16&0xFF;
        g += c>>8&0xFF;
        b += c&0xFF;
    }
    r /= img.pixels.length;
    g /= img.pixels.length;
    b /= img.pixels.length;
    return color(r, g, b);
}