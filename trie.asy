include "asy-common.asy";
import fancytree;

BubbleTree c = BubbleTree("c");

BubbleTree a = c.add("a");
a.add("m").add("p", fill=lightgray);
a.add("f").add("e", fill=lightgray);

BubbleTree h = c.add("h");
h.add("e").add("f", fill=lightgray);
h.add("i").add("p", fill=lightgray);
h.add("o").add("r", fill=lightgray);

BubbleTree o = c.add("o", fill=lightgray);
o.add("d").add("e", fill=lightgray);
o.add("l").add("a", fill=lightgray);
o.add("u").add("p", fill=lightgray);

draw(c);
