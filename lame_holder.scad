lame_blade_volume = [50, 30, 15];
wall_width = 1;
outer_box_volume = lame_blade_volume + [wall_width * 2, wall_width * 2, wall_width];
lame_shaft_width = 10;
lame_shaft_thickness = 3;
foot_height = 2;
foot_extent_outside_box = 7.5;

module lame_shaft()
{
    cube([100, lame_shaft_width, 100]);
}

module lame_blade ()
{
    cube(lame_blade_volume);
}

module outer_box()
{
    cube(outer_box_volume);
}

module foot()
{
    cube([outer_box_volume.x, outer_box_volume.y, foot_height] + [foot_extent_outside_box * 2, foot_extent_outside_box * 2, 0]);
}

module lame_shape()
{
    lame_blade();
    translate([-25, lame_blade_volume[1] / 2 - lame_shaft_width / 2, 0]) lame_shaft ();
}

module holder()
{
    foot();
    translate([foot_extent_outside_box, foot_extent_outside_box, foot_height]) difference() {
        outer_box();
        translate([wall_width, wall_width, wall_width]) lame_shape();
    };
}

holder();
