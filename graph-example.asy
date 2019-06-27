include "asy-common.asy";

real radius = 3;

pair circNode(string text, pair pos) {
    pos = 10*pos;
    draw(circle(pos, radius));
    label(text, pos);
    return pos;
}

pair n1 = circNode("1", (4,0));
pair n2 = circNode("2", (8,0));
pair n3 = circNode("3", (2,2));
pair n4 = circNode("4", (6,2));
pair n5 = circNode("5", (2,4));
pair n6 = circNode("6", (6,4));

void conn(path p, string lbl, pair dir) {
    real len = arclength(p);
    pair p1 = relpoint(p, radius/len);
    pair p2 = relpoint(p, 1-radius/len);
    path sp;
    if(size(p)>2)
        sp = subpath(p, 1, size(p)-2);
    p = p1..sp..p2;
    draw(p, Arrow);
    draw(lbl, relpoint(p, 0.5), dir);
}

conn(n3..((n3+n1)/2+(2,2))..n1, "7", NE);
conn(n4..n1, "2", NW);
conn(n1..n2, "2", NE);
conn(n6..n2, "3", NE);
conn(n1..((n3+n1)/2-(2,2))..n3, "0", SW);
conn(n5..n3, "3", W);
conn(n3..n4, "1", NE);
conn(n6..n4, "5", W);
conn(n6..n5, "2", N);
conn(n5..(n5-(8,3))..(n5-(8,-3))..n5, "1", W);
conn(n3..n6, "6", NW);
