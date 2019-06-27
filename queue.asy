include "asy-common.asy";

draw((5,5)--(45,5));

path c1 = circle((5,5), 5);
fill(c1,lightgray);
draw(c1);

path c2 = circle((25,5), 5);
fill(c2,lightgray);
draw(c2);

path c3 = circle((45,5), 5);
fill(c3,lightgray);
draw(c3);

draw((-12.5,5)--(-2.5,5), black, EndArrow);
draw((52.5,5)--(62.5,5), black, EndArrow);
