struct BubbleTree {
    BubbleTree parent;
    BubbleTree[] children;
    
    string text;
    pen fill;
    pen border;
    
    real stretch;
    real nodeDistance;
    real radius;
    real levelDistance;
    real labelDistance;
    
    pair pos;
    real height;
    real width;
    real[] labelOffsets;
    
    pair relPos(picture pic, pair p = this.pos) {
        real xs = pic.xunitsize==0 ? 1 : pic.xunitsize;
        real ys = pic.yunitsize==0 ? 1 : pic.yunitsize;
        return scale(1/xs,1/ys)*p;
    }
    
    bool isBTreeLeaf() {
        return this.children.length <= 1;
    }
    
    pair top(picture pic = currentpicture) {
        pair p = this.pos + (0, this.height/2);
        return this.relPos(pic, p);
    }
    
    pair bot(picture pic = currentpicture) {
        pair p = this.pos - (0, this.height/2);
        return this.relPos(pic, p);
    }
    
    pair right(picture pic = currentpicture) {
        pair p = this.pos + (this.width/2, 0);
        return this.relPos(pic, p);
    }
    
    pair left(picture pic = currentpicture) {
        pair p = this.pos - (this.width/2, 0);
        return this.relPos(pic, p);
    }
    
    void add(BubbleTree child) {
        child.parent = this;
        this.children.push( child );
    }
    
    void drawSelf(picture pic) {
        path circ = circle(this.pos, this.radius);
        if(this.fill != nullpen)
            fill(pic, circ, this.fill);
        draw(pic, circ, this.border);
        if(this.text != "")
            label(pic, this.text, this.pos);
    }
    
    void drawSelfAsBTree(picture pic) {
        // draw the labels
        picture tmp;
        // the first node is the lambda node
        this.labelOffsets.delete();
        for(int i=1; i<this.children.length; ++i) {
            real xpos = max(tmp).x + this.labelDistance;
            this.labelOffsets.push(xpos);
            label(tmp, this.children[i].text, xpos, E);
        }
        this.labelOffsets.push(max(tmp).x);
        this.labelOffsets[0] = min(tmp).x;
        // center tmp, then move to this.pos
        pair ctr = (max(tmp)+min(tmp))/2;
        for(int i=0; i<this.labelOffsets.length; ++i)
            this.labelOffsets[i] -= ctr.x;
        tmp = shift(this.pos) * shift(-ctr) * tmp;
        this.width = size(tmp).x;
        this.height = size(tmp).y;
        // fill the background
        pair mi = min(tmp);
        pair ma = max(tmp);
        path b = mi--(ma.x,mi.y)--ma--(mi.x,ma.y)--cycle;
        if(this.fill != nullpen)
            fill(pic, b, this.fill);
        add(pic, tmp);
        if(this.border != nullpen)
            draw(pic, b, this.border);
    }
    
    void operator init(BubbleTree parent, string text, real radius = -1, pen border = currentpen, pen fill = nullpen, real stretch = 1, real nodeDistance = -1, real levelDistance = -1, real labelDistance = -1 ) {
        pos = (0,0);
        this.text = text;
        this.fill = fill;
        this.border = border;
        this.stretch = stretch<0 ? parent.stretch : stretch;
        this.nodeDistance = nodeDistance<0 ? parent.nodeDistance : nodeDistance;
        this.radius = radius<0 ? parent.nodeDistance : nodeDistance;
        this.levelDistance = levelDistance<0 ? parent.levelDistance : levelDistance;
        this.labelDistance = labelDistance<0 ? parent.labelDistance : labelDistance;
        this.height = -1;
        parent.add( this );
    }
    
    void operator init(BubbleTree parent = null, string text, real radius = 0.3333cm, pen border = currentpen, pen fill = nullpen, real stretch = 1, real nodeDistance = 0.71cm, real levelDistance = 1cm, real labelDistance = 1mm ) {
        pos = (0,0);
        this.text = text;
        this.fill = fill;
        this.border = border;
        this.stretch = stretch;
        this.nodeDistance = nodeDistance;
        this.radius = radius;
        this.levelDistance = levelDistance;
        this.labelDistance = labelDistance;
        this.height = -1;
        if( parent != null ) {
            parent.add( this );
        }
    }
    
    BubbleTree add(string text, pen p = currentpen, pen fill = nullpen, real stretch = 1) {
        return BubbleTree(this, text, p, fill, stretch);
    }

    void move(pair p) {
        this.pos += p;
        for(BubbleTree n : this.children)
            n.move(p);
    }
    
    void lineTo(BubbleTree n, picture pic = currentpicture, pen p = currentpen) {
        path conn = this.pos--n.pos;
        real len = arclength(conn);
        real f1 = this.radius/len;
        real f2 = 1 - n.radius/len;
        pair delta = n.pos - this.pos;
        
        pair p1 = relpoint(conn, f1);
        pair p2 = relpoint(conn, f2);
        real xs = pic.xunitsize==0 ? 1 : pic.xunitsize;
        real ys = pic.yunitsize==0 ? 1 : pic.yunitsize;
        draw(pic, scale(1/xs,1/ys)*(p1--p2), p);
    }
    
    void lineTo(int selfIndex, BubbleTree n, picture pic = currentpicture, pen p = currentpen) {
        pair p1 = this.pos + (this.labelOffsets[selfIndex], -this.height/2);
        pair p2 = n.pos + (0, n.height/2);
        real xs = pic.xunitsize==0 ? 1 : pic.xunitsize;
        real ys = pic.yunitsize==0 ? 1 : pic.yunitsize;
        draw(pic, scale(1/xs,1/ys)*(p1--p2), p);
    }
    
    void draw( picture pic, real curStretch, real stretchFac ) {
        // post-order loop
        picture self;
    
        // 1) draw children, according to "this.stretch" and "this.nodeDistance" into "self"
        real xPos = 0; // the sum of all the nodes' widths and inter-node spaces
        real xMin = 0, xMax = 0;
        for( int i = 0; i < this.children.length; ++i ) {
            picture child;
            this.children[i].draw(child, curStretch*stretchFac, stretchFac);
            
            // normalize the X coordinate to 0 and shift down one level
            pair offset = -(min(child).x, this.levelDistance) + (xPos,0);
            this.children[i].move(offset);
            add(self, child, offset);
            xPos += size(child).x; // add the node's width
            if(i < this.children.length-1)
                xPos += this.stretch * this.nodeDistance * curStretch; // add level inter-node space
            if(i==0)
                xMin = this.children[i].pos.x;
            if(i==this.children.length-1)
                xMax = this.children[i].pos.x;
        }
        
        // 2) draw the root node
        this.pos = ((xMin+xMax)/2, 0);
        this.drawSelf(self);
        
        // 3) and the paths from the children to the root
        for(BubbleTree n : this.children)
            this.lineTo(n, self);
        
        add(pic, self);
    }
    
    void drawAsBTree( picture pic, real curStretch, real stretchFac ) {
        // post-order loop
        picture self;
    
        // 1) draw children, according to "this.stretch" and "this.nodeDistance" into "self"
        real xPos = 0; // the sum of all the nodes' widths and inter-node spaces
        real xMin = 0, xMax = 0;
        bool childSeen = false;
        for( int i = 0; i < this.children.length; ++i ) {
            if(this.children[i].isBTreeLeaf())
                continue;
            picture child;
            this.children[i].drawAsBTree(child, curStretch*stretchFac, stretchFac);
            
            // normalize the X coordinate to 0 and shift down one level
            pair offset = -(min(child).x, this.levelDistance) + (xPos,0);
            this.children[i].move(offset);
            add(self, child, offset);
            real w = size(child).x;
            xPos += w; // add the node's width
            xPos += this.stretch * this.nodeDistance * curStretch; // add level inter-node space
            if(xMin > this.children[i].pos.x-w/2)
                xMin = this.children[i].pos.x-w/2;
            if(xMax < this.children[i].pos.x+w/2)
                xMax = this.children[i].pos.x+w/2;
        }
        if(childSeen) {
            xPos -= this.stretch * this.nodeDistance * curStretch;
        }
        
        // 2) draw the root node
        this.pos = ((xMin+xMax)/2, 0);
        this.drawSelfAsBTree(self);
        
        // 3) and the paths from the children to the root
        for(int i=0; i<this.children.length; ++i) {
            BubbleTree n = this.children[i];
            if(n.children.length==0)
                continue;
            this.lineTo(i, n, self);
        }
        
        add(pic, self);
    }
    
    void annotate(picture pic = currentpicture, string text, pair dir = E) {
        pair rp = dir;
        rp *= this.radius;
        
        label(pic, text, this.relPos(pic, this.pos+rp), dir);
    }
}

void draw( picture dest = currentpicture, BubbleTree root, pair pos = (0,0), real stretchFac = 0.71 )
{
    picture pic;
    root.draw(pic, 1, stretchFac);
    root.move(pos);
    add(dest, pic, pos);
}


void drawBTree( picture dest = currentpicture, BubbleTree root, pair pos = (0,0), real stretchFac = 0.71 )
{
    picture pic;
    root.drawAsBTree(pic, 1, stretchFac);
    root.move(pos);
    add(dest, pic, pos);
}
