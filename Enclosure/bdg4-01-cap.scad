// === BOSL2 Imports ===
include <BOSL/constants.scad>;
include <BOSL/transforms.scad>;
include <BOSL/masks.scad>;
include <BOSL/math.scad>;
include <BOSL/threading.scad>;

// === Threaded Cylinder Module ===
module threaded_cylinder(inner_diameter, height, thread_diameter, thread_length, thread_pitch, wall_thickness) {
    union() {
        // Outer cylinder body (threaded section excluded)
        outer_radius = (inner_diameter / 2) + wall_thickness;
        cylinder(d=outer_radius * 2, h=height - thread_length, center=false);
        
        // External thread at top
        translate([0, 0, height - thread_length])
            metric_trapezoidal_threaded_rod(d=thread_diameter, l=thread_length, pitch=thread_pitch, left_handed=false, starts=1, bevel=true);
    }
}

// === Parameters ===
inner_diameter = 50;         // Inner cylinder diameter (same as the first cylinder)
wall_thickness = 2;          // Wall thickness (2mm)
height = 50;                 // Cylinder height (50mm long)
thread_diameter = 52;        // Thread diameter to match the outer diameter of the first cylinder (52mm)
thread_length = 30;          // Length of the thread section
thread_pitch = 2;            // Thread pitch in mm

// === Call the Module ===
threaded_cylinder(inner_diameter, height, thread_diameter, thread_length, thread_pitch, wall_thickness);
