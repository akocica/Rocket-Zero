
q = 7.5;

module roundedRect(size, radius) {
    x = size[0];
    y = size[1];
    z = size[2];

    linear_extrude(height=z)
    hull() {
        translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
            circle(r=radius);
        translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
            circle(r=radius);
        translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
            circle(r=radius);
        translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
            circle(r=radius);
    }
}



module GoPro() {
    color("red",0.75)
    union() {
        rotate([0, 90, 0])
        cube([60, 20, 40],center=true);
        translate([40/2-13, -20, 60/2-13])
            rotate([90,90,0])
                translate([0, 0, -10])
                    cylinder(h=20, d=22, center=true, $fn=60);
    };    
};

module RocketZero() {
        
        union() {
            color("yellow",0.75)
            cylinder(h=60-1,d=55, center=true, $fn=32);
            color("orange",0.75)
            translate([0, -0, -40])
            cylinder(h=20,d=53, center=true, $fn=32);
             translate([0, -0, 40])
            cylinder(h=20,d=53, center=true, $fn=32);
            
            color("gray",0.75)
                translate([0, -q, 0])
                      GoPro();
            color("blue",0.25)
            translate([40/2-13, -18, 60/2-13+22/2])
                cube([22,20,22], center=true);
            color("green",0.25)
            translate([0, -15, -15])
                rotate([90,90,0])
                        roundedRect([20, 30, 15], 2);
        };
};

RocketZero();
//translate([0, -q, 0]) GoPro();


