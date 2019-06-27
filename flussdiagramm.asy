include "asy-common.asy";
import flowchart;

block bed = diamond("Bedingung",(0,0));
block io = parallelogram("Ein-/Ausgabe", (-20,-10));
block ord = rectangle("Anweisung", (20,-10));
block end=circle("Ende",(0,-20));

draw(bed);
draw(io);
draw(ord);
draw(end);

add(new void(picture pic, transform t) {
    blockconnector operator --=blockconnector(pic,t);
    bed--Label("Wahr",0.5,NE)--Right--Down--Arrow--ord;
    bed--Label("Falsch",0.5,NW)--Left--Down--Arrow--io;
    ord--Down--Left--Arrow--end;
    io--Down--Right--Arrow--end;
  });
