
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
        sphere(bottomRadius);
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
module fullWeight(){
    union(){   
        translate([0,12.5,0]) rotate([0,-55,10]) translate([0,0,-100]) cylinder(h=200,r=1.5);
        translate([0,-12.5,0]) rotate([0,-55,-10]) translate([0,0,-100]) cylinder(h=200,r=1.5);
 
        translate([0,0,-10]) anchor(15,7,1.5,35,13);    
        translate([-15,0,7]) anchor(15,5,1.5,25,13);    
        bodyWeight(15,35,5,80,25,20);
        translate([59.5,0,40]) rotate([0,-110,0]) cylinder(40,40,0);
    }
}

module moule(){
    difference(){
        translate([-20,0,0]) cube([160,80,80],center=true);
        translate([-20,68,0]) cube([200,80,60],center=true);
        translate([-20,-68,0]) cube([200,80,60],center=true);
        translate([-110,0,0]) cube([100,30,100],center=true);
        rotate([0,0,-30]) translate([0,45,0]) cube([100,30,100],center=true);
        rotate([0,0,30]) translate([0,-45,0]) cube([100,30,100],center=true);
    }
}

module masqueGauche(){
    difference(){
        translate([-80,0,0]) union(){
            translate([-100,-100,-50]) cube([200,200,30]);
            translate([-120,-10,-21]) cube([200,200,22]);
            translate([-100,-100,0]) cube([200,200,20]);
            translate([-120,-10,20]) cube([200,200,32]);
        }
        difference(){
            translate([-160,-200,-100]) cube([200,200,200]);
                translate([10,0,-50]) cylinder(h=100,r=10);
        }
        translate([10,0,-100]) cylinder(200,2);
    }
}
module masqueDroit(){
        rotate([180,0,0]) masqueGauche();
}
module mouleExcave(){
    difference(){
        //translate([-30,0,0]) moule();
        translate([-60,0,0]) rotate([0,-70,180]) render(3) fullWeight();
    }
}
module morceauGauche(){
    intersection(){
        mouleExcave();
        masqueGauche();
    }
}
module morceauDroit(){
    intersection(){
        mouleExcave();
        masqueDroit();
    }
}
//translate([-10,-0,0]) morceauGauche();
rotate([0,0,90]) color("red") translate([-10,-0,0]) morceauDroit();
//fullWeight();