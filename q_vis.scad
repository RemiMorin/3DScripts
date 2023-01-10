

module vis(){
    translate([0,0,8])cylinder(r=3,h=10);
    translate([0,0,-1])cylinder(r=1.5,h=10);
}
$fn=30;
difference(){
    import("C:/Users/remim/Documents/Q.stl");
    translate([50,-3,0])vis();
    translate([16,65,0])vis();
    translate([83,65,0])vis();
}