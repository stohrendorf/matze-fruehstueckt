include "asy-common.asy";

picture drawNode(string title, string elems) {
    picture pic = currentpicture.copy();
    label(pic, "\begin{tabular}{l}
        \hfil\textbf{" + title + "}\hfil \\
        \hline
        " + elems + "
    \end{tabular}", (0,0));
    add(pic, bbox(pic));
    return pic;
}

picture n0 = shift(0,25) * drawNode("List", "head : ListNode");
picture n1 = shift(0,10) * drawNode("ListNode", "next : ListNode\\data : T");
picture n2 = shift(40,10) * drawNode("ListNode", "next : ListNode\\data : T");
picture n3 = shift(80,10) * drawNode("ListNode", "next : ListNode\\data : T");

add(n0);
add(n1);
add(n2);
add(n3);

draw(truepoint(n0,S,user=true)--truepoint(n1,N,user=true), EndArrow);
draw(truepoint(n1,E,user=true)--truepoint(n2,W,user=true), EndArrow);
draw(truepoint(n2,E,user=true)--truepoint(n3,W,user=true), EndArrow);

pair p1 = truepoint(n3,S,user=true);
pair p4 = truepoint(n1,S,user=true);

real z = min(p1.y,p4.y) - 5;
draw(p1--(p1.x,z)--(p4.x,z)--p4, dashed, EndArrow);
label("(zirkulär)", ((p1.x+p4.x)/2, z), Fill(white));
