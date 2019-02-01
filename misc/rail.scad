//polygon ([[0,0],[0, -5],[1.5,-5],[2,-2],[8,-2],[8,-4],[10,-4],[10,4],[8,4],[8,2],[2,2],[1.5,5],[0,5]]);

$fn=36;
module rail_shape1 (){
translate([0, -6])
    circle(radius = 1);
translate([1.5, -6])
    circle(radius = 1);
translate([2,-2])
    circle(radius = 1);
translate([2,2])
    circle(radius = 1);
translate([1.5,6])
    circle(radius = 1);
translate([0,6])
    circle(radius = 1);
}

module rail_shape2 (){
translate([10,-2])
    circle(radius = 1);
translate([10,-4])
    circle(radius = 1);
translate([12,-4])
    circle(radius = 1);
translate([12,4])
    circle(radius = 1);
translate([10,4])
    circle(radius = 1);
translate([10,2])
    circle(radius = 1);
}



//[1.5,-5],[2,-2],[8,-2],[8,-4],[10,-4],[10,4],[8,4],[8,2],[2,2],[1.5,5],[0,5]

module rail() {
    hull ()
    rail_shape1();
    hull ()
    rail_shape2();
    polygon([[0,-2.5],[12,-2.5],[12,2.5],[0,2.5]]);
}


rotate ([0,0,-90])
rotate ([0,-90,0])
linear_extrude ()
    rail();