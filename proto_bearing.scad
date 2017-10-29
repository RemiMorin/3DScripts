
external_radius = 60;
internal_radius = external_radius-5;
bearing_radius = 10;
bearing_spacing = 0.2;
bearing_rotation_radius= (internal_radius-bearing_radius);


function closest_whole_divisor(n,x) = ( n%x == 0 ? x : closest_whole_divisor(n,x-1) );
$fn=60;
step = closest_whole_divisor(360, floor((2 * bearing_rotation_radius * PI) / ((bearing_radius*2)+bearing_spacing))) ;

difference(){
    cylinder(r=external_radius,h=10,Center=true);
    translate([0,0,-15]) cylinder(r=internal_radius,h=30,Center=true);
}



translate([0,0,-7]) difference(){
    cylinder(r=bearing_rotation_radius+2,h=2);
    translate([0,0,-1]) cylinder(r=bearing_rotation_radius-2,h=4);
    for(i = [0:360/step:359]){
        rotate([0,0,i]) translate([internal_radius-bearing_radius-bearing_spacing,0,-10]) 
        translate([0,0,3]) cylinder(r=1.5,h=10);
        }
}

for(i = [0:360/step:359]){
    rotate([0,0,i]) translate([internal_radius-bearing_radius-bearing_spacing,0,0]) 
        cylinder(r=bearing_radius,h=10,Center=true);
    rotate([0,0,i]) translate([internal_radius-bearing_radius-bearing_spacing,0,-5]) 
        cylinder(r1=1,r2=bearing_radius,h=5.1,Center=true);
    rotate([0,0,i]) translate([internal_radius-bearing_radius-bearing_spacing,0,-10]) 
        cylinder(r=1,h=10,Center=true);
}