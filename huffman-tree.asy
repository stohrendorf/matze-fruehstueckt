include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("13");

BubbleTree n = root.add("5");
BubbleTree x8 = root.add("8");

BubbleTree x5 = x8.add("5");
BubbleTree b = x8.add("3");

BubbleTree x3 = x5.add("3");
BubbleTree a = x5.add("2");

BubbleTree e = x3.add("1");
BubbleTree o = x3.add("2");

draw(root);

n.annotate("N",S);
b.annotate("B",S);
a.annotate("A",S);
o.annotate("O",S);
e.annotate("E",S);
