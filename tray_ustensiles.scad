module bloc1(){
    difference(){
        union(){
            difference(){
                cube([160,160,5]);
                translate([38,92,-1]) cube([160,160,7]);
            }
            cube([160,5,10]);
            cube([5,160,10]);
            translate([33,87,0]) cube([5,75,40]);
            hull(){
                translate([33,87,0]) cube([5,5,40]);
                translate([155,87,0]) cube([5,5,60]);
            }
            translate([0,87,0]) cube([38,5,40]);
            translate([0,145,0]) cube([38,5,40]);

            translate([163,35,0]) cylinder(h=5,r=5);
            translate([163,75,0]) cylinder(h=5,r=5);
            translate([26,163,0]) cylinder(h=5,r=5);
        }
        translate([157,15,-1]) cylinder(h=7,r=6);
        translate([157,55,-1]) cylinder(h=7,r=6);
        translate([12,157,-1]) cylinder(h=7,r=6);
        translate([157,89,-1]) cube([5,5,122]);
        translate([31,160,-1]) cube([5,5,42]);

    }
}
module bloc2(){
    difference(){
        union(){
            translate([12,157,0]) cylinder(h=5,r=5);
            translate([0,161,0]) cube([38,129,5]);
            translate([33,161,0]) cube([5,129,40]);
            translate([0,190,0]) cube([38,5,40]);
            translate([0,240,0]) cube([38,5,40]);


        }
        translate([26,163,-1]) cylinder(h=7,r=6);
        translate([35,158,-1]) cube([5,5,42]);
    }
}
//bloc1();
bloc2();