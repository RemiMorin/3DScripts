profondeur = 18;
largeur = 78;
marge=5;
position_support=40;
difference(){
    union(){
        cube([profondeur+3.2,largeur+3.2,100],center=true);
        translate([0,0,-position_support]) rotate([0,0,90]) for( i=[0:6.5:10]){
             hull(){
               translate([-5+i,profondeur,0]) rotate([0,90,0]) cylinder(h=3.25,r=5.25); 
               translate([-5+i,0,0]) rotate([0,90,0]) cylinder(h=3.25,r=7);
             }
        }
    
    }
    union(){
        translate([0,0,1.6]) cube([profondeur,largeur,100],center=true);
        translate([profondeur/2,0,2+marge]) cube([profondeur-marge*2,largeur-marge*2,100],center=true);
        translate([-profondeur,0,-position_support]) rotate([0,90,90]) cylinder(h=100,r=2.5,center=true);
        hull(){
            translate([0,20,0]) cylinder(h=150,r=5,center=true);
            translate([0,-20,0]) cylinder(h=150,r=5,center=true);
        }
    }
}

