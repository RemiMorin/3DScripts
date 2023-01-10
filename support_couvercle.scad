$fn=60;

module panneau(){
    difference(){
        translate([-10,0,-55.5])cube([10,340,400]);
        translate([-3.5,55.5,0])cube([10,229,300]);
    }
}
module couvercles(){
    translate([-4,170,114]) color("red") rotate([0,90,0])cylinder(r=215/2,h=15.5);
    translate([-4,170,90]) color("blue") rotate([0,90,0])cylinder(r=177/2,h=15.6);
}
module supportCouvercle(){
    height = 30;
    difference(){
        hull(){
            translate([15,70,-6]) cylinder(r=20,h=height);
            translate([0,25,-6]) cylinder(r=10,h=height);
            translate([8,-40,-6]) cylinder(r=20,h=height);
            translate([0,-25,-6]) cylinder(r=10,h=height);
            translate([10,25,10]) cylinder(r=10,h=10);
            translate([10,-25,10]) cylinder(r=10,h=10);
            translate([40,40,10]) cylinder(r=10,h=10);

        }
        translate([117,6,-16]) cylinder(r=110,h=height);
        translate([-84.2,48.8,0]) rotate([180,-90,45]) panneau();
            translate([-2,0,24]) vis();
    translate([2,40,24]) vis();
    translate([3,73,24]) vis();
    translate([15,82,24]) vis();
    translate([-3,-44,24]) vis();
    translate([8,-54,24]) vis();
    }

}
module vis(){
    translate([0,0,-4])  cylinder(r1=2,r2=6,h=5);
    translate([0,0,-104])  cylinder(r=2.5,h=101);
    }
*difference(){
    union(){
        translate([0,94,25]) rotate([90,-45,90]) supportCouvercle();
        //translate([0,247,25]) mirror([0,1,0]) rotate([90,-45,90]) supportCouvercle();
        couvercles();
       // panneau();
    }
   // translate([-50,0,0]) cube([100,100,100]);
}
supportCouvercle();
//panneau();