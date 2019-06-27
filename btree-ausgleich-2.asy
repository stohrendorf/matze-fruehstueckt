include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("");

BubbleTree n10 = root.add("");
BubbleTree n11 = root.add("$\langle 25 \rangle$");
BubbleTree n12 = root.add("38");
BubbleTree n13 = root.add("42");

n10.add("");
n10.add("10");
n10.add("20");

n11.add("");
n11.add("$\langle 30 \rangle$");
n11.add("34");

n12.add("");
n12.add("40");
n12.add("41");

n13.add("");
n13.add("44");
n13.add("50");
n13.add("56");

drawBTree(root);
