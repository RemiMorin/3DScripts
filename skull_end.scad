
$fn=60;
difference(){
    union(){
        scale([0.5,0.5,0.5]){
            import("./include/celtic_skull.stl", convexity=3);
        }
        difference(){
            union(){
                translate([0,0,-20]) cylinder(r1=15,r2=25,h=20);
                translate([0,0,-1]) cylinder(r=25,h=4);
                translate([0,0,-7]) cylinder(r=15,h=20,center=true);
            }        
            translate([0,0,-50]) cylinder(r=11.5,h=50);
            steps = 360/20;
            for(i=[0:steps:359]){
                rotate([0,0,i]) translate([25,0,0]) sphere(r=4);
                rotate([0,0,i+(steps/2)]) translate([28,0,2]) sphere(r=6);
                rotate([0,0,i]) translate([23,0,-7]) sphere(r=4);
                rotate([0,0,i+(steps/2)]) translate([26,0,-3.5]) sphere(r=4);
            }
        }
        
        translate([0,0,-20]) cylinder(r2=8,r1=6,h=20);

    }
    translate([-50,-50,28.75-100]) cube([100,100,100]);
}