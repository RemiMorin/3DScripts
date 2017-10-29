$fn=100;
difference(){
    union(){
        for( i=[0:6.5:16]){
             hull(){
               translate([-8+i,20,0]) rotate([0,90,0]) cylinder(h=3,r=5.25); 
               translate([-8+i,0,0]) rotate([0,90,0]) cylinder(h=3,r=7);
             }
        }
        for( i=[0:6.5:10]){
             hull(){
               translate([-4.75+i,-20,0]) rotate([0,90,0]) cylinder(h=3,r=5.25); 
               translate([-4.75+i,0,0]) rotate([0,90,0]) cylinder(h=3,r=7);
             }
        }
        rotate([0,90,0]) cylinder(h=16,r=7,center=true);
    }
    translate([0,-20,0]) rotate([90,0,90]) cylinder(h=100,r=2.5,center=true);
    translate([0,20,0]) rotate([90,0,90]) cylinder(h=100,r=2.5,center=true);
}