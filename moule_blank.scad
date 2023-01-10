
$fn = 40;

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
        translate([-30,0,0]) moule();
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
translate([-10,-0,0]) morceauGauche();
rotate([0,0,90]) color("red") translate([-10,-0,0]) morceauDroit();
