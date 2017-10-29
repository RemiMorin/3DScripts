

module trou_de_vis(){
    rotate([0,90,0]){
        cylinder(r=1.25,h=50, center=true, $fn=20);
        translate([0,0,10]) cylinder(r=3.75,h=20, center=true, $fn=20);
    }
}

module corp_support(){
    difference(){
        hull(){
            translate([-6,25,0]) cylinder(r2=10,r1=1,h=50, center=true, $fn=30);
            translate([-6,-25,0]) cylinder(r2=10,r1=1,h=50, center=true, $fn=30);
            translate([5,25,0]) cylinder(r2=10,r1=5,h=50, center=true, $fn=30);
            translate([5,-25,0]) cylinder(r2=10,r1=5,h=50, center=true, $fn=30);
            translate([20,12,0]) cylinder(r2=8,r1=7,h=50, center=true, $fn=30);
            translate([20,-12,0]) cylinder(r2=8,r1=7,h=50, center=true, $fn=30);
        }
        hull(){
            translate([15,0,0]) cylinder(r2=18,r1=12,h=80, center=true, $fn=50);
            translate([50,0,0]) cylinder(r2=5,r1=1,h=80, center=true, $fn=50);
        }
        for(i=[1,-1]){
            translate([15,20*i,25]) rotate([90,0,43*i]) cylinder(r=4,h=50, center=true, $fn=30);
            hull(){
                translate([15,23*i,25]) rotate([0,-20,43*i]){ 
                    translate([0,7*i,0])cylinder(r=4,h=50, center=true, $fn=30);      
                    translate([10,7*i,0]) cylinder(r=4,h=50, center=true, $fn=30);      
                }
            }     
        }
    }
}
module dos(){
    hull(){
        for(i=[1,-1]){
            translate([-1,0,15*i]) rotate([0,90,0]) cylinder(r=30,h=10,center=true,$fn=40);
        }
    }
}
difference(){
    union(){
        //cube([7.5,50,80], center=true);    
        translate([3,0,0]) corp_support();
        dos();
    }
    translate([0,0,30]) trou_de_vis();
    translate([0,0,-30]) trou_de_vis();
    translate([-8,0,0]) cube([10,100,100], center=true); 
    
}