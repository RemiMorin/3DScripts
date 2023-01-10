largeur_board=36;
longueur_board=80;
largeur_ecran=24;
longueur_ecran=71;
tolerance=0.5;
thickness=15;

keyboardx=70;
keyboardy=76;
windowKeyX=64;
windowKeyY=70;

//min 11mm 
$fn=30;

module keyboardHole(){
    translate([15,50,10]) cube([keyboardx,keyboardy,2]);
    translate([18,53,11]) cube([windowKeyX,windowKeyY,10]);
    hull(){
        translate([15,126,10]) rotate([-30,0,0]) 
            cube([keyboardx,keyboardy,2]);
        translate([15,126,11]) rotate([0,90,0]) cylinder(r=1,h=keyboardx);
    }
}
module screenHole(){
        cube([longueur_board+tolerance,largeur_board+tolerance,5]);
    translate([4.5,7,2]) 
        cube([longueur_ecran+tolerance,largeur_ecran+tolerance,thickness]);
    screw_offset= 0.75+1.5+tolerance;
    translate([screw_offset,screw_offset,0]) 
        cylinder(r=1,h=14);
    translate([longueur_board-screw_offset,screw_offset,0]) 
        cylinder(r=1,h=14);
    translate([longueur_board-screw_offset,largeur_board-screw_offset,0]) 
        cylinder(r=1,h=14);
    translate([screw_offset,largeur_board-screw_offset,0]) 
        cylinder(r=1,h=14);
}
difference(){
    cube([100,150,thickness]);
    translate([9.5,5,-1]) screenHole();
    keyboardHole();

    translate([5,5,-1]) cylinder(r=1,h=17);
    translate([95,5,-1]) cylinder(r=1,h=17);
    translate([95,145,-1]) cylinder(r=1,h=17);
    translate([5,145,-1]) cylinder(r=1,h=17);
    translate([5,75,-1]) cylinder(r=1,h=17);
    translate([95,75,-1]) cylinder(r=1,h=17);

    translate([5,5,12]) cylinder(r=3,h=17);
    translate([95,5,12]) cylinder(r=3,h=17);
    translate([95,145,12]) cylinder(r=3,h=17);
    translate([5,145,12]) cylinder(r=3,h=17);
    translate([5,75,12]) cylinder(r=3,h=17);
    translate([95,75,12]) cylinder(r=3,h=17);
}

