

module gear2d(radius=25,teeth_count=20,teeth_height=5,step=2){
    factor =   teeth_count;
    points = [
        for(i = [0:step:360-1])
            let(effective_radius=(sin(i*factor)*teeth_height)+radius)
            echo(i,sin(i))
            [cos(i)*effective_radius,sin(i)*effective_radius], ];
        polygon(points);
    }
    
 translate([50,0]) gear2d();
    gear2d();