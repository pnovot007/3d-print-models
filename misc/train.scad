$fn = 36;

model_length = 200;
model_width = 100;

module wheel (radius = 10){
    rotate ([90,0,0])
    union(){
        rotate_extrude(angle = 360)
            translate ([2*radius, 0, 0])
                circle(radius/2);
        translate ([0, 0, -radius/4])
            cylinder (h = radius/2, r = 2*radius);
    }    
}

module undercarriage (length = 300, width = 150){
    for (i = [-3:2:3])
        for (j = [-1:2:1])
            translate ([length/6*i, width/2*j, 0])
                wheel();
}

module undercarriage_2 (length = 300, width = 150){
    for (i = [-1:2:1])
        for (j = [-1:2:1])
            translate ([length/3*i, width/2*j, 0])
                wheel();
}
//wheel();

undercarriage(model_length, model_width);
translate ([-model_length/2, -model_width/2, 0])
    cube ([model_length, model_width, model_width/2]);
translate ([-model_length/2, -model_width/2, model_width/2])
    cube ([model_length/2, model_width, model_width/2]);
translate ([model_length/3, 0, model_width/2])
    cylinder (h = model_width/2, r = model_width/6);
translate ([model_length/3, 0, model_width/1])
    cylinder (h = model_width/5, r = model_width/4);

translate ([- model_length*1.5, 0, 0]) {
    undercarriage_2(model_length, model_width);
    translate ([-model_length/2, -model_width/2, 0])
        cube ([model_length, model_width, model_width/1]);
}

translate ([- model_length*3, 0, 0]) {
    undercarriage_2(model_length, model_width);
    translate ([-model_length/2, -model_width/2, 0])
        cube ([model_length, model_width, model_width/1]);
}

rotate([0,-90,0])
    cylinder (h = model_length *3, r = 2);