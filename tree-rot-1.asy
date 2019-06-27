include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("", fill = ttblue); // Wurzel

BubbleTree n11 = root.add("", fill=red);
BubbleTree n12 = root.add("");

BubbleTree n21 = n11.add("");
BubbleTree n22 = n11.add("");

BubbleTree n31 = n21.add("");

draw(root);

root.annotate("$b=2$", W);
n11.annotate("$b=1$", W);

root.lineTo(n22, dashed+gray);

pair mid = root.relPos(currentpicture, n11.pos+n12.pos)/2;
draw(arc(mid, 5, 140, 40, CW), EndArrow);
