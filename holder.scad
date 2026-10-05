len_phone = 145;
d_screw_m4 = 4.5;
width_phone = 56;
thikness_holder = 6;

// Вызов сборки: теперь холдер гарантированно уходит строго вниз от Z = 0
holder_set();

module holder_set() {
    // Смещаем всю группу вниз, чтобы верхняя грань была на Z = 0
    translate([0, 0, -thikness_holder/2]) {
        difference() {
            t_cross();
            screw_hole();
        }
        horizontal_block(0);
    }
}

module horizontal_block(offset_vertical) {
    translate([0, offset_vertical, 0])
    cylinder(d=20, h=thikness_holder, center=true, $fn=32);
    
    difference() {
        hull() {
            translate([width_phone/2, 0, 0])
            cylinder(d=9, h=thikness_holder, center=true, $fn=32); // Исправлено: h=thikness_holder вместо -2
            
            translate([-width_phone/2, 0, 0])
            cylinder(d=9, h=thikness_holder, center=true, $fn=32); // Исправлено: h=thikness_holder вместо -2
        }
        color("red")
        hull() {
            translate([width_phone/2, 0, 0])
            cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
            
            translate([-width_phone/2, 0, 0])
            cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
        }
    }
}

module t_cross() {
    hull() {
        translate([0, -len_phone/2, 0])
        cylinder(d=9, h=thikness_holder, center=true, $fn=32); // Исправлено: h=thikness_holder вместо -2

        translate([0, len_phone/2, 0])
        cylinder(d=9, h=thikness_holder, center=true, $fn=32); // Исправлено: h=thikness_holder вместо -2
    }
    
    hull() {
        translate([width_phone/2, 0, 0])
        cylinder(d=9, h=thikness_holder, center=true, $fn=32); // Исправлено: h=thikness_holder вместо -2

        translate([-width_phone/2, 0, 0])
        cylinder(d=9, h=thikness_holder, center=true, $fn=32); // Исправлено: h=thikness_holder вместо -2
    }
}

module screw_hole() {
    color("red")
    hull() {
        translate([0, len_phone/2, 0])
        cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
        
        translate([0, -len_phone/2, 0])
        cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
    }
    
    color("red")
    hull() {
        translate([width_phone/2, 0, 0])
        cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);

        translate([-width_phone/2, 0, 0])
        cylinder(d=d_screw_m4, h=thikness_holder+2, center=true, $fn=32);
    }
}
