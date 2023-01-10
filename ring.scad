$fn=60;
difference(){
    cylinder(r=15,h=5);
    translate([0,0,1.5]) difference() {
        cylinder(r=16,h=2);
        translate([0,0,-1]) cylinder(r=13,h=5);
    }
    translate([0,0,-1]) cylinder(r=10,h=7);
    
}