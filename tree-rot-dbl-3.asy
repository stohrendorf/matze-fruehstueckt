include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("", fill = red);

BubbleTree n11 = root.add("", fill=ttblue);
BubbleTree n12 = root.add("", fill=green);

BubbleTree n21 = n11.add("");
BubbleTree n22 = n11.add("");

BubbleTree n31 = n12.add("");
BubbleTree n32 = n12.add("");

draw(root);
