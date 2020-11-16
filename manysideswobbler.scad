include <led-diode.scad>;

$fn=100;


innerCircleRadius = 5;
outerCircleRadius = 1;
circleDistance = 20;
endBlobSize = 0;

corners = 20;
sectionTwist = (360/corners)*2;

echo (360/22);
makeQuarter = 0;
makeFull = 0;
removeBottom = 0;



    
module startShape(){
    hull(){
        circle(r=innerCircleRadius);
        translate( [circleDistance, 0, 0])
            circle(r=outerCircleRadius);
    }
    
    if (endBlobSize > 0){
        translate( [circleDistance, 0, 0])
            circle(r=endBlobSize);
        }
}



module halfSection(){
    extrudeAngle = makeQuarter > 0 ? 90 : 180;
    
    difference(){
        rotate_extrude(angle=extrudeAngle, $fn=90)
            difference(){
                for(i=[0:corners]){
                    rotate([0, 0,i*(360/corners)])
                        startShape();
                    }
                    
                translate( [-(circleDistance+outerCircleRadius+endBlobSize), 0, 0])
                    square((circleDistance + outerCircleRadius + endBlobSize)*2, center=true);
                if (makeQuarter > 0){
                translate( [0, -(circleDistance+outerCircleRadius+endBlobSize),-(circleDistance+outerCircleRadius+endBlobSize)])
                    square((circleDistance + outerCircleRadius + endBlobSize)*2, center=true);                    
                }
            }
            
            
    }
}

difference(){
halfSection();
    
translate([2,0,2])
    rotate([0,45,0])
        ledDiode();
}
translate([circleDistance*3,0,0])
    difference(){
        rotate([0,90,0])
            halfSection();
        translate([2,0,2])
            rotate([0,45,0])
                ledDiode();
    }


//
//difference(){
//    union(){
//        halfSection();
//
//        if (makeFull > 0){
//        rotate([0,sectionTwist,0])
//            mirror([0,1,0]) 
//                halfSection();
//        }
//    }
//    translate([0,0,4])
//    ledDiode();
//    
//    translate( [0,0,-(circleDistance+outerCircleRadius+endBlobSize)])
//    
//    cube((circleDistance + outerCircleRadius + endBlobSize)*2, center=true);  
//    
//    
//    rotate([90, 0, 0])   
//          cylinder(  circleDistance/3, circleDistance/6, circleDistance/6, center=true, $fn=100);
//
//
//}

//translate([circleDistance*2 + (3*outerCircleRadius),circleDistance/6,0])
//    rotate([90, 0, 0])   
//        cylinder(  (circleDistance/3)*0.7, (circleDistance/6*0.9), (circleDistance/6*0.9), center=true, $fn=100);
//
//

