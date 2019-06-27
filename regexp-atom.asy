include "asy-common.asy";

real radius = 3;

void conn(picture pic = currentpicture, path p, string lbl, pair dir) {
    real len = arclength(p);
    pair p1 = relpoint(p, radius/len);
    pair p2 = relpoint(p, 1-radius/len);
    path sp;
    if(size(p)>2)
        sp = subpath(p, 1, size(p)-2);
    p = p1..sp..p2;
    draw(pic, p, Arrow);
    draw(pic, lbl, relpoint(p, 0.5), dir);
}

void rnode(picture pic = currentpicture, real x, real y) {
    draw(pic, circle((x,y), radius));
}

void enode(picture pic = currentpicture, real x, real y) {
    draw(pic, circle((x,y), radius));
    draw(pic, circle((x,y), radius/2));
}


picture p1;
unitsize(p1, 1mm);

label(p1, "\texttt{A}", (-20,0), W);

rnode(p1, 0,0);
conn(p1, (-15,0)--(0,0), "Start", NW);

enode(p1, 20,0);
conn(p1, (0,0)--(20,0), "\texttt A", N);

label(p1, "Ende", (23,0), E);

add(p1);



picture p2;
unitsize(p2, 1mm);

label(p2, "\texttt{AB}", (-20,0), W);


rnode(p2, 0,0);
conn(p2, (-15,0)--(0,0), "", N);

rnode(p2, 20,0);
conn(p2, (0,0)--(20,0), "\texttt A", N);

enode(p2, 40,0);
conn(p2, (20,0)--(40,0), "\texttt B", N);

add(shift(0,-10)*p2);


picture p3;
unitsize(p3, 1mm);

label(p3, "\texttt{A|B}", (-20,0), W);

rnode(p3, 0,0);
conn(p3, (-15,0)--(0,0), "", N);

rnode(p3, 15,5);
conn(p3, (0,0)--(15,5), "$\varepsilon$", N);
rnode(p3, 15,-5);
conn(p3, (0,0)--(15,-5), "$\varepsilon$", S);

rnode(p3, 35,5);
conn(p3, (15,5)--(35,5), "\texttt A", N);
rnode(p3, 35,-5);
conn(p3, (15,-5)--(35,-5), "\texttt B", S);

enode(p3, 50,0);
conn(p3, (35,5)--(50,0), "$\varepsilon$", N);
conn(p3, (35,-5)--(50,0), "$\varepsilon$", S);

add(shift(0,-25)*p3);


picture p3b;
unitsize(p3, 1mm);

rnode(p3b, 0,0);
conn(p3b, (-15,0)--(0,0), "", N);

enode(p3b, 20,0);
conn(p3b, (0,0)..(10,2)..(20,0), "\texttt A", N);
conn(p3b, (0,0)..(10,-2)..(20,0), "\texttt B", S);

add(shift(0,-40)*p3b);


picture p4;
unitsize(p4, 1mm);

label(p4, "\texttt{A*}", (-20,0), W);

rnode(p4, 0,0);
conn(p4, (-15,0)--(0,0), "", N);

rnode(p4, 20,0);
conn(p4, (0,0)--(20,0), "$\varepsilon$", N);
rnode(p4, 40,0);
conn(p4, (20,0)--(40,0), "\texttt A", N);
enode(p4, 60,0);
conn(p4, (40,0)--(60,0), "$\varepsilon$", N);

conn(p4, (0,0)..(10,-5)--(30,-5)--(50,-5)..(60,0), "$\varepsilon$", S);
conn(p4, (40,0)..(30,5)..(20,0), "$\varepsilon$", N);

add(shift(0,-55)*p4);


picture p4b;
unitsize(p4b, 1mm);

enode(p4b, 0,0);
conn(p4b, (-15,0)--(0,0), "", N);
conn(p4b, (0,0)..(-4,4)..(4,4)..(0,0), "\texttt A", N);

add(shift(0,-75)*p4b);
