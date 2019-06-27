include "asy-common.asy";

Label l = Label("\textcolor{gray}{Übers\textcolor{ttblue}{i}cht}", (pagewidth/4,pageheight/2));
label(scale(10) * rotate(90) * l);

int line = 0;
int lineofs = 2;

void tocBlob(string s) {
	real wd = 10;
	real ht = 5;
	real skip = 5;
	real margin = 1;
	path blob = (-wd,0)--(0,0)--(0,ht)--(-wd,ht)--cycle;
	real ypos = pageheight-(line+lineofs)*(ht+skip);
	path dblob = shift( (pagewidth,ypos-ht/2) ) * blob;
	fill( dblob, black );
	Label l = Label("\sffamily\textbf{" + s + "}", (pagewidth-85,ypos), E);
	label(scale(1.3333) * l);
	Label l2 = Label("\sffamily\textbf{\uppercase\expandafter{\romannumeral " + string(line) + "}}", (pagewidth-wd+margin,ypos), E, rgb(1,1,1));
	label(scale(1.3333) * l2);
	++line;
}

draw((0,0)--(0,pageheight)--(pagewidth,pageheight)--(pagewidth,0)--cycle, rgb(1,1,1));
tocBlob("Vorwort und Inhalt");
tocBlob("Mathematische Grundlagen");
tocBlob("Lineare Algebra");
tocBlob("Analysis");
tocBlob("Stochastik");
tocBlob("IT Grundlagen und --Systeme");
tocBlob("Algorithmen und Datenstrukturen");
tocBlob("Anhang");
