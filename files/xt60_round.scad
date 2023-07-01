$fn=100;
use <threadlib/threadlib.scad>
include <Chamfers-for-OpenSCAD/Chamfer.scad>;


difference() {
  union() {
    translate([0,0,3])    
      bolt("M25x2", turns=9); 
    translate([0,0,8])    
      chamferCylinder(r=12.5, h=2.0, ch=0, ch2=0.25);
    chamferCylinder(r=19, r2=20.5, h=8, ch2=0.5);
    translate([0,-13.5,8])
      chamferCylinder(h=2.0,r=2,ch=-1,ch2=0);
  }

  // connector
  translate([-12.5,0,3.1]){    
    xt60_mount_large();
  }

  // connector face hole
  translate([-12.5,0,0]){    
    xt60_mount();
  }

  // counter sunk screw holes
  translate([-12.5,0,-0.01])
    chamferCylinder(h=3,r=1.75, ch=-2,ch2=0);
  translate([12.5,0,-0.01])
    chamferCylinder(h=3,r=1.75, ch=-1.75,ch2=0);
};


module xt60_mount_large() {
  tolerance  = .225;
  xt60hole_distance = 25.0;
  xt60hole_r = 1.5 + tolerance / 2;
  xt60w1     = 12.0 + tolerance;
  xt60l1     = 34.0 + tolerance;
  xt60w2     = 16.0 + tolerance;
  xt60l2     = 20.0 + tolerance;
  xt60crop   = 3.0;
  xt60h      = 23.0 + tolerance;
  xt60w3     = 12.0 + tolerance;
  xt60l3     = 19.0 + tolerance;

  translate([0,0,-1]) {
    translate([0,0,-xt60h])
      cylinder(h=xt60h*3,r=xt60hole_r);
    translate([xt60hole_distance,0,-xt60h])
      cylinder(h=xt60h*3,r=xt60hole_r);
    translate([(xt60hole_distance-xt60l1)/2,-xt60w1/2,0]) {
      linear_extrude(xt60h) {
//
//        Poligon draw order
//             3______4
//        1__2/        \5__6
//        |                |
//        0__12         8__7
//            \11_____9/
//        
        polygon([
          [0,0],                                                //  0
          [0,xt60w1],                                           //  1
          [(xt60l1-xt60l2-xt60crop*2)/2,xt60w1],                //  2    
          [((xt60l1-xt60l2)/2),xt60w1+(xt60w2-xt60w1)/2],       //  3
          [xt60l2+(xt60l1-xt60l2)/2,xt60w1+(xt60w2-xt60w1)/2],  //  4
          [xt60l2+(xt60l1-xt60l2)/2+xt60crop,xt60w1],           //  5
          [xt60l1,xt60w1],                                      //  6
          [xt60l1,0],                                           //  8
          [xt60l2+(xt60l1-xt60l2)/2+xt60crop,0],                //  9
          [xt60l2+(xt60l1-xt60l2)/2,-(xt60w2-xt60w1)/2],        // 10  
          [(xt60l1-xt60l2)/2,-(xt60w2-xt60w1)/2],               // 11
          [(xt60l1-xt60l2-xt60crop*2)/2,0]                      // 12
        ]);
      }
    }
//    translate([(xt60hole_distance-xt60l3)/2,-xt60w3/2,0])  {
//       cube([xt60l3,xt60w3,xt60h*2]);
//    }
  }
}

module xt60_mount() {
    
    xt60hole_distance = 25.0;
    xt60hole_r = 1.6;
    xt60w = 8.7;
    xt60l = 16.6;
    xt60crop = 2;
    translate([0,0,-1]){
        cylinder(h=6,r=xt60hole_r);
        translate([xt60hole_distance,0,0])
            cylinder(h=6,r=xt60hole_r);
        translate([(xt60hole_distance-xt60l)/2,-xt60w/2,0]) {
            linear_extrude(6){
                polygon([[0,0],
                    [xt60l-xt60crop,0],
                    [xt60l,xt60crop],
                    [xt60l,xt60w-xt60crop],
                    [xt60l-xt60crop,xt60w],
                    [0,xt60w]
                    ]);
            }
        }
    }
}
