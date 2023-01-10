

moule_height=70;
moule_length=120;
moule_thickness=25;
moule_tolerance=0.5;
moule_handle_length=40;
alignment_tooth_height=8;

$fn=20;
$fa=5;


module penture(thickness=20, hole=6,height=70,tolerance=0.5,hinge_foot_height=60){
    large = (thickness+hinge_foot_height)*2;
    difference(){
            union(){
                cylinder(r=thickness/2,h=height);
                linear_extrude(height) polygon([
                    [(thickness/2),tolerance/2],
                    [-tolerance,(thickness/2)],
                    [thickness,hinge_foot_height],
                    [thickness,tolerance/2],
                
                ]);
            }
            for(i=[0:height/3:height-1]){
                    translate([-(large/2),-(large/2),i-tolerance]) cube([large,large,(height/6)+tolerance*2]);
                }
            translate([0,0,-tolerance]) cylinder(r=hole/2,h=height+(tolerance*2));
    }
    
}
module corps(height=70,length=100,thickness=40,tolerance=0.5,handle_length=50){
    translate([0,0,0]){
           difference(){
           union(){ 
                cube([length,thickness,height]);
                //translate([length-1,thickness-10,20]) cube([1+handle_length,10,height-40]);
                hull(){
                    translate([0,0,20]) cube([1,thickness,height-40]);
                    translate([handle_length+length-1-5,thickness-10,25]) 
                        rotate([-90,0,0]) cylinder(r=5,h=10);
                    translate([handle_length+length-1-5,thickness-10,height-25]) 
                        rotate([-90,0,0]) cylinder(r=5,h=10);
                }
            }
            translate([handle_length+length-1-7,thickness-10,height-27])
                rotate([-90,0,0]) vis();
            translate([handle_length+length-1-7,thickness-10,27])
                rotate([-90,0,0]) vis();
            translate([length+7,thickness-10,height-27])
                rotate([-90,0,0]) vis();
            translate([length+7,thickness-10,27])
                rotate([-90,0,0]) vis();
            translate([7,thickness-10,height-27])
                rotate([-90,0,0]) vis();
            translate([7,thickness-10,27])
                rotate([-90,0,0]) vis();
        }
    }
}
module vis(){
    hull(){
        cylinder(h=5,r=1.5);
        translate ([0,0,-40]) cylinder(h=40,r=5);
        }
        cylinder(h=100,r=1.5);
    }

module assemble(encave=false,height=70,length=100,thickness=40,tolerance=0.5,handle_length=50,tooth_height=15){
    if(encave){
        union(){
            translate([-19,0,0]) penture(20,6,height,0.25,thickness);
            corps(height,length,thickness,tolerance,handle_length);
            translate([40,0,10]) sphere(r=5);
            translate([40,0,height-10]) sphere(r=5);
            translate([108,0,6]) sphere(r=5);
            translate([108,0,height-6]) sphere(r=5);
        }
    } else {
        difference(){
            union(){
                translate([-19,0,0]) penture(20,6,height,0.25,thickness);
                corps(height,length,thickness,tolerance,handle_length);
            }
            translate([40,0,10]) sphere(r=5.25);
            translate([40,0,height-10]) sphere(r=5.25);
            translate([108,0,6]) sphere(r=5.25);
            translate([108,0,height-6]) sphere(r=5.25);

        }
    }
}
module alignment(height=15,tolerance=0.5,encave=false,tooth_end=100,tooth_length=20,tooth_radius=30){
    effective_tolerance = encave ? (tolerance/2) : -(tolerance/2);
    z_tolerance = encave ? tolerance : 0;
    intersection(){
        difference() {
            translate([0,0,-z_tolerance/2]) cylinder(r=tooth_end+effective_tolerance,h=height+z_tolerance);
            translate([0,0,-1]) cylinder(r=(tooth_end-tooth_length)-effective_tolerance,h=tooth_end+2);
            translate([0,0,height+effective_tolerance]) rotate([25,0,0]) translate([tooth_end-50,-50,-1])  cube([100,100,height+2]);
            translate([0,0,height+effective_tolerance]) rotate([-25,0,0]) translate([tooth_end-50,-50,-1])  cube([100,100,height+2]);
        }
        translate([tooth_end-tooth_radius,0,-1]) cylinder(r=tooth_radius+effective_tolerance,h=height+2);
    }
}
module gauche(){
    translate([0,0,70]) rotate([180,0,0]) assemble(true,moule_height,moule_length,moule_thickness,moule_tolerance,moule_handle_length,alignment_tooth_height);
}
module droit(){
        assemble(false,moule_height,moule_length,moule_thickness,moule_tolerance,moule_handle_length,alignment_tooth_height);
}
module weight(){
    difference(){
        import("weight_12_withChannel.stl", convexity=8);
        translate([115,0,0]) cube([40,40,40],center=true);
    }
}
module anchor100X200(){
    difference(){
        minkowski(){
            difference(){
                hull(){
                    translate([0,0,90]) rotate([90,0,0]) cylinder(r=5,h=2,center=true);
                    translate([0,0,-5]) cube([190,90,2],center=true);
                }
                $fn=40;
                translate([105,0,100]) rotate([90,0,0]) cylinder(r=100,h=92,center=true);
                translate([0,42,160]) rotate([0,90,0]) scale([4,1.09,1]) 
                    cylinder(r=40,h=192,center=true);
                translate([0,-42,160]) rotate([0,90,0]) scale([4,1.09,1]) 
                    cylinder(r=40,h=192,center=true);

            }
            $fn=30;
            sphere(r=5);
        }
    }
}


