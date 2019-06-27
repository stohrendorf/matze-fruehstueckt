include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("");

BubbleTree n10 = root.add("");
BubbleTree n11 = root.add("30");
BubbleTree n12 = root.add("38");
BubbleTree n13 = root.add("42");

n10.add("");
n10.add("10");
n10.add("20");
n10.add("25");

n11.add("");
n11.add("32");
n11.add("34");

n12.add("");
n12.add("40");
n12.add("41");

n13.add("");
n13.add("44");
n13.add("50");
n13.add("$\langle 56 \rangle$");
n13.add("58");
n13.add("60");

drawBTree(root);

pair p1 = n13.top();
pair p4 = root.right();
pair p2 = (p1.x,p4.y-1mm);
pair p3 = (p1.x-1mm,p4.y);
draw(p1--p2{up}..{left}p3--p4, dashed+gray, EndArrow);
