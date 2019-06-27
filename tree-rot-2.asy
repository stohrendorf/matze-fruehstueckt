include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("", fill = red); // Wurzel

BubbleTree n11 = root.add("");
BubbleTree n12 = root.add("", fill = ttblue);

BubbleTree n21 = n11.add("");
BubbleTree n22 = n12.add("");
BubbleTree n23 = n12.add("");

draw(root);
