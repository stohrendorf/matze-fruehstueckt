include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("");

BubbleTree n10 = root.add("");
BubbleTree n11 = root.add("30");
BubbleTree n12 = root.add("42");

n10.add("");
n10.add("10");
n10.add("20");
n10.add("25");

n11.add("");
n11.add("32");
n11.add("34");
n11.add("$\langle 38 \rangle$");
n11.add("41");

n12.add("");
n12.add("44");
n12.add("50");

drawBTree(root);
