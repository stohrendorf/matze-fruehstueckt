include "asy-common.asy";

import three;
import graph3;

currentprojection=orthographic(1/2,-1/4,1/4.4);

guide3 e1 = (0,0,0)--(20,0,0);
guide3 e2 = (0,0,0)--(0,20,0);
guide3 e3 = (0,0,0)--(0,0,20);
draw(e1, Arrow3);
label("$\vec a$, Daumen", point(e1,1), E);
draw(e2, Arrow3);
label("$\vec b$, Zeigefinger", point(e2,1), NE);
draw(e3, Arrow3);
label("$\vec a \times \vec b$, Mittelfinger", point(e3,1), N);

guide3 alphaArc = arc(point(e1,0),point(e1,0.25),point(e2,0.25));
draw(alphaArc, Arrow3);
label("$\varphi$", alphaArc, SE);
