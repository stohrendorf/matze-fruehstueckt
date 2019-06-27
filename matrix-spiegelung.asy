include "asy-common.asy";

//draw((0,0)--(35,35), dashed);

path a = (0,0)--(0,20);

draw( shift(10,10)*rotate(20)*a, EndArrow );
label("$v'$", shift(10,10)*rotate(20)*(0,20), N);

draw( shift(10,10)*rotate(-20)*a, EndArrow );
label("$v$", shift(10,10)*rotate(-20)*(0,20), N);

draw( shift(10,10)*rotate(-70)*a, EndArrow );
label("$Av$", shift(10,10)*rotate(-70)*(0,20), NE);

draw( shift(10,10)*rotate(-110)*a, EndArrow );
label("$Av'$", shift(10,10)*rotate(-110)*(0,20), E);

draw(arc((10,10), 10, -20+90, 20+90), EndArrow);
draw(arc((10,10), 10, -70+90, -110+90), EndArrow);

label("$\det(A)=-1$", (20,25), NE);
