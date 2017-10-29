$fn = 40;
step = 20;
wheel_radius = 28/2;
angle = 9.5;

//translate([0,0,1.8])  rotate([0,0,-1])  %import("/home/remi/Downloads/Mini_DH_Geared_Fidget_Spinner/files/DoubleHelixGear_v9.stl");


module dent(width){
        a=[
            [-0.5,-width/2],
            [width/2,-width*0.40],
            [width*0.80,-width*0.30],
            [width*0.90,-width*0.22],
            [width*0.97,-width*0.10],
            [width,0],
            [width*0.97,width*0.10],
            [width*0.90,width*0.22],
            [width*0.80,width*0.30],
            [width/2,width*0.40],
            [-0.5,width/2]
        ];
        polygon(a);
    }

//dent(2);
module roue(radius,hauteur_dent,nombre_dent){
    circle(r = radius);
    for (i = [0:360/nombre_dent:359]){
        rotate([0,0,i]) translate([radius,0,0]) dent(hauteur_dent);
    }
}

translate([0,0,-3.5/2]){
linear_extrude(height = 3.51, center = true, convexity = 10, twist = -angle, slices = 20) roue(wheel_radius,2,step);
translate([0,0,3.5]) rotate([0,0,-angle+1]) linear_extrude(height = 3.51, center = true, convexity = 10, twist = angle, slices = 20) roue(wheel_radius,2,step);
}
cylinder(h=12,r=9,center=true);