//color shader for anti-aliased sprites - add to Sprite2D overlaying the sprite
//change the color of pure RGB colors to be any color you want. accounts for an outline's anti-aliasing
//change colors by modulating Sprite texture
shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
    vec3 data = textureLod(screen_texture, SCREEN_UV, 0.0).rgb;
    if ((data.r < 0.06 || data.b < 0.06) && data.g > 0.1) { //green part
        COLOR *= texture(TEXTURE, SCREEN_UV/10.0) * vec4(0.1+data.g,0.1+data.g,0.1+data.g,1); //multiply to bring back anti-aliasing
    }
    //if you want to do the red channel instead:
    //if ((data.g < 0.06 || data.b < 0.06) && data.r > 0.1) {
    //    COLOR = texture(third_texture, SCREEN_UV/10.0) * vec4(0.1+data.r,0.1+data.r,0.1+data.r,1);
    //}
    else { //shader doesn't affect anything else
        discard;
    }
}