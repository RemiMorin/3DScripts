
module quarter(){
    intersection(){
    import("monopole_gear.stl", convexity=6);
    translate([0,-101,0]) cube(202);
    }    
}
module analyse_monogear(){
    slices = 5;
    *for(i=[0:slices]){
        translate([0,0,i*70]) difference(){
        quarter();
        translate([i*(50/slices)+1,-101,-1]) cube(202);
        }
    }
}


function index(row_index,
            line_index,
            row_length,
            slices) 
= ((row_index%row_length)+(line_index*row_length))%(row_length*slices);



//the top of every teeth and the bottom of every valey is based 
//on a circle, this is the circle.
teeth_curve_radius=5;

//tooth height... self explanotory
teeth_height=14;

//full gear radius (teeth top to teeth top)
gear_radius=100;

//number of tooth in the gear, use an even number 
//otherwise one pole will have a hole, the other one a peak
teeth_count=20;

// monopole gear is half sphere radius, so radius is diameter
circ = PI*gear_radius;
teeth_width = (PI*(gear_radius-10))/(teeth_count/2);
echo("circonference: ", circ, "largeur dent: ", teeth_width);

radius_effective = function (h)
    gear_radius - sqrt(pow(gear_radius,2)-pow(h,2));
factor = function (h)    
    let (radius_x = radius_effective(h)+gear_radius)
    radius_x/gear_radius;
    
module my_cylinder(width=100,radius=50,angle=360/6,slice=3,compute_point){
    slice_width = width/slice;
    points = [
        for(j=[-slice:1:slice+1]) 
            for(i=[-180:angle:180-1])
                compute_point(i,j*slice_width,radius+radius_effective(j*slice_width),teeth_width),
    ];
    row = 360/angle;
    echo("row");
    echo(row);
    faces = [
        [for(i=[0:1:row]) i],
        for(j=[0:1:slice*2-2])
            for(i=[0:1:row-1]) 
                [index(i,  j+1,row,slice+1),
                 index(i+1,j+1,row,slice+1),
                 index(i+1,j  ,row,slice+1),
                 index(i,  j  ,row,slice+1)],
         [for(i=[row-1:-1:0]) i+((slice-1)*row)]

    ];
    echo("points");
    echo(points);
    echo("faces");
    echo(faces);
    polyhedron(points,faces,convexity=2);
}
module flat_circular_waves(){
    for(i=[0:1:180]){
        for(j=[0:2:180]){

            x = sin(sqrt(pow(i*10,2)+pow(j*10,2)));
            translate([i,j,0]) cube([2,2,11+x*10]);    
        }
    }
}
module map(width=100,radius=50,angle=360/6,slice=3,compute_point){
    slice_width = width/slice;

    for(j=[0:2:slice]){ 
        for(i=[0:2:(360/angle)-1]){
            r = compute_point(i,j,10,30);
            translate([i/2,j/2,0]) cube([1,1,r[0]]);
            translate([-i/2,j/2,0]) cube([1,1,r[1]]);

        }
    }
}
circle_point = function (angle,height)
    [cos(angle)*50,sin(angle)*50,height];


radius=gear_radius/2;
sin_over_circle = function (angle,height,base,wave_width)
       let (y = height)
       let (x = (angle)*10)
       let(f = 360/(wave_width))
 
       let (r = base - 5 *sin(-90+sqrt(pow(x,2)+pow(y*f,2))))
        [cos(angle)*r,sin(angle)*r,height];

compute_ray = function (x,y,base,wave_width)
       let(f = 360/wave_width)
       base + sin(sqrt(pow(x*f,2)+pow(y*f,2)));
       //radius + (6* sin(sqrt(pow(x,2)+pow(y,2))));

*map(width=180,
            radius=radius,
            angle=2,slice=180,
            compute_point=sin_over_circle);
union(){
    translate([0,0,-50]) union(){
             my_cylinder(width=50,
                    radius=radius,
                    angle=1,slice=radius,
                    compute_point=sin_over_circle);

    }
    *translate([0,0,50]) difference(){
    rotate([0,90,-90]) import("monopole_gear.stl", convexity=6);
        translate([-100,-100,0]) cube(200);
    }
}
//flat_circular_waves();


