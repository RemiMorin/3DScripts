

module phone(){
    hull(){
        translate([0,-35,0]) cylinder(r=6,h=170);
        translate([0,35,0]) cylinder(r=6,h=170);
    }
}
 

module angle_lock(h=3,radius=15,steps=30){
    angle = 360/steps;
    points = [
        for(i=[0:angle:360-1])
            [cos(i)*radius,sin(i)*radius,-1],
        for(i=[0:angle:360-1])
            [cos(i)*radius,sin(i)*radius,h*((i/angle)%2)],[0,0,h/2]
    ];
    faces = [
        [for(i=[0:1:steps-1]) i],// bottom
        for(i=[0:1:steps-1]) 
                [i+steps,((i+1)%steps)+steps, (i+1)%steps,i],
        for(i=[0:1:steps-1])
           [ steps*2,((i+1)%steps)+steps,i+steps],// top

    ];
    polyhedron(points,faces,convexity=5);
}
module support(){
    largeur = 85;
    difference(){
        translate([-7.5,-largeur/2,0]) cube([16,largeur,120]);
        translate([0,0,4]) phone();
        cube([20,20,9],center=true);
        translate([0,-36,10]) cube([20,72,170]);
    }
}
module arm(){
    difference(){
        hull(){
            translate([-40,-15,15]) rotate([90,0,0]) cylinder(r=15,h=4  );
            translate([-9,-35,25]) cube([3,10,30]);
        }
        
    }
    
}
module screw_hole(){
    translate([0,0,0]) 
        rotate([90,0,0]) 
        cylinder(r=4,h=100, center=true);
    translate([0,25,0]) 
        rotate([90,0,0]) 
        cylinder(r=8,h=10,center=true);
    translate([0,-25,0]) 
        rotate([90,0,0]) 
        cylinder(r=8,h=10,center=true);    
    }
    
module full_support(){
    support();
    translate([-40,0,15]) rotate([90,0,0]){
        translate([0,0,-15]) 
            angle_lock();
        translate([0,0,15]) 
            rotate([0,180,0]) 
            angle_lock();
    }
    arm();
    mirror([0,1,0]) arm();
}
module tail_support(){
        translate([-20,0,-5]) difference(){ 
        rotate([0,8,0]) 
            translate([-15,-12,-100]) cube([15,24,100]);
        translate([-30,-13,-105]) cube([15,26,110]);
    }
}
module pillar(){
    difference(){
        translate([0,0,30]) rotate([90,0,0]){
            translate([0,0,12]) rotate([0,0,6]) angle_lock();
            translate([0,0,-12]) rotate([0,180,6]) angle_lock();
            hull(){
                cylinder(r=15,h=24,center=true);
                translate([0,-30,0]) cube([30,1,24],center=true);
            }
        }
        translate([0,0,-3]) fixture(0.5);
        translate([0,0,30]) screw_hole();

    }
}

module fixture(tolerance=0){
    for(i = [0:36:360]){
        rotate([0,0,i]) translate([8,0,-1]) cylinder(r=2+tolerance,h=21);
        }
    translate([0,0,-1]) cylinder(r=9+tolerance,h=21);
    translate([0,0,19]) cylinder(r1=8+tolerance,r2=1+tolerance,h=9+tolerance);
    
    }
module plate(){
    difference(){
        union(){
            hull(){
                for (i=[0:90:360]){
                    rotate([0,0,i+45]) 
                        translate([20,0,0]) 
                        sphere(r=4);
                }
            }
            fixture(0);
        }
        translate([-20,-20,-4])cube([40,40,4]);
        for (i=[0:90:360]){
            rotate([0,0,i+45]){ 
                translate([17,0,-1]) 
                    cylinder(r=2,h=10);
                translate([17,0,2]) 
                    cylinder(r=4,h=10);
            }
        }
    }
}

module magnet(h=2.75,l=59,t=9.75,tolerance=0.5){
    cube([h+tolerance,l+tolerance,t+tolerance],center=true);
    }
    
* translate([0,0,-5]) union(){
    translate([0,0,5]) pillar();    
    plate();
}
  
translate([0,15,30]) rotate([90,0,0]) angle_lock();
translate([0,-15,30]) rotate([-90,0,0]) angle_lock();
difference(){
    hull(){
        translate([0,0,30]) 
            rotate([90,0,0]) cylinder(r=15,h=32,center=true);
        translate([25,0,40]) cube([20,90,80],center=true);
    }
    translate([0,0,50]) cube([35,30,140],center=true);
}
%translate([20,0,0]) difference(){    
    translate([0,-40,0]) cube([10,80,160]);
    for(i = [0:11]){    
     translate([2,0,10+i*13]) magnet(h=6);
    }
}
