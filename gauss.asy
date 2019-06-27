include "asy-common.asy";
import graph;
import stats;

scale(Linear(10), Linear(100));

draw(graph(Gaussian,-3,3));

pen thin=linewidth(0.5*linewidth())+gray+dotted;
pen thin2=linewidth(0.5*linewidth())+gray+dashed;

xaxis(BottomTop,LeftTicks(begin=false,end=false,extend=true,ptick=thin,pTick=thin2));
yaxis(LeftRight,RightTicks(begin=false,end=false,extend=true,ptick=thin,pTick=thin2));
