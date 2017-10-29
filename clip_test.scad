$fn=20;
epaisseur=3;
largeur = 10;
longueur = 30;

difference(){
    union(){
        cylinder(h=epaisseur,r=largeur/2);
        translate([0,-largeur/2,0]) cube([longueur-largeur/2,largeur,epaisseur]);
    }

    union(){
        translate([0,0,epaisseur/2]) rotate([0,0,90])
            rotate_extrude(angle = 180, convexity = 10) {
                translate([largeur/2-1.2,0,0]) circle(r=1);
            }
        translate([0,largeur/2-1.2,epaisseur/2]) rotate([0,90,0]) cylinder(longueur,r=1);
        translate([0,-largeur/2+1.2,epaisseur/2]) rotate([0,90,0]) cylinder(longueur,r=1);
        
        difference(){    
            translate([-6,0,0]) cube([10,1,10],center=true);
            translate([0,0,epaisseur/2]) rotate([0,0,90])
                rotate_extrude(angle = 180, convexity = 10) {
                    translate([largeur/2-1.2,0,0]) circle(r=1.4);
                }
            }
     }
 }