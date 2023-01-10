
$fn=20;
module connectorPlate(){
    
    radius = 2.25;
    offset_x = (23.2-radius)/2; 
    offset_y = (22.8-radius) /2; 
    hull() for(i = [-1,1]) for (j=[-1,1]) {
        translate([i*offset_x,j*offset_y,2]) sphere(r=2.25);
    }
}
module circuitPlate(){
    translate([-10.5,0,0]) cube([21,24,1]);
    translate([-9.5,1,-3]) cube([19,26,20]);
    
    }
    
rotate([0,-90,0]) difference() {
    translate([-15,-14,0]) cube([30,28,35]);
    hull(){    
        connectorPlate();
    }
    translate([0,8,5]) rotate([90,0,0]) circuitPlate();
    translate([0,-50,-1]) cube([100,100,100]);
    cylinder(r=4,h=40);
    translate([0,-11,8])
        rotate([0,90,0])cylinder(r=1.5,h=40,center=true);
    translate([0,-11,30])
        rotate([0,90,0])cylinder(r=1.5,h=40,center=true);
    translate([0,11,17.5])
        rotate([0,90,0])cylinder(r=1.5,h=40,center=true);
}    
    
