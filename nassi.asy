struct NassiNode {
    pair pos;
    string text;
    
    pair relPos(picture pic, pair p = this.pos) {
        real xs = pic.xunitsize==0 ? 1 : pic.xunitsize;
        real ys = pic.yunitsize==0 ? 1 : pic.yunitsize;
        return scale(1/xs,1/ys)*p;
    }
};