$fn=20;

module clip() {
    difference(){
        union(){
            difference(){
                hull(){
                    rotate([0,90,0]) cylinder(r=5, h=10, center = true);
                    translate([0,15,0]) cylinder(r=5, h=10, center = true);
                }
                rotate([0,90,0]) hull(){
                     cylinder(r=3, h=12, center = true);
                    translate([0,20,0]) cube([6,6,12], center = true);
                }
            }
            translate([0,8,0]) cylinder(r=5, h=10,center=true);
        }

        //trou de vis
        translate([0,8,4.5]) cylinder(r=4, h=10);
        translate([0,8,0]) cylinder(r=1.5, h=12,center=true);
    }
}
module torus(torus_radius,body_radius){
rotate_extrude(angle = 360, convexity = 2) translate([torus_radius,0,0]) circle(r=body_radius);
}
module ring(height,hole_radius,thickness){
    half_thickness = (thickness/2);
    difference(){
        cylinder(
            r=(hole_radius+thickness),
            h=height-thickness,center = true);
        cylinder(r=hole_radius,h=height,center = true);
    }
    translate([0,0,(height/2)-half_thickness]) torus(hole_radius+half_thickness,half_thickness);
    translate([0,0,-((height/2)-half_thickness)]) torus(hole_radius+half_thickness,half_thickness);
}
module flap(width,thickness){
    half_thickness = (thickness/2);
    half_width = width/2;
     hull(){
        translate([0,15,0])torus(half_width-half_thickness,half_thickness);
        translate([half_width-half_thickness,0.01,0]) rotate([-90,0,0]) cylinder(r=half_thickness,h=1);
        translate([-(half_width-half_thickness),-0.01,0]) rotate([-90,0,0]) cylinder(r=half_thickness,h=1);
    }
}
    width = 10;
    thickness = 3;
    height = 14;
    length = 20;

    half_thickness = (thickness/2);
translate([0,0,width/2]) rotate([0,90,0]) difference(){


    union(){
        translate([0,0,height/2-half_thickness]) flap(width,thickness);
        translate([0,0,-(height/2-half_thickness)]) flap(width,thickness);
        difference(){
            rotate([0,90,0]) ring(width,height/2-thickness,thickness);
            translate([0,(length/2)+0.1,0]) cube([width+2,length,height+2],center=true);
        }
    }
    //trou de vis
    translate([0,8,height/2-0.5]) cylinder(r=(width-2)/2, h=10);
    translate([0,8,0]) cylinder(r=2, h=height+2,center=true);
}
translate([0,length+width/2,0]) difference(){
    cylinder(r=(width-2)/2, h=height-(thickness*2));
    translate([0,0,-1]) cylinder(r=2, h=height);

}