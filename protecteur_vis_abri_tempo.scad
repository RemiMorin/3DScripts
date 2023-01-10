
hauteur=20;
rayon_vis=3.3;
ailes_width=5;
wings_span=15;
$fn=30;

difference(){
    hull(){
        translate([0,0,hauteur-(rayon_vis*3)]) sphere(r=rayon_vis*3);
        translate([0,0,-1])cylinder(r=rayon_vis*3,h=2);
        translate([wings_span-(ailes_width/2),0,-1]) 
            cylinder(r=ailes_width/2,h=hauteur/2+1);
        translate([-(wings_span-(ailes_width/2)),0,-1]) 
            cylinder(r=ailes_width/2,h=hauteur/2+1);
    }
    translate([0,0,-50]) cube([100,100,100],center=true);
    translate([0,0,-2]) cylinder(r=rayon_vis,h=hauteur-(rayon_vis*2)+2);
}