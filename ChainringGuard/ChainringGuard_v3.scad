$fn=72;
module disc_profile () {
    union () {
        polygon (points = [[25,0], [70,0], [70,3], [50,3], [45,8],[25,8],[25,5],[30,0]]);
        translate([70, 1.5, 0]) 
            circle (d=3);
        
        //translate([25, 6.5, 0]) 
        //    circle (d=3);
        
    }
}
//!disc_profile ();
module main_disc () {
rotate_extrude (angle = 360, convexity = 36)
    //rotate ([90,0,0])
        disc_profile();
}

module disc_shape (){
    difference () {
        cylinder (r=70+3, h=10);
        cylinder (r=50, h=10);
    }

}


module rib (){
    translate ([0, -8, 0]) 
        cube ([60, 16, 10]);
    
}

module ribs (){
    for (i=[0:1:5]){
        rotate (a=72*i, v=[0,0,1]) {
           rib(); 
        }
    }
    
}

module hole (radius = 2){
    translate ([36.5, 0, -1]){
        cylinder (r=radius, h=11);
    }
}

module holes (radius){
    for (i=[0:1:5]){
        rotate (a=72*i, v=[0,0,1]) {
           hole(radius); 
        }
    }
    
}

difference(){
    intersection (){
        main_disc();
        union(){
            disc_shape();
            ribs();
        }
    }
    holes(2); // 1 for inner, 2 for outer
}



