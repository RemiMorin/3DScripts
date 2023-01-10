$fn=30;

difference(){
    sphere(r=25);
    difference(){
        hull(){
            cylinder(r=15,h=6,center=true);
            rotate_extrude(angle=360) 
                translate([14.5,0]) 
                scale([3.5/5,1,1]) 
                circle(r=3);
        }
        translate([0,0,2]) cylinder(r=6,h=10);
    }
    cylinder(r=1.5,h=8,center=true);
    cylinder(r=0.5,h=15);
    translate([30,0,7]) cylinder(r=25,h=30);
    rotate([0,0,45]) difference(){
        cube([21,21,102],center=true);
        cube([20,20,100],center=true);
        }
    translate([-0.5,0,15]) rotate([0,90,0]) cylinder(r=0.5,h=6);

    translate([0,0,-52]) cube([100,100,100],center=true);
    //translate([0,-50,0]) cube([100,100,100],center=true);

}