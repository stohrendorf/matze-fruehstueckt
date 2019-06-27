include "asy-common.asy";

path c1=circle((0,0),10);
path c2=circle((10,0),10);
fill(c1,lightgray);

picture intersection=new picture;
fill(intersection, c1, white);
clip(intersection, c2);

add(intersection);

draw(c1);
draw(c2);

label("$A$",(0-5,0));            
label("$B$",(10+5,0));
label("$A \setminus B$", (5,0));
