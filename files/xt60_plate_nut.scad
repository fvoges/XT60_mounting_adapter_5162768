$fn=100;
use <threadlib/threadlib.scad>


// stretch xy to allow better fit
scale([1.025, 1.025, 1]) {
    nut("M25x2", turns=2, Douter=35);
    translate([0,0,6]) 
        difference() {
            cylinder(r=25/2,h=2, center=true);
            translate([0,0,-0.1]) 
                cylinder(r=30.2/2,h=4, center=true);
        }
    //grip
    for(i = [0:36:360])
        rotate([0,0,i])
            grip_point();
}

    
module grip_point() {
translate([0,-17,1.8])
    difference(){
        {
            translate([0,0,-0.3]) {
                cylinder(r=2,h=5, center=true);
            }
        }
        translate([-5,0,-4])
        cube([10,10,40]);
    }
}
