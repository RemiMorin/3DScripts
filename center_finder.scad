
difference(){
    union(){
        hull(){
            translate([45,0,0]) cylinder(r=15,h=10);
            translate([-45,0,0]) cylinder(r=15,h=10);
        }
        translate([50,0,0]) cylinder(r=10,h=30);
        translate([-50,0,0]) cylinder(r=10,h=30);
    }
    translate([0,0,-1]) cylinder(r2=0.5,r1=10,h=12);
}