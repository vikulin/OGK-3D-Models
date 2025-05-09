// === BOSL Imports ===
include <BOSL/constants.scad>;
include <BOSL/transforms.scad>;
include <BOSL/masks.scad>;
include <BOSL/math.scad>;
include <BOSL/threading.scad>;

// Parameters
inner_diameter = 50;
wall_thickness = 2;
height = 300;

// Thread parameters
thread_diameter = 52;      // Thread base diameter (slightly larger than outer diameter)
thread_length = 30;        // Length of the thread
thread_pitch = 2;          // Thread pitch in mm

// Outer and inner radii
outer_radius = (inner_diameter / 2) + wall_thickness;
inner_radius = inner_diameter / 2;

// Outer cylinder (including walls)
difference() {
    // Outer cylinder body (smooth outer wall)
    cylinder(h = height, r = outer_radius, $fn = 100);
    
    // Inner hollow part (open from bottom, so move up)
    translate([0, 0, wall_thickness])
        cylinder(h = height - wall_thickness, r = inner_radius, $fn = 100);
    
    // External thread at the open side (top)
    translate([0, 0, height - thread_length/2]) {
        // Create external thread (make sure thread diameter is slightly larger than outer diameter)
        metric_trapezoidal_threaded_rod(d=thread_diameter, l=thread_length, pitch=thread_pitch, left_handed=false, starts=1, bevel=true);
    }
}
