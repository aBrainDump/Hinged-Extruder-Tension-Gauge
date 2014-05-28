//  Hinged Extruder Tension Guage Customizable
//
//  It was always a guessing game when setting
//  the tension on my extruder.  I would get it 
//  set where I like it.  Then for some reason
//  have to take apart the extruder.  Getting the 
//  tension back to the exact level was not easy.
//  So I created this little gauge so when I 
//  loosen the hinge I can set it back exactly
//  where it was.
//
//  Once installed and you get the tension where
//  you like it.  Just make a mark so you will 
//  have a visual cue.
//
//  I have tested this on the Prusa i3 Rework 
//  Extruder Upgrade.
//  http://www.thingiverse.com/thing:291291
// 
//  Problem solved.
//  
//  I printed in PLA .2 layer height
//
//  aBrainDump.com
//
//
//


// Arm length
armlength = 24; 

// Distance between mounting holes
mountholedistance = 15;

// Mounting bracket height
mountheight = 10.5;

// Mounting bracket thickness
mountthickness = 2;

// Tooth gap in mm
tooth = .8;

/* [Hidden] */

$fn=20;

mirror([0,0,1])
gauge();

module gauge()
{

difference()
{
cube([mountholedistance+11,mountthickness,mountheight]);

rotate([90])
translate([11/2,mountheight/2,-mountthickness])
cylinder(h=mountthickness+2,r=3.6/2);

rotate([90])
translate([(mountholedistance+11)-(11/2),mountheight/2,-mountthickness])
cylinder(h=mountthickness+2,r=3.6/2);
}

//center gauge
difference()
{
translate([(mountholedistance+11-(mountthickness))/2,0,(mountheight/2)-mountthickness])
cube([mountthickness,armlength,(mountheight/2)+2]);

for (step = [1:tooth*2:armlength/1.5]) {
     translate([(mountholedistance+11-(mountthickness)*2)/2,armlength-step+1,(mountheight/2)-mountthickness])
     cube([mountthickness*2,tooth,mountheight/6]);


}

//edge guage
//difference()
//{
//translate([(mountholedistance+11),0,mountheight/2])
//cube([mountthickness,armlength,mountheight/2]);
//
//for (step = [armlength:2:armlength/2]) {
//     translate([(mountholedistance+11),step+1,(mountheight/2)+3])
//     cube([mountthickness,1,mountheight/3]);
//}

}

}