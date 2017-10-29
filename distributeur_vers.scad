$fn=400;
rayon_haut=40;
rayon_bas=20;
epaisseur=2;
hauteur=60;
difference(){
    union(){
        cylinder(h=hauteur,r2=rayon_haut,r1=rayon_bas);
        for(i=[0:90:359]){
            rotate([0,0,i]) difference(){ 
                cube([rayon_haut*1.5,epaisseur,hauteur/2]);
                translate([rayon_haut*1.5,0,rayon_haut*1.5]) rotate([0,45,0]) cube([100,100,100], center=true);
            }
        }
    }
    union(){
        translate([0,0,-1])cylinder(h=hauteur+2,r2=rayon_haut-epaisseur,r1=rayon_bas-epaisseur);
        for(i = [15:30:179]){
            rotate([0,0,i]) translate([0,50,1]) rotate([90,0,0]) cylinder(h=100,r=3);
        }
    }
}