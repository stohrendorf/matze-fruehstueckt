include "asy-common.asy";

path c1=circle((0,0),10);
path c2=circle((10,0),10);
fill(c1,lightgray);
fill(c2,lightgray);

draw(c1);
draw(c2);

label("$A$",(0-5,0));            
label("$B$",(10+5,0));
label("$A \cup B$", (5,0));
