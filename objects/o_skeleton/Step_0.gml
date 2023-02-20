/// @description Insert description here
// You can write your code in this editor
var _dt = delta_time / 10000

function canMoveForward (mov_size) {
    return !place_meeting(x + mov_size, y, o_wall)
}

switch (state) {
    case "move":
        if keyboard_check(vk_right) and canMoveForward(4) {
            x += 2.5 * _dt;
            image_xscale = 1;
            sprite_index = s_skeleton_run;
            image_speed = .5;
        } else if keyboard_check(vk_left) and canMoveForward(-4){
            x -= 2.5 * _dt;
            image_xscale = -1;
            sprite_index = s_skeleton_run;
            image_speed = .5;
        } else {
            sprite_index = s_skeleton_idle;
            image_speed = .4;
        }

        if keyboard_check_pressed(vk_space) {
            image_index = 0;
            state = "roll";
        }

        if keyboard_check_pressed(vk_control) {
            image_index = 0;
            state = "attack_one";
        }
        break;

    case "roll":
        sprite_index = s_skeleton_roll;
        image_speed = 0.6;
        var roll_size = 4;

        if canMoveForward((roll_size * image_xscale)) {
            x += roll_size * image_xscale * _dt;
        }
        break;

    case "attack_one":
        sprite_index = s_skeleton_attack_one
        image_speed = 0.6;

        if canMoveForward(.5 * image_xscale) {
            x += .5 * image_xscale * _dt;
        }

        if keyboard_check_pressed(vk_control) {
            image_index = 0;
            state = "attack_two";
        }

        break;

    case "attack_two":
        sprite_index = s_skeleton_attack_two
            image_speed = 0.6;

        if canMoveForward(.5 * image_xscale) {
            x += .5 * image_xscale * _dt;
        }

        if keyboard_check_pressed(vk_control) {
            image_index = 0;
            state = "attack_three";
        }

        break;

    case "attack_three":
        sprite_index = s_skeleton_attack_three
            image_speed = 0.6;

        if canMoveForward(.5 * image_xscale) {
            x += .5 * image_xscale * _dt;
        }

        break;

}
