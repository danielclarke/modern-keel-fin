tab_thickness = 4;

module keelFoil() {
    translate([0, 0, 3.445]) 
    rotate([0, 180, 0]) 
    scale([900, 900, 1000 * 5.0 / 7.0]) 
    import("keel-fin.stl");
}

module keelFoilCutOut() {
    difference() {
        keelFoil();
        translate([150, -23.3, 0])  
        rotate([0, 0, 5])
        cube([80, 50, 20], true);
    }
}

module finBase() {
    cube([114, 19.05, 5], false);
}

module fcs2TabFront() {
    difference() {
        union() {
            cube([40.4, 14, tab_thickness], false);
            translate([40.4, 0, 0])
            rotate([0, 0, 90-17])
            cube([20, 10, tab_thickness]);
        }
        translate([0, 14, 0])
        cube([50, 14, tab_thickness]);
    }
} 

module fcs2TabRear() {
    difference() {
        union() {
            cube([27.7, 14, tab_thickness], false);
            translate([27.7, 0, 0])
            rotate([0, 0, 90-17])
            cube([20, 10, tab_thickness]);
        }
        translate([0, 14, 0])
        cube([40, 14, tab_thickness]);
    }
} 

module fcs2Base() {
    union() {
        fcs2TabFront();
        translate([65.4, 0, 0])
        fcs2TabRear();
    }
}

module keelFin() {
    union() {
        translate([0, 14, 0]) keelFoil();
        translate([0, 0, 0]) fcs2Base();
    }
}

//fcs2Base();
translate([0, 30, -6]) rotate([0, 0, 90]) mirror([0, 1, 0]) keelFin();
translate([30, 0, -6]) rotate([0, 0, 0]) keelFin();