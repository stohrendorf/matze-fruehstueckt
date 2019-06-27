include "asy-common.asy";
import graph;

scale(Linear(10), Linear(20));

real majorante(real x) {
    return 1/(x^2) + 1;
}

real minorante(real x) {
    return 1-1.5^(-x);
}

real fun(real x) {
    return sin(x*10)/x^2+1;
    // return 1-3^(-x);
}

draw(graph(majorante,1,10, join=operator..), dashed);
draw(graph(minorante,1,10, join=operator..), dashed);
draw(graph(fun,1,10,n=500, join=operator..));

label("$f(x)$", scale(10,20)*(1, fun(1)), W);
label("Majorante", scale(10,20)*(1.5, majorante(1.5)), NE);
label("Minorante", scale(10,20)*(1.5, minorante(1.5)), SE);

pen thin=linewidth(0.5*linewidth())+gray+dotted;
pen thin2=linewidth(0.5*linewidth())+gray+dashed;

xaxis("$x$", xmin=0, xmax=10, new void(picture p, axisT a){ YEquals(5)(p,a); YEquals(0)(p,a); }, LeftTicks(begin=true,end=true,extend=true,ptick=thin,pTick=thin2));
yaxis("", ymin=0, ymax=2, LeftRight, RightTicks(begin=true,end=true,extend=true,ptick=thin,pTick=thin2));
