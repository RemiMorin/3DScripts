
$fn=30;

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

module fixture(tolerance=0,tower_height=35,cannelure=2,angle=36,reference_radius=9){
    for(i = [0:angle:360]){
        rotate([0,0,i]) translate([reference_radius,0,-1]) cylinder(r=cannelure+tolerance,h=tower_height-7);
        }
    translate([0,0,-1]) cylinder(r=reference_radius+tolerance,h=tower_height-7);
    translate([0,0,tower_height-9]) cylinder(r1=reference_radius-1+tolerance,r2=3+tolerance,h=9+tolerance);
    }

    
module tablette(){
    difference(){ 
       union(){
            //%translate([-40,-10,0]) cube([80,30,12]);

           hull(){
            translate([0,-16,12]) rotate([0,90,0]) 
                cylinder(r=2,h=86,center=true);
            translate([0,-5,3]) rotate([0,90,0]) 
                cylinder(r=3,h=86,center=true);
            translate([0,13,1]) rotate([0,90,0]) 
                cylinder(r=3,h=86,center=true);
            translate([0,17,5]) rotate([0,90,0]) 
                cylinder(r=3,h=86,center=true);
           }
           translate([-43,0,5]) cube([86,20,125]);

        }
        translate([50,-4,12]) rotate([0,-90,0]) hull(){
            translate([-4,6,0])cylinder(r=4,h=100);
            translate([0,-10,0]) cube([150,20,100]);
        }
    }
}
module screw_hole(){
    translate([0,0,0]) 
        rotate([90,0,0]) 
        cylinder(r=4,h=100, center=true);
    translate([0,25,0]) 
        rotate([90,0,0]) 
        cylinder(r=8,h=15,center=true);
    translate([0,-25,0]) 
        rotate([90,0,0]) 
        cylinder(r=8,h=15,center=true);    
    }
module pillar(){
    difference(){
        translate([0,0,30]) rotate([90,0,0]){
            translate([0,0,12]) rotate([0,0,12]) angle_lock();
            translate([0,0,-12]) rotate([0,180,0]) angle_lock();
            hull(){
                cylinder(r=15,h=24,center=true);
                translate([0,-40,0]) cube([30,1,24],center=true);
            }
        }
        translate([0,0,-25]) fixture(0.5,50);
        translate([0,0,30]) screw_hole();

    }
}

module support(){
    difference(){
        tablette();
        translate([27,0,30]) cube([40,40,20]);
        translate([-67,0,30]) cube([40,40,20]);
        translate([27,0,80]) cube([40,40,20]);
        translate([-67,0,80]) cube([40,40,20]);
        translate([35,13.5,14]) cylinder(r=3.5,h=200);
        translate([-35,13.5,14]) cylinder(r=3.5,h=200);
        for( i = [-18:12:18]){
            //devrait etre translate([i-5.5,7,5])
            translate([i-6,7,5]) cube([11,3.25,200]);
            translate([i,8.5,0]) cylinder(r=1.5,h=25,center=true);
        }
        translate([27,5.5,12]) cube([17,16,6]);
        translate([-44,5.5,12]) cube([17,16,6]);

        translate([31.5,10,110]) cube([10,7,6]);
        translate([-38.5,10,110]) cube([7,7,6]);

        translate([27,5.5,114]) cube([17,16,20]);
        translate([-44,5.5,114]) cube([17,16,20]);
    }
}
module bras(){
    difference(){
        union(){
            
            translate([40,0,21]) cylinder(r=1,h=18);

            hull(){
                translate([35,15,21]) cylinder(r=6,h=18);
                translate([35,30,21]) cylinder(r=6,h=18);
            }
            hull(){
                translate([35,15,71]) cylinder(r=6,h=18);
                translate([35,30,71]) cylinder(r=6,h=18);
            }
            hull(){
                translate([35,30,20]) cylinder(r=6,h=70);
                translate([15,50,30]) intersection(){
                     scale([0.5,1,1]) sphere(r=15);
                     translate([20,20,0]) cube([40,40,40],center=true);
                }
            }
            translate([15,50,30]) difference(){
                rotate([0,90,0]) cylinder(r=15,h=10);
                translate([0,20,0]) cube([40,40,40],center=true);
               rotate([0,0,35]) translate([10,0,0]) cube([20,40,40],center=true);


            }
            translate([0,50,0]) rotate([0,0,90]){
                translate([0,-15,30]) rotate([-90,0,0]) angle_lock();
            }
        }
        translate([35,15,-10]) cylinder(r=3.5,h=200);
    }
}

module plate(){
    difference(){
        union(){
            translate([0,0,3]) hull(){
                for (i=[0:90:360]){
                    rotate([0,0,i+45]) 
                        translate([20,0,0]){ 
                            sphere(r=4);
                            translate([0,0,-4]) cylinder(r=4,h=1);
                        }
                                                
                }
            }
            fixture(0,40);
        }
        for (i=[0:90:360]){
            rotate([0,0,i+45]){ 
                translate([17,0,-11]) 
                    cylinder(r=2,h=20);
                translate([17,0,2]) 
                    cylinder(r=6,h=10);
            }
        }
        translate([0,0,-1]) cylinder(r=5.5, h=6, $fn=6);
        translate([0,0,-1]) cylinder(r=2.5,h=35);
        translate([0,0,33]) cylinder(r=4.25,h=50);
    }
}
module everything(){
    translate([0,48.5,-20]) rotate([0,0,90]) plate();

    difference(){
        union(){
            translate([0,-1.5,0]) bras();
            *translate([0,-1.5,0]) mirror([1,0,0]) bras();
            *translate([0,48.5,0]) rotate([0,0,90]) pillar();  
        }
        translate([0,50,30]) rotate([0,0,90]) screw_hole();
        //cube([100,100,100]);
    }
    translate([0,0,-10]) support();
}

difference(){
    everything();
    //translate([0,0,-100]) cube([100,100,200]);
}

//translate([-36,5,0]) cube([72,18,12]);
//translate([-36,5,0]) cube([72,18,12]);
*for( i = [-18:12:18]){
    //devrait etre translate([i-5.25,7,5])
    translate([i-5.75,7,0]) cube([10.5,2.75,10]);
}