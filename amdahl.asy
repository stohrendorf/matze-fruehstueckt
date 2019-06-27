include "asy-common.asy";
import graph;

scale(Linear(0.8), Linear(10));

real amdahl(real p, real f) {
    real res = f + (1-f)/p;
    return 1/res;
}

real amdahlb(real p, real f) {
    real res = f + (1-f)/p + 0.005*p;
    return 1/res;
}

real amdahl20(real p) {
    return amdahl(p, 0.2);
}

real amdahl50(real p) {
    return amdahl(p, 0.5);
}

real amdahl80(real p) {
    return amdahl(p, 0.8);
}

real amdahl90(real p) {
    return amdahl(p, 0.9);
}


real amdahl20b(real p) {
    return amdahlb(p, 0.2);
}

real amdahl50b(real p) {
    return amdahlb(p, 0.5);
}

real amdahl80b(real p) {
    return amdahlb(p, 0.8);
}

real amdahl90b(real p) {
    return amdahlb(p, 0.9);
}

draw(graph(amdahl20,1,100));
draw(graph(amdahl50,1,100));
draw(graph(amdahl80,1,100));
draw(graph(amdahl90,1,100));

draw(graph(amdahl20b,1,100), dashed);
draw(graph(amdahl50b,1,100), dashed);
draw(graph(amdahl80b,1,100), dashed);
draw(graph(amdahl90b,1,100), dashed);

pen thin=linewidth(0.5*linewidth())+gray+dotted;
pen thin2=linewidth(0.5*linewidth())+gray+dashed;

xaxis("$n_P$", xmin=0, xmax=100, new void(picture p, axisT a){ YEquals(5)(p,a); YEquals(0)(p,a); }, LeftTicks(begin=true,end=true,extend=true,ptick=thin,pTick=thin2));
yaxis("$\eta_S$", ymin=0, ymax=5, LeftRight, RightTicks(begin=true,end=true,extend=true,ptick=thin,pTick=thin2));

draw("$t_S=0.2$", (80,10*amdahl20(100)), E);
draw("$t_S=0.5$", (80,10*amdahl50(100)), E);
draw("$t_S=0.8$", (80,10*amdahl80(100)+1), E);
draw("$t_S=0.9$", (80,10*amdahl90(100)-1), E);
