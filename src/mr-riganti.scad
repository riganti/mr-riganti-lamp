$fn = 100;
w = 210;
w2 = 148;
w3 = 121;
h = 195;
h2 = 146;
ex1 = 76;
ex2 = 136;
ey = 74;
er = 22;
s = 27;
d = 16;

th = 2;

cw = 34.7 / 0.6;
ch = 25.8 / 0.6;
cd = 6.8 / 0.6;

module MrRiganti(o, d) {
  translate([-o, -o, 0]) {  
    translate([0, 0, 0]) cube([w + 2*o, s + 2*o, d]);
    translate([0, 0, 0]) cube([s + 2*o, h + 2*o, d]);
    translate([w - s, 0, 0]) cube([s + 2*o, h2 + 2*o, d]);
    translate([w - w2, h2 - s, 0]) cube([w2 + 2*o, s + 2*o, d]);
    translate([w3, h2 - s, 0]) cube([s + 2*o, h - h2 + s + 2*o, d]);
    translate([ex1 + o, ey + o, 0]) cylinder(d, er + o, er + o);
    translate([ex2 + o, ey + o, 0]) cylinder(d, er + o, er + o);
  }
}

scale([0.6, 0.6, 0.6]) {
    
    color([1, 1, 1]) {
      difference() {
        MrRiganti(0, d);
        translate ([0, 0, th]) union() {
          MrRiganti(-th, d);
          translate([ex1 - 4*th, ey, 0]) cube([8*th, h2 - ey - 2*th, d - th]);
          translate([ex2 - 4*th, ey, 0]) cube([8*th, h2 - ey - 2*th, d - th]);  
        }
      }
    }

    color([0.2, 0.2, 0.2]) translate([250, 0, d]) scale([1, 1, -1]) {
      difference() {
        union() {  
          MrRiganti(th, d);      
          translate([-th, -th, d-th]) cube([w + 2*th, h2 + 2*th, th]);
          translate([-th, -th + h2, d-th]) cube([w3 + s + 2*th, h - h2 + 2*th, th]);
          translate([-th, h, 0]) cube([w3 + s + 2*th, th, d]);
        }
        union() {
          translate ([0, 0, -th]) MrRiganti(0, d + 2*th);
          translate([ex1 - 4*th, ey, 0]) cube([8*th, h2 - ey, d - th]);
          translate([ex2 - 4*th, ey, 0]) cube([8*th, h2 - ey, d - th]);
        }
      };
    }

    //translate([250, 250, d]) scale([-1, 1, -1]) {
    color([1,1,1]) translate([700, 0, d]) scale([-1, 1, -1]) {
      difference() {
        union() {
          translate([-2*th, -2*th, 0]) cube([w + 4*th, h2 + 4*th, d + th]);
          translate([-2*th, -th + h2, 0]) cube([w2 + 4*th, h - h2 + 3*th, d + th]);
        };
        union() {
          translate([-th, -th, -th]) cube([w + 2*th, h2 + 2*th, d + th]);
          translate([-th, -th + h2, -th]) cube([w2 + 2*th, h - h2 + 2*th, d + th]);
            
          //translate([w3 - cw - 3*th, h - ch - 2*th, 0]) cube([cw + 2*th, ch + 2*th, cd + 2*th + d]);
          translate([w3 - cw - 3*th, h - ch - 2*th, 0]) cube([cw + 2*th, th + ch / 3, cd + 2*th + d]);
          translate([w3 - cw - 3*th, h - ch / 3 - th, 0]) cube([cw + 2*th, th + ch / 3, cd + 2*th + d]);
        }
      }  
    }

    color([1,1,1]) translate([850, h - ch - 2*th, 0]) scale([-1, 1, 1]) {
    //color([1,1,1]) translate([700 - w3 + cw + 3*th, h - ch - 2*th, -cd - 4*th]) scale([-1, 1, 1]) {
      difference() {
        union() {  
          translate([0, 0, 0]) cube([cw + 2*th, ch + 2*th, cd + 2*th + d]);
          translate([0, ch + 2*th, 0]) cube([cw + 2*th, 2*th, cd + 3*th]);
        }
        union() {  
          translate([th, th, th]) cube([cw, ch, 2*d + 2*th]);
          translate([-th, th + ch / 3, cd + 3*th]) cube([cw + 4*th, ch / 3, d + 2*th]);  
          translate([-th, th, cd + 4*th]) cube([cw, ch, d + 2*th]);
          translate([cw, ch / 3 + th, 2*th]) cube([d, ch / 3, 3*th]);
          translate([cw + 1.5*th, ch / 3 - 2*th, 0]) cube([d, ch / 3 + 6*th, 7*th]);
        }
      }
      translate([th, th, th]) cube([3 * th, ch, th*3]);
      translate([cw - 3*th, th, th]) cube([4 * th, ch, th]);
    }
}