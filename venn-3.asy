include "asy-common.asy";

path c1=circle((0,0),10);
path c2=circle((10,0),10);

picture intersection=new picture;
fill(intersection, c1, lightgray);
clip(intersection, c2);

add(intersection);

draw(c1);
draw(c2);

label("$A$",(0-5,0));            
label("$B$",(10+5,0));
label("$A \cap B$", (5,0));
