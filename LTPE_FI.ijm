// This macro chops an image into 6x4 tiles
path = "D:/image/";
id = getImageID(); 
title = getTitle(); 
getLocationAndSize(locX, locY, sizeW, sizeH); 
width = getWidth(); 
height = getHeight(); 
tileWidth = width / 6; 
tileHeight = height / 4; 
i=1
for (y = 0; y < 4; y++) { 
	offsetY = y * height / 4; 
for (x = 0; x < 6; x++) { 
	offsetX = x * width / 6; 
	selectImage(id); 
	 call("ij.gui.ImageWindow.setNextLocation", locX + offsetX, locY + offsetY); 
	tileTitle = title + " [" + x + "," + y + "]"; 
	 run("Duplicate...", "title=" + tileTitle); 
	makeRectangle(offsetX, offsetY, tileWidth, tileHeight); 
 run("Crop"); 
 rename("image_"+i);
 selectWindow("image_"+i);
 run("16-bit");
run("Set Measurements...", "area mean standard min integrated limit redirect=None decimal=3");
run("Measure");
 saveAs("jpeg", path+"image_"+i); 
 i++;
 saveAs("Results", "D:/image/Results.csv");
} 
} 
selectImage(id); 
run("Close All");


 