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

// [-\+]?[0-9]+(\.[0-9]+)?([eE][-\+]?[0-9]+)?

label("\texttt{[-\textbackslash +]?[0-9]+}", (-20,0), W);

rnode(0,0);

conn((-20,0)--(0,0), "", N);

rnode(20,0);
conn((0,0)--(20,0), "\texttt{-}, \texttt{+}, $\varepsilon$", N);

rnode(50,0);
conn((20,0)--(50,0), "\texttt{0}, \texttt{1}, \texttt{2}, \ldots, \texttt{9}", N);
conn((50,0)..(35,-5)..(20,0), "$\varepsilon$", S);


label("\texttt{(\textbackslash.[0-9]+)?}", (-20,-20), W);

rnode(-10,-20);
rnode(5,-20);
conn((-10,-20)--(5,-20), "\texttt .", N);

rnode(35,-20);
conn((5,-20)--(35,-20), "\texttt{0}, \texttt{1}, \texttt{2}, \ldots, \texttt{9}", N);
conn((35,-20)..(20,-25)..(5,-20), "$\varepsilon$", S);

rnode(50,-20);
conn((35,-20)--(50,-20), "$\varepsilon$", N);
conn((-10,-20)..(0,-30)--(20,-30)--(40,-30)..(50,-20), "$\varepsilon$", S);

conn((50,0)..(50,-5)..(20,-10)..(-10,-15)..(-10,-20), "$\varepsilon$", N);


label("\texttt{([eE][-\textbackslash+]?[0-9]+)?}", (-20,-45), W);
rnode(-10,-45);
rnode(5,-45);
conn((-10,-45)--(5,-45), "\texttt e, \texttt E", N);

rnode(20,-45);
conn((5,-45)--(20,-45), "\texttt{-}, \texttt{+}, $\varepsilon$", N);

rnode(35,-45);
conn((20,-45)--(35,-45), "\texttt{0}, \ldots, \texttt{9}", N);
conn((35,-45)..(27.5,-50)..(20,-45), "$\varepsilon$", S);

enode(50,-45);
conn((35,-45)--(50,-45), "$\varepsilon$", N);

conn((-10,-45)..(0,-55)--(20,-55)--(40,-55)..(50,-45), "$\varepsilon$", S);

conn((50,-20)..(50,-25)..(20,-37.5)..(-10,-40)..(-10,-45), "$\varepsilon$", N);