module weightBody2(width=60,thickness=12){
    translate([30,0,0]) hull(){
        scale([1,1,1/(width/(thickness))]) sphere(r=width/2);
        translate([width,0,0]) scale([1,1,3/(width/(thickness))]) sphere(r=width/8);

    }
}


module anchorsRail(regenerate=false){
    translate([21,0,3]) rotate([0,-3,0]) scale([0.19,0.17,0.18]) anchor100X200();
    translate([48,0,4]) rotate([0,2,0]) scale([0.19,0.15,0.16]) anchor100X200();
    translate([82,0,3]) rotate([0,3,0]) scale([0.1,0.08,0.08]) anchor100X200();

}
module anchors(sink=0,regenerate=false){
    translate([0,0,-sink]){
        anchorsRail(regenerate);
    }
    translate([0,0,sink]){
        rotate([180,0,0]) anchorsRail(regenerate);
    }
}
module weight_text(val){
        $fn=8;
        minkowski() {
        linear_extrude(height = 2) text(val);
        //sphere(r=1.1);
        cylinder(h=1,r1=1,r2=0);    
    }
 }
module channel(){
     union(){
        translate([0,-25,0]) rotate([0,90,12]) translate([0,0,-40]) cylinder(r=1.5,h=180);
        translate([0,25,0]) rotate([0,90,-12]) translate([0,0,-40]) cylinder(r=1.5,h=180);
    }
}
module weight15(withChannel=true){
 difference(){    difference(){
        union(){
            weightBody2(width=60.90);
            anchors();
            rotate ([0,0,90]) translate([-7,-70,2.7]) weight_text("15");
        }

        translate([8,23,0])cylinder(r=3,h=30,center=true);
        translate([8,-23,0])cylinder(r=3,h=30,center=true);
    }
   if(withChannel)
    translate([-8,0,0]) channel();
   }
   if(!withChannel)
    translate([-8,0,0]) channel();    
}
module weight15_v2(withChannel=true){
 difference(){    
     difference(){
        union(){
            weightBody2(width=63);
            translate([25,15,0]) anchor_2(10,40);
            translate([25,0,0]) anchor_2(12.7,45);
            translate([25,-15,0]) anchor_2(10,40);
            translate([77,0,0]) anchor_2(8,30);

            rotate ([0,0,90]) translate([-7,-70,2.7]) weight_text("15");
        }

        translate([8,23,0])cylinder(r=3,h=30,center=true);
        translate([8,-23,0])cylinder(r=3,h=30,center=true);
    }
   if(withChannel)
    translate([-8,0,0]) channel();
   }
   if(!withChannel)
    translate([-8,0,0]) channel();    
}
module anchor_2(anchor_height=10,anchor_length=35){
    hull(){
        cube([anchor_length,1,1],center = true);
        translate([10,0,0]) cube([1,15,1],center = true);
        translate([8,0,anchor_height]) sphere(r=2);
        translate([8,0,-anchor_height]) sphere(r=2);
    }
}
module weight12(withChannel=true){
    scale_factor = 0.9;
    difference(){
        scale([scale_factor,scale_factor,scale_factor]){ 
            difference(){
            union(){
                weightBody2(width=61.32,thickness=13.33);
                anchors();
                rotate ([0,0,90]) translate([-7,-70,3]) weight_text("12");
            }

            translate([7,23,0])cylinder(r=3.5,h=30,center=true);
            translate([7,-23,0])cylinder(r=3.5,h=30,center=true);
       }
    }
   if(withChannel)
    translate([-8,0,0]) channel();
   }
   if(!withChannel)
    translate([-8,0,0]) channel();
}
module weight10(withChannel=true){
    scale_factor = 0.8;
    difference(){
    scale([scale_factor,scale_factor,scale_factor]) 
        difference(){
            union(){
                weightBody2(width=64.5,thickness=12/scale_factor);
                anchors();
                rotate ([0,0,90]) translate([-7,-70,4]) weight_text("10");
            }

            translate([7,23,0])cylinder(r=3.5,h=30,center=true);
            translate([7,-23,0])cylinder(r=3.5,h=30,center=true);
       }
       if(withChannel)
            translate([-30,0,0]) channel();
   }
   if(!withChannel)
        translate([-30,0,0]) channel();

}

difference(){
translate([0,25-23.4,0]) difference(){
   gauche();
  translate([114,0,35]) rotate([90,0,180]) weight15_v2(false);
}
translate([-30,-40,-1]) cube([200,40,100]);

}
