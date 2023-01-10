
$fn=30;

module torus(external_radius,internal_radius){
    circle_radius = (external_radius-internal_radius)/2;
    rotate_extrude(angle = 360, convexity = 2) 
        translate([internal_radius+circle_radius,0,0]) circle(r=circle_radius);
}
module ring(){
    difference(){
        cylinder(r=7,h=16);
        translate([0,0,-1]) cylinder(r=5,h=22);
        hull(){
            translate([0,0,-2]) cylinder(r=7,h=1);
            translate([0,0,2]) cylinder(r=5,h=1);
        }
    }
    translate([0,0,16]) torus(7,5);
}

module rope_insert(){
    difference(){
        union(){
            cylinder(r=4.7,h=20);
            hull(){
                translate([0,0,19]) 
                    cylinder(r=7,h=1);
                translate([0,0,14]) 
                    cylinder(r=4.5,h=1);

                translate([3.5,0,30]) 
                    rotate([0,90,0]) 
                    cylinder(r=6,h=3.5);
            }
        }
        translate([0,0,-1]) cylinder(r=3.5,h=40);
        translate([0,0,8]) cube([5,10,7],center=true);
        hull(){
            translate([0,0,25]) cylinder(r=3.5,h=1);
            translate([0,0,38])cube([7,7,20],center=true);
        }
        translate([0,0,30]) rotate([0,90,0]) cylinder(r=1.75,h=10);
    }
    translate([0,3.75,4.5]) flap();
    translate([0,-3.75,4.5]) flap();
}
module flap(){
    hull(){
        translate([0,0,6]) cube([4,4,1],center=true);
        translate([0,0,0.5]) cube([4,0.75,2],center=true);
    }
}

        translate([0,15,0])  rope_insert();
        ring();
