difference(){
    translate([0,0,0]) minkowski(){
    linear_extrude(height = 10, center = true, convexity = 10, twist = 0) text("Q",100,"times new roman");
        sphere(r=8);
    }
    translate([-10,-50,-30]) cube([200,200,30]);
}