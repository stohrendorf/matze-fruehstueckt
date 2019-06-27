include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("", fill = green);

BubbleTree n11 = root.add("", fill=ttblue);
BubbleTree n12 = root.add("");

BubbleTree n21 = n11.add("");
BubbleTree n22 = n11.add("", fill=red);

BubbleTree n31 = n22.add("");
BubbleTree n32 = n22.add("");

draw(root);

root.annotate("$b=2$", W);
n11.annotate("$b=-1$", W);
n22.annotate("$b=0$", E);

n11.lineTo(n31, dashed+gray);

pair mid = root.relPos(currentpicture, n21.pos+n22.pos)/2;
draw(arc(mid, 5, 140, 40, CW), BeginArrow);
