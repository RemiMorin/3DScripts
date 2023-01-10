$fn=20;
difference(){
    hull(){
        rotate([0,90,0]) cylinder(r=5, h=10, center = true);
        translate([0,15,0]) cylinder(r=5, h=10, center = true);
    }
    hull(){
        rotate([0,90,0]) cylinder(r=3, h=12, center = true);
        translate([0,3,2.75]) cube([12,6,0.5],center=true);
    }
    translate([0,15,0]) rotate([0,90,0]) hull(){
        cylinder(r=3, h=12, center = true);
        translate([0,10,0]) cube([6,6,12], center = true);
    }
    translate([0,8,4.5]) cylinder(r=4, h=10);
    translate([0,8,0]) cylinder(r=1.5, h=12,center=true);
    translate([0,15,2.75]) cube([12,30,0.5],center=true);
}