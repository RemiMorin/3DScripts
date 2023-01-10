
$fn = 40;
module center(radius=10, thickness = 2, raise=10,totalLength=100){
    intersection(){
        hull(){
            translate([0,-raise,0]) intersection(){
                translate([0,0,-1])cylinder(radius+1,radius+1,0);
                translate([0,0,(-radius*4)+thickness]) sphere(r=radius*4);
            }
            translate([-totalLength+(radius*2),radius/2,0]) intersection(){
                translate([0,0,-1])cylinder(radius+1,radius+1,0);
                translate([0,0,(-radius*4)+thickness]) sphere(r=radius*4);
            }
        }
        hull(){
             translate([0,-raise,0])cylinder(radius,radius,radius);
            translate([-totalLength+(radius*2),radius/2,0]) cylinder(radius,radius,radius);
        }
    }
}
module weight(bottomRadius=10,topRadius=5, lenghtTotal=100,width=25,attackAngle=20){
    hull(){
        sphere(bottomRadius*1.5);
        rotate([0,0,attackAngle]) translate([0,width-bottomRadius,0]) sphere(bottomRadius);
        translate([-lenghtTotal+(bottomRadius+topRadius),0,0]) sphere(topRadius);
        translate([-lenghtTotal+(bottomRadius+topRadius),topRadius,0]) sphere(topRadius);
    }
}
module half(bottomRadius=10,fin=30,topRadius=5, lenghtTotal=100,width=25,attackAngle=20){
    intersection(){
        translate([0,0,99]) cube(200,center=true);
        rotate([-90,0,0]) center(fin,5,5,lenghtTotal+topRadius);
    }
    translate([fin-bottomRadius,0,0]) weight(bottomRadius,topRadius,lenghtTotal,width,attackAngle);
}
module bodyWeight(bottomRadius=10,fin=30,topRadius=5, lenghtTotal=100,width=25,attackAngle=20){
    rotate([0,35,0]) translate([-15,0,0]){
        half(bottomRadius,fin,topRadius, lenghtTotal,width,attackAngle);
        mirror([0,1,0]) half(bottomRadius,fin,topRadius, lenghtTotal,width,attackAngle);
    }
}
module anchor(width=20,coreRadius=10,terminalRadius=3,coreLength=50,coreHeight=15){
    hull(){
    sphere(coreRadius);
    translate([0,width-coreRadius,terminalRadius]) sphere(coreRadius);
    translate([0,-(width-coreRadius),terminalRadius]) sphere(coreRadius);
    translate([-(coreLength-coreRadius-terminalRadius),0,0]) sphere(terminalRadius);
    translate([0,0,coreHeight-terminalRadius]) sphere(terminalRadius);
    }
}
module fullWeight(holeRadius=1.5){
    difference(){
    union(){   
        translate([0,0,-5]) anchor(15,7,1.5,35,13);    
        translate([-15,0,7]) anchor(15,5,1.5,25,13);    
        bodyWeight(7,35,4,7,25,20);
    }
            translate([0,12.5,0]) rotate([0,-55,10]) translate([0,0,-100]) cylinder(h=200,r=holeRadius);
        translate([0,-12.5,0]) rotate([0,-55,-10]) translate([0,0,-100]) cylinder(h=200,r=holeRadius);
    }
}

fullWeight();