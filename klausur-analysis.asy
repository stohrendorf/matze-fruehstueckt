include "asy-common.asy";

void vbar(real x, real y, string s = "") {
    fill((x*5-2,0)--(x*5-2,y*0.5)--(x*5+2,y*0.5)--(x*5+2,0)--cycle, rgb(26/255,97/255,169/255));
    label(s, (x*5,y*0.5), N);
}

label("avg.~$3.7$", (30,15));

vbar(1, 2);
vbar(2, 4);
vbar(3, 5);
vbar(4, 6);
vbar(5, 6);
vbar(6, 7);
vbar(7, 9);
vbar(8, 5);
vbar(9, 9);
vbar(10, 12);
vbar(11, 41, "$39\,\%$");

label("$1$", (5,0), S);
//label("$1.3$", (10mm,0), S);
//label("$1.7$", (15mm,0), S);
label("$2$", (20,0), S);
//label("$2.3$", (25mm,0), S);
//label("$2.7$", (30mm,0), S);
label("$3$", (35,0), S);
//label("$3.3$", (40mm,0), S);
//label("$3.7$", (45mm,0), S);
label("$4$", (50,0), S);
label("$5$", (55,0), S);

draw((0,0)--(60,0));

//shipout(bbox(0));