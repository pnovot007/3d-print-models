$fn=36;

module main_part(){
    translate ([0,0,2])
        cube (size=[80,80,4], center = true);

    translate ([0,0,4])
    difference(){
        cylinder(h = 20, r = 30, center = false);
        cylinder(h = 20, r = 27, center = false);
    }
}

module ribs (){
    intersection(){
        cylinder (h=10,r=30);
        translate([0,0,4])
            union(){
                for (i=[-3:1:3])
                    translate([i*8, 0, 0])    
                        rotate ([90,0,0])
                            cylinder (h= 80, r=2, center =true);
                for (i=[-3:1:3])
                    translate([0, i*8, 0])    
                        rotate ([0,90,0])
                            cylinder (h= 80, r=2, center =true);
            }
    }
}

module stamp (){
    translate ([0,0,0.5])
    rotate([0,180,0])
    linear_extrude (height = 0.5){ 
        translate([0,15,0]) text ("BRNĚNSKÉ", halign="center", valign = "center", size = 5);
        translate([0,5,0]) text ("VODOVODY", halign="center", valign = "center", size = 5);
        translate([0,-5,0]) text ("A", halign="center", valign = "center", size = 5);
        translate([0,-15,0]) text ("KANALIZACE", halign="center", valign = "center", size = 5);
            
        difference(){    
            circle (r=35);    
            circle (r=33);
        }    
    }
}

difference(){
    union(){
        main_part();
        ribs();
        }
    stamp();    
}

