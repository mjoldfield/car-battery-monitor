include <BOSL/shapes.scad>
include <BOSL/transforms.scad>
include <BOSL/metric_screws.scad>

big   = 200;    // a big number guaranteed to get us out of the box
delta = 1;  // a small number to make sure we go through faces

$fn=50;

wall = 4.0;
size = [100,55,24];
    
board_width  = 65;
board_height = 40;
board_gap    = 0.5;

usb_step     = 0.5;
usb_width    = 16.0;
    
grommet_small = 9;
grommet_width = 2.5;
grommet_big   = 14.5;
    
pcb_mounting_x = 55.88;
pcb_mounting_y = 31.75;
pcb_offset_x   = -6.0;
pcb_offset_y   = 0;
    
standoff_h =  wall + 3.0;
standoff_d =  8;
    
screw_d_thread = 3.2;
screw_h_head   = 3.5;
screw_d_head   = 6.5;
nut_h_head     = 3.5;
nut_d_head     = 6.5;
    
case_screw_inset    =  5.0;
case_screw_diameter = 10.0;

teeth_w     = 1.0;
teeth_h     = 2.0;
teeth_l     = 10.0;
teeth_space = 0.2;
teetha_xs   = [-30,0,30];
teethb_xs   = [-15,15];
teetha_ys   = [-18.75,18.75];
teethb_ys   = [];

module b() {
    
    bd_dx = 0.5 * board_width  + board_gap;
    bd_dy = 0.5 * board_height + board_gap;
    
    cs_dx = 0.5 * size[0] - case_screw_inset;
    cs_dy = 0.5 * size[1] - case_screw_inset;       
    
    insize = size - [2 * wall, 2 * wall, 2 * wall];
    
    pcb_xs = [-0.5 * pcb_mounting_x + pcb_offset_x, 0.5 * pcb_mounting_x + pcb_offset_x];
    pcb_ys = [-0.5 * pcb_mounting_y + pcb_offset_y, 0.5 * pcb_mounting_y + pcb_offset_y];
        
    difference() {
    
        union() {
            difference()  {
                // main box
                cuboid(size, fillet=0.5);

                // hollowed out
                cuboid(insize);
                
                // Cable grommet
                xcyl(l = big, d = grommet_small, center=false);
                right(0.5 * size[0] - (wall - grommet_width))
                    xcyl(l = wall, d = grommet_big, center = false);
            };  
    
            // Mounting standoffs for PCB
            grid3d(xa = pcb_xs,
                   ya = pcb_ys,
                   za=[-0.5 * size[2]])
                cyl(h = standoff_h, d = standoff_d, center=false);
            
            // Screws to hold case together
            intersection() {
                cuboid(size, fillet=0.5);
                grid3d(xa=[-cs_dx,cs_dx], ya=[-cs_dy,cs_dy], za=[-0.5 * size[2]])
                  cyl(h = size[2], d = case_screw_diameter, center=false);
            };
            
        };
        
        // PCB
        span_cube([-bd_dx + pcb_offset_x, bd_dx + pcb_offset_x],
                  [-bd_dy + pcb_offset_y, bd_dy + pcb_offset_y], [
                -0.5 * size[2] + standoff_h,0]);
        
        // Holes in PCB standoffs        
        grid3d(xa=pcb_xs,
               ya=pcb_ys,
               za=[0])
               union() { 
                   down(0.5 * size[2] + delta)
                   union() {
                       cyl(h = standoff_h + 2 * delta, d=screw_d_thread, center=false);
                       cyl(h = screw_h_head + delta,   d=screw_d_head,   center=false);
                   }
               };
               
        // Holes for case screws
        grid3d(xa=[-cs_dx,cs_dx], ya=[-cs_dy,cs_dy], za=[0])
               union() {
                   cyl(h = 2 * big, d=screw_d_thread, center=true);
                   down(big)
                   cyl(h = big - 0.5 * size[2] + screw_h_head,   d=screw_d_head,   center=false);
                   zflip()
                   down(big)
                   cyl(h = big - 0.5 * size[2] + nut_h_head,     d=nut_d_head,     center=false, $fn=6);
               };       
    };
      
            


};


module teeth(xp,yp,xn,yn,pdir) {
    dx = 0.5 * (size[0] - wall);
    dy = 0.5 * (size[1] - wall);
    tlp = 0.5 * (teeth_l - teeth_space);
    tln = 0.5 * (teeth_l + teeth_space);
    twp = 0.5 * (teeth_w - teeth_space);
    twn = 0.5 * (teeth_w + teeth_space);
       
    difference() { 
        union() {
            children();
            grid3d(xa=xp,ya=[-dy,dy],za=[0])
                span_cube([-tlp,tlp],[-twp,twp],[0,pdir * (teeth_h - teeth_space)]); 
            grid3d(xa=[-dx,dx],ya=yp,za=[0])
                span_cube([-twp,twp],[-tlp,tlp],[0,pdir * (teeth_h - teeth_space)]); 
        };
        grid3d(xa=xn,ya=[-dy,dy],za=[0])
            span_cube([-tln,tln],[-twn,twn],[0,-pdir * (teeth_h + teeth_space)]); 
        grid3d(xa=[-dx,dx],ya=yn,za=[0])
                span_cube([-twn,twn],[-tln,tln],[0,-pdir * (teeth_h + teeth_space)]); 
    };
}

module usbslot() {
      span_cube([-(0.5 * size[0] + 1),-(0.5 * size[0] - wall - 1)],
                [-0.5 * usb_width,0.5 * usb_width],
                [-(0.5 * size[2] - wall - usb_step),1]);
};

module bb() {
    teeth(teetha_xs, teetha_ys, teethb_xs, teethb_ys, 1.0)
    intersection() {
        b(); 
        difference() {
            downcube(big);
            usbslot();
        };
    };
};
    
module bt() {
    teeth(teethb_xs, teethb_ys, teetha_xs, teetha_ys, -1.0)
    intersection() {
        b(); 
        union() {
            upcube(big);
            usbslot();
        };
    };
};
    

ydistribute(spacing=60) {
bb();   
xrot(180) bt();
};

