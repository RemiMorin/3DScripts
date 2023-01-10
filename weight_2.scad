
$fn =60;
$fs = 0.01;
module weightBody(width=60,endThickness=15,bodyLength=50,tailWidth=40,tailTickness=8){
    hull(){
        rotate([90,0,0]) cylinder(h=width*0.8,r=15/2,center=true);

        translate([0,width/2,0]) sphere(r=2);
        translate([0,-width/2,0]) sphere(r=2);
        translate([-bodyLength,tailWidth/2,0]) sphere(r=tailTickness/2);
        translate([-bodyLength,-tailWidth/2,0]) sphere(r=tailTickness/2);
        
    }
}
module weightBody2(width=60,thickness=12){
    translate([30,0,0]) hull(){
        scale([1,1,1/(width/(thickness))]) sphere(r=width/2);
        translate([width,0,0]) scale([1,1,3/(width/(thickness))]) sphere(r=width/8);

    }
}

module anchor(){
    $fn =5;
    minkowski()
    { 
        translate([0,5,0]) intersection(){
        import("C:/Users/remim/Documents/anchorBase.stl");
        translate([-3,0,0]) import("C:/Users/remim/Documents/anchorBase2.stl");
    }
    sphere(r=1.1);
    }
}
module anchorsRail(regenerate=false){
    if(regenerate){
        union(){
            translate([0,-0.5,-2]) cube([80,1,4]);
        translate([4.5,0,0.8]) rotate([0,-6,0]) anchor();
            translate([32,0,1.6]) rotate([0,-3,0]) anchor();
            translate([70.5,0,1.5]) rotate([0,-2,0]) scale([0.7,0.7,0.7]) anchor();
        }
    }
    if(!regenerate){
        import("C:/Users/remim/Documents/anchorRail.stl");
    }
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
module weight15(){
    difference(){
        union(){
            weightBody2(width=60.90);
            anchors();
            rotate ([0,0,90]) translate([-7,-70,2.7]) weight_text("15");
        }

        translate([8,23,0])cylinder(r=3,h=30,center=true);
        translate([8,-23,0])cylinder(r=3,h=30,center=true);
    }
    translate([-8,0,0]) channel();        
}
module weight12(){
    scale_factor = 0.9;
        scale([scale_factor,scale_factor,scale_factor]) 
    union(){ difference(){
            union(){
                weightBody2(width=61.32,thickness=13.33);
                anchors();
                rotate ([0,0,90]) translate([-7,-70,3]) weight_text("12");
            }

            translate([7,23,0])cylinder(r=3.5,h=30,center=true);
            translate([7,-23,0])cylinder(r=3.5,h=30,center=true);
       }
    }
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
module weight20(withChannel=true){
                weightBody2(width=60,thickness=12);
                anchors(0,true);
                //rotate ([0,0,90]) translate([-7,-70,2]) weight_text("20");


}
anchorsRail(true);
weight20(true);