
tolerance=0.5;
$fn=30;
channel_width=2.5+tolerance;

module bloc(){
    translate([0,2,0]) difference(){
        cubeArrondi(10,20,35,2);
        translate([3,5,35-8]) hull(){
            cylinder(r=channel_width,h=10);
            translate([-5,0,0])cylinder(r=channel_width,h=10);
        }
        translate([6.5,5,2]) rotate([0,90,0]) cylinder(r=5,h=10);
        
        translate([6,14,8]) rotate([0,90,0]) cylinder(r1=2,r2=6,h=5);
        translate([-1,14,8]) rotate([0,90,0]) cylinder(r=2,h=15);

        translate([6,14,20]) rotate([0,90,0]) cylinder(r1=2,r2=6,h=5);
        translate([-1,14,20]) rotate([0,90,0]) cylinder(r=2,h=15);
    }
}
module cubeArrondi(x,y,z,radius){
    hull(){
    translate([x-radius,radius,radius]) sphere(radius);
    translate([x-radius,y-radius,radius]) sphere(radius);
    translate([x-radius,y-radius,z-radius]) sphere(radius);
    translate([x-radius,radius,z-radius]) sphere(radius);
    cube([1,y,z]);
    }
}
        


bloc();
mirror([0,1,0]) bloc();
