import unicode;

usepackage("color");
locale("en_US");

texpreamble("\definecolor{ttblue}{RGB}{26,97,169}");
texpreamble("\definecolor{gray}{rgb}{0.5,0.5,0.5}");
texpreamble("\usepackage{tgpagella}");

pen ttblue = rgb(26/255,97/255,169/255);
//pen gray = rgb(0.5,0.5,0.5);

unitsize( 1mm );

real pagewidth = 148;
real pageheight = 210;

defaultpen(fontsize(9));

path picbox(picture p) {
    return box(min(p,true)/1mm, max(p,true)/1mm);
}

pair picctr(picture p) {
    return (min(p,true) + max(p,true));
}