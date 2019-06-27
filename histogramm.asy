include "asy-common.asy";
import graph;
import stats;

scale(Linear(10), Linear(100));

int n=100;
real[] a=new real[n];
for(int i=0; i < n; ++i) a[i]=Gaussrand();

histogram(a,min(a),max(a),10,normalize=true,low=0,lightgray,black,bars=true);

xaxis(Bottom);
yaxis(Left);

