$fn=60;


diametre_externe = 26;
diametre_interne = 20;
hauteur = 40;
largeur = 29;
profondeur = 34;

    
module dent(width){
    a=[
        [-0.5,-width/2],
        [width,0],
        [-0.5,width/2]
    ];
    polygon(a);
}
module trapeze(small_length,length,height,thickness){
 linear_extrude(height = thickness, convexity = 10)
        polygon([[-small_length/2,0],
                 [small_length/2,0],
                 [length/2,-height],
                 [-length/2,-height]]
                );
}

module mur(){
    union(){//roue
        for(i = [22.5:22.5:22.5*8]){
            rotate([0,0,i+90/4]) color([0,0,1]) 
                translate([diametre_interne/2,0,-1]) 
                    linear_extrude(height = 4, convexity = 10) dent(3);
        }
        difference(){       
            color([0,0,1]) translate([0,0,-1]) cylinder(h=4,r=diametre_interne/2);
            translate([0,-diametre_interne/2,0]) rotate([45,0,0]) translate([-50,-50,0]) cube([100,100,100]);
        }
        translate([0,0,-2]) cylinder(h=2,r=diametre_externe/2);
        
        
    }
    //translate([-diametre_externe/2,-hauteur,-2]) cube([diametre_externe,hauteur,2]);
    hull(){
        translate([0,0,-2]) trapeze(diametre_externe,diametre_externe*1.5,hauteur,2);
        rotate([10,0,0]) translate([0,0,-2]) trapeze(2,10,hauteur,2);
    }
}
module clips(){
    translate([0,-largeur/2,0]) rotate([90,0,0]) mur();
    translate([0,largeur/2,0]) scale([1,-1,1]) rotate([90,0,0]) mur();
}

union(){
    clips();
    difference(){
        union(){
            translate([0,largeur/2,0]) rotate([90,0,0]) 
                trapeze(profondeur,profondeur*1.5,hauteur,largeur);
            translate([0,largeur/2,0]) rotate([90,0,0]) 
                cylinder(h=largeur,r=profondeur/2);
            
             rotate([90,0,0]) cylinder(h=5,r=(profondeur/2)+4,center=true);
             
        }
        union(){
            translate([0,largeur/2+1,hauteur*0.1]) rotate([90,0,0]) trapeze(profondeur*0.8,profondeur*1.4,hauteur*1.2,largeur/2);
            translate([0,-1,hauteur*0.1]) rotate([90,0,0]) trapeze(profondeur*0.8,profondeur*1.4,hauteur*1.2,largeur/2);
            
        translate([0,largeur/2+1,0]) rotate([90,0,0]) 
                cylinder(h=largeur/2,r1=profondeur/2-1,r2=10);
        translate([0,-largeur/2-1,0]) rotate([90,0,180]) 
                cylinder(h=largeur/2,r1=profondeur/2-1,r2=10);
        }
    }
    difference(){
        translate([-35,-35,-hauteur]) cube([70,70,10]);
        union(){
            for(i=[0:90:359]){
                rotate([0,0,i]) translate([30,30,-60]) cylinder(h=50,r=3.2);
                rotate([0,0,i]) translate([30,30,-33]) cylinder(h=50,r=4.5);
            }
        }
    }
}
