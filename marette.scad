

difference(){
    union(){
        translate([-15,0,0]) cube([30,50,2.5]);
        difference(){
            union(){
                translate([-11.5,0,2]) cube([8,50,4]);
                translate([3.5,0,2]) cube([8,50,4]);
            }
            
            translate([0,0,10]) rotate([-60,0,0]) translate([-50,0,0]) cube([100,100,100]);
        }
        translate([0,47,0]) rotate([0,0,180]) difference(){
            union(){
                translate([-11.5,0,2]) cube([8,50,4]);
                translate([3.5,0,2]) cube([8,50,4]);
            }
            
            translate([0,0,10]) rotate([-60,0,0]) translate([-50,0,0]) cube([100,100,100]);
        }   
    }
    translate([0,25,-1]) cylinder(h=20,r=3.2,$fn=20);
    translate([10,40,-1]) cylinder(h=20,r=3.2,$fn=20);
    translate([-10,40,-1]) cylinder(h=20,r=3.2,$fn=20);
    translate([10,40,2.49]) cylinder(h=10,r=6,$fn=20);
    translate([-10,40,2.49]) cylinder(h=10,r=6,$fn=20);
}

translate([-40,0,0]) union(){
    difference(){
        union(){
            difference(){
                translate([-15,0,0]) cube([30,50,10]);
                union(){
                    translate([-12.5,-2.5,2]) cube([10,50,10]);
                    translate([2.5,-2.5,2]) cube([10,50,10]);
                }
            }
            translate([0,25,0]) cylinder(h=10,r=5.8,$fn=20);
            translate([10,40,0]) cylinder(h=10,r=5.8,$fn=20);
            translate([-10,40,0]) cylinder(h=10,r=5.8,$fn=20);
        }
        translate([0,25,-1]) cylinder(h=20,r=3.2,$fn=20);
        translate([10,40,-1]) cylinder(h=20,r=3.2,$fn=20);
        translate([-10,40,-1]) cylinder(h=20,r=3.2,$fn=20);
    }
    translate([15,1,4]) rotate([0,-90,0])
        difference(){
            hull(){
                translate([0,3,0]) cylinder(h=30,r=1,$fn=20);
                cylinder(h=30,r=1,$fn=20);
                translate([-3,-1,0]) cube([2,5,30]);
            }
            translate([1,1.5,-1]) cylinder(h=32,r=1,$fn=20);
            
        }
}