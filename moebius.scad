

// returns a factor where 360 and 0 give the lowest values,
// 90 and 270 the highest

function linearModifier(input) = (90- abs(90 - abs(input)))/90;

//function sinModifier(input) = sin(90- abs(90 - abs(input)));
function sinModifier(input) = sin(input) ;
function cosModifier(input) = cos(input) ;


module moebius(x,y,z,diameter, step, rotations){
    

    
    for (i=[-180:step:179]){
        
        factor = sinModifier(i)*1.6;

       // echo (i, " ", factor, " ", sinModifier(i) );
         
//         color([(i+180)/2/255,50/255,50/255])
            rotate([0,0,i])
                translate([diameter, 0, 0])
                    //rotate([0,(i/2)*rotations,(z*cosModifier(i*2))/2 ])

                    rotate([0,(i/2)*rotations,0])
        
                
                        cube([x, y, z + (z/2* (1+factor) ) ], center=true);
//        cube([x, y, z], center=true);
    }
   
}


moebius(4,3,70,80,1, 3);



//translate([100,0,0])
//    moebius(0.6,2.5,20,20,2, 1);
