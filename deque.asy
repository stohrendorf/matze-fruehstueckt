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

draw((52.5,3.5)--(62.5,3.5), black, BeginArrow);
draw((52.5,6.5)--(62.5,6.5), black, EndArrow);

draw((-12.5,3.5)--(-2.5,3.5), black, BeginArrow);
draw((-12.5,6.5)--(-2.5,6.5), black, EndArrow);
