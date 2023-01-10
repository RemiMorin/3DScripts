




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

//index is just an helper that "roll over" when you pass last index to close a form.
function index(row_index,
            line_index,
            row_length,
            slices) 
= ((row_index%row_length)+(line_index*row_length))%(row_length*slices);


radius_effective = function (h)
    gear_radius - sqrt(pow(gear_radius,2)-pow(h,2));
factor = function (h)    
    let (radius_x = radius_effective(h)+gear_radius)
    radius_x/gear_radius;
    
module half_monopole_gear(width=100,radius=50,angle=360/6,slice=3,compute_point){
    slice_width = width/slice;
    points = [
        //slice + 1 because we draw "interval",
        for(j=[0:1:slice+1]) 
            for(i=[-180:angle:180-1])
                compute_point(i,j*slice_width,radius+radius_effective(j*slice_width),teeth_width),
    ];
    row = 360/angle;
    faces = [
        [for(i=[0:1:row]) i],// bottom
        for(j=[0:1:slice-2])
            for(i=[0:1:row-1]) 
                [index(i,  j+1,row,slice+1),
                 index(i+1,j+1,row,slice+1),
                 index(i+1,j  ,row,slice+1),
                 index(i,  j  ,row,slice+1)],
         [for(i=[row-1:-1:0]) i+((slice-1)*row)] //top

    ];
    polyhedron(points,faces,convexity=2);
}

radius=gear_radius/2;

sin_over_circle = function (angle,height,base,wave_width)
       let (y = height)
       let (x = (angle)*10)
       let(f = 360/(wave_width))
 
       let (r = base - 5 *sin(-90+sqrt(pow(x,2)+pow(y*f,2))))
        [cos(angle)*r,sin(angle)*r,height];


union(){
    translate([0,0,0]) union(){
             half_monopole_gear(width=50,
                    radius=radius,
                    angle=1,slice=radius,
                    compute_point=sin_over_circle);
             rotate([180,0,0]) half_monopole_gear(width=50,
                    radius=radius,
                    angle=1,slice=radius,
                    compute_point=sin_over_circle);

    }
}


