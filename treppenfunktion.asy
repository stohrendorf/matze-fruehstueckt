include "asy-common.asy";

draw((0,30)--(0,0)--(30,0), Arrows);
label("$F(x)$", (0,30), W);
label("$x$", (30,0), S);

real ay = 0;

void vbar(int x, int y) {
    path p = (x*3,ay)--(x*3,y+ay)--(x*3+3,y+ay);
    draw(p);
    ay += y;
}

vbar(1,3);
vbar(2,1);
vbar(3,5);
vbar(4,4);
vbar(5,5);
vbar(6,3);
vbar(7,1);
