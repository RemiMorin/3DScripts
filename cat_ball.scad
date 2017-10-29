
$fn=100;
union(){
difference(){
    sphere(r=40);
    sphere(r=30);
    translate([0,-22,0]) cylinder(r=10,h=100);
    //translate([0,0,-50]) cube([100,100,100]);
}
for( i=[0,90]) rotate([0,0,i])
    hull(){
        cylinder(r=3,h=75,center=true);
        translate([10,0,0]) cylinder(r=1,h=70,center=true);
        translate([-10,0,0]) cylinder(r=1,h=70,center=true);
    }
}