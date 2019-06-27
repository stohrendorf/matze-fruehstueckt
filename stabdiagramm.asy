include "asy-common.asy";

draw((0,30)--(0,0)--(40,0), Arrows);
label("$f(x)$", (0,30), W);
label("$x$", (40,0), S);

void vbar(int x, int y) {
    fill(scale(1,5*y)*shift(x*5,0)*unitsquare);
    label("$h_" + (string)x + "$", (x*5,y*5), N);
}

vbar(1,3);
vbar(2,1);
vbar(3,5);
vbar(4,4);
vbar(5,5);
vbar(6,3);
vbar(7,1);
