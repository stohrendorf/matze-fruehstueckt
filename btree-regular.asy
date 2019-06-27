include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree("", stretch=0.1, fill=lightgray);

BubbleTree n10 = root.add("", stretch=0.1, fill=lightgray);
BubbleTree n11 = root.add("30", stretch=0.1);
BubbleTree n12 = root.add("38", stretch=0.1);
BubbleTree n13 = root.add("42", stretch=0.1);

n10.add("", fill=lightgray);
n10.add("10", stretch=0.1);
n10.add("20", stretch=0.1);
n10.add("25", stretch=0.1);

n11.add("", fill=lightgray);
n11.add("32", stretch=0.1);
n11.add("34", stretch=0.1);

n12.add("", fill=lightgray);
n12.add("40", stretch=0.1);
n12.add("41", stretch=0.1);

n13.add("", fill=lightgray);
n13.add("44", stretch=0.1);
n13.add("50", stretch=0.1);
n13.add("56", stretch=0.1);

draw(root);
