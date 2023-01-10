$fn=20;
module panneau(){
    translate([0,-170,3.5])rotate([0,-90,0]) difference(){
        translate([-10,0,-55.5])cube([10,340,400]);
        translate([-3.5,55.5,0])cube([10,229,300]);
    }
}
module vis(){
    hull(){
        translate([0,0,30])  cylinder(r1=6,r2=6,h=1);
        translate([0,0,-4])  cylinder(r1=2,r2=6,h=5);
    }
    translate([0,0,-104])  cylinder(r=2.5,h=101);
}


module support(overlap = true){
    difference(){
    hull(){
        translate([5,20,21]) sphere(r=3);
        translate([5,-20,21]) sphere(r=3);
        translate([-10,20,0]) sphere(r=3);
        translate([-10,-20,0]) sphere(r=3);
        translate([30,20,10]) sphere(r=3);
        translate([30,-20,10]) sphere(r=3);
        translate([30,20,0]) sphere(r=3);
        translate([30,-20,0]) sphere(r=3);
        translate([-30,20,21]) sphere(r=3);
        translate([-30,-20,21]) sphere(r=3);
    }
    if(overlap){
        panneau();
    } else {
        translate([-150,-150,-10]) cube([300,300,10]);
        }
    hull(){
        translate([-8,30,11]) sphere(r=3);
        translate([-8,-30,11]) sphere(r=3);
        translate([-8,30,-5]) sphere(r=3);
        translate([-8,-30,-5]) sphere(r=3);

        translate([-50,0,0]) cube([1,66,28],center=true);
    }
    translate([25,13,11]) vis();
    translate([25,-13,11]) vis();
    translate([8,13,18]) vis();
    translate([8,-13,18]) vis();
    translate([16.5,0,15]) vis();
}
    }

rotate([90,0,0]) support(false);
//panneau();
    