

union(){
    difference(){
        union(){
             scale([0.9,1.1,0.9]){
                rotate([0,15,0]) translate([0,2,-6]) rotate([0,90,-2]) rotate([0,35,92]){
                    translate([-25,98,43]) import("./include/Bobcat_Jaw_Meshlab.stl", convexity=3);
                }
                translate([0,0,-10])
                rotate([0,-15,-1.5]) {
                     translate([0,-10,100])  rotate([88,0,-15]) import("./include/Bobcat_skull.stl", convexity=3);
                }
            }   
            //translate([18,0,0]) rotate([0,90,0]) cylinder(r=13,h=90,center=true);
        }
       // translate([20,0,0]) rotate([0,90,0]) cylinder(r=11.5,h=200,center=true);
        //rotate([90,0,0]) cylinder(r=11.5,h=200,center=true);
        //translate([0,0,50]) cylinder(r=11.5,h=100,center=true);
    }
   
}