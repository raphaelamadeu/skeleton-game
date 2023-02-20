// Script assets have changed for v2.3.0 see

// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

var _dt = delta_time / 10000;
function moveAndCollide(distance){
    if !place_meeting(x + distance, y, o_wall) {
        return;
    }

    x += distance * _dt;   
}
