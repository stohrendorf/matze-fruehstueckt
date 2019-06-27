include "asy-common.asy";
import fancytree;

BubbleTree root = BubbleTree(""); // Wurzel

BubbleTree n01 = root.add("");
BubbleTree n02 = root.add("");

BubbleTree n11 = n01.add(""); // inn.~Knoten
BubbleTree n12 = n01.add("");
BubbleTree n13 = n01.add("");

BubbleTree n21 = n11.add("");
BubbleTree n22 = n11.add("");

BubbleTree n31 = n22.add("");
BubbleTree n32 = n22.add(""); // blatt

draw(root);

root.annotate("Wurzel", W);
n11.annotate("Innerer Knoten", W);
n13.annotate("Blatt", S); 

label("Level 0", (72, 0));
label("Level 1", (72, -10));
label("Level 2", (72, -20));
label("Level 3", (72, -30));
label("Level 4", (72, -40));
