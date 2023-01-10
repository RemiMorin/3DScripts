largeur=60;
longueur=100;
hauteur=60;
offset_penture=30;
rayon_penture=10;
rayon_goupille=2;
rayon_enligneur=10;


module corps(largeur=60,longueur=100,hauteur=60,
offset_penture=30,rayon_penture=10,rayon_goupille=2)
{
    difference(){
        hull(){
            translate([0,-largeur/2,0]) cube([longueur,largeur,hauteur]);
            translate([longueur+offset_penture,0,0]) 
                cylinder(hauteur,r=rayon_penture);
            
        }
        translate([longueur+offset_penture,0,-1]) 
            cylinder(hauteur+2,r=rayon_goupille);
    }
}    
 
module masquePentureGauche(longueur,largeur,hauteur,position){
    translate(position){
        translate([0,0,-1]) 
            cube([longueur+1,largeur+2,(hauteur/4)+1]);
        translate([0,0,(hauteur/2)])
            cube([longueur+1,largeur+2,(hauteur/4)]);
        difference(){
        translate([0,largeur/2+1,-1]) cube([longueur+1,largeur/2+1,hauteur+2]);
        translate([offset_penture,largeur/2+1,-2]) 
                cylinder(hauteur+4,r=rayon_penture+1);
        }
    }
}

module masquePentureDroite(longueur,largeur,hauteur,position){
        rotate([180,0,0]) translate([0,0,-hauteur]) masquePentureGauche(longueur,largeur,hauteur,position);
    }

    //corps();
module masqueMoule(){
    union(){
        translate([-1,0,-1]) cube([longueur+2,largeur,hauteur+2]);
        sphere(rayon_enligneur);
        translate([0,0,hauteur])sphere(rayon_enligneur);
        translate([longueur-rayon_enligneur,0,hauteur])sphere(rayon_enligneur);
        translate([longueur-rayon_enligneur,0,0])sphere(rayon_enligneur);
        
    }
}
module mouleGauche(){
    difference(){
        corps();
        masqueMoule();
        masquePentureGauche(offset_penture+rayon_penture,largeur,hauteur,[longueur,-largeur/2-1,0]);
        }
    }
module mouleDroit(){
    difference(){
        corps();
        difference(){
                   translate([-2,-largeur,-2]) cube([longueur+4,largeur,hauteur+4]);
                   masqueMoule();
 
            }
        masquePentureDroite(offset_penture+rayon_penture,largeur,hauteur,[longueur,-largeur/2-1,0]);
    }
}
render(6) color("red") mouleGauche();
translate([0,10,0]) mouleDroit();
//masquePentureGauche(offset_penture+rayon_penture,largeur,hauteur,[0,0,0]);