$fn=30;
wheel_width = 7;

module body(){
    translate([0,0,0]) rotate([0,90,0]){
        difference(){
            hull(){
                cylinder(r=wheel_width+2.5,h=7,center=true);
                translate([0,10,0]) cube([(wheel_width+2.5)*2,5,7],center=true);
            }
            cylinder(r=5,h=9,center=true);
            cylinder(r=wheel_width+0.5,h=5,center=true);
            translate([ (wheel_width-1),0,0]) rotate([-90,0,0]) cylinder(r=0.5,h=100);
            translate([-(wheel_width-1),0,0]) rotate([-90,0,0]) cylinder(r=0.5,h=100);
            
        }
    }    
}
module roue(){
    rotate([0,90,0]){
        difference(){
            union(){
                cylinder(r=wheel_width,h=4,center=true);
                cylinder(r=4.5,h=7,center=true);
            }
            difference(){
                cylinder(r=wheel_width+1,h=2,center=true);
                cylinder(r=wheel_width-1,h=3,center=true);
            }
            cylinder(r=0.5,h=20);
        }
    }
}


difference(){
    union(){
    body();
    roue();
    }
    translate([0,-100,0])cube([200,200,200]);
}
