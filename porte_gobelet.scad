$fn=200;
module bloc(height,width){
    union(){
        translate([5,5,0]) cylinder(h=height,r=5);
        intersection(){
            cylinder(h=height, r=width);
            translate([0,0,-1]) linear_extrude(height = height+2, convexity = 1) 
            polygon([[width+1,0],[width+1,width+1],[0,width+1],[0,5],[5,0]], convexity = 1);;
        }
    }
}
module porteGobelet(height=120,width=115,wall=5){
    inner_radius = (width / (sqrt(2)+1)) - wall; 
    difference(){
        union(){
            bloc(height,width);
        }
        translate([inner_radius+wall,inner_radius+wall,wall])cylinder(h=height,r=inner_radius);
        /*    
        for(i = [20,height/2,height-20]){
           translate([width-15,5,i]) rotate([-90,0,0]) vis();
           translate([5,width-15,i]) rotate([0,90,0]) vis();
           translate([5,25,i]) rotate([0,90,0]) vis();
           }*/
    }
}
module vis(long_vis=25,long_tete=150){
    union(){
        translate([0,0,-long_vis]) cylinder(h=long_vis+1,r=1.5);
        cylinder(h=long_tete,r=5);
    }
}
module rangement(){
    hull(){
        translate([0,7.5,80]) cylinder(h=40,r=2.5);
        translate([30,7.5,80])cylinder(h=40,r=2.5);
        translate([25,30,80])cylinder(h=40,r=2.5);
    }    
}
module fullGobelet(){
    difference(){
        porteGobelet(90,115,5);
        translate([75,0,0]) rangement();
        rotate([0,0,-90]) mirror([1,0,0]) translate([75,0,0]) rangement();
        translate([0,-1,-1]) cube([66,4,89]);
        translate([16,2,-1]) hull(){
            cube([28,1,88]);
            translate([4,1,0]) cube([20,10,25]);

        }
        hull(){
            translate([-1,0,90]) cube([5,115,1]);
            translate([-5,0,74]) cube([5,115,16]);
        }
        hull(){
            translate([-1,0,64]) rotate([0,90,0])cylinder(h=5,r=25);
            translate([-1,0,40]) rotate([0,90,0])cylinder(h=5,r=25);
        }
    }
}

module clip(height){
    difference(){
        union(){
            translate([30,-2,0]) cube([60,5,height]);
            for( i = [0:40:height]){
                translate([30,0,i])
                rotate([45,0,0]) 
                    translate([0,-10,-8]) 
                    cube([60,60,16]);
            }
            translate([55,2,0]) cylinder(h=height,r=5);
            translate([70,2,0]) cylinder(h=height,r=5);
    
        }
        rotate([0,0,-45]) translate([-30,0,-20]) cube([60,120,height*2]);
        translate([80,-20,-20]) cube([60,120,height*2]);
        translate([0,-31,-20]) cube([120,30,height*2]);
        translate([0,30,-20]) cube([120,30,height*2]);
        translate([0,-3,height-1]) cube([120,120,height]);

    }
}
module gobeletAvecClips(){
    difference(){
        fullGobelet();
        translate([30,0,20])clip(60);
        rotate([0,0,-90])mirror([1,0,0]) translate([30,0,20])clip(60);
    }
}
module clipInsert(height){
    translate([-40,0,0]) difference(){
        union(){
            translate([30,-1,0]) cube([60,3,height-10]);
            for( i = [0:40:height]){
                translate([30,0,i])
                rotate([45,0,0]) 
                    translate([0,-10,-7.5]) 
                    cube([60,60,15]);
            }
        }
        rotate([0,0,-45]) translate([-31,0,-20]) cube([62,120,height*2]);
        translate([79,-20,-20]) cube([60,120,height*2]);
        translate([0,-31,-20]) cube([120,30,height*2]);
        translate([0,29,-20]) cube([120,30,height*2]);
        translate([0,-3,height-1.5]) cube([120,120,height]);
        translate([60,4,6]) rotate([-90,0,0]) vis();
        translate([60,4,45]) rotate([-90,0,0]) vis();
    }
}

clipInsert(60);
//mirror([1,0,0]) clipInsert(60);

