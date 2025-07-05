#version 330 core
out vec4 FragColor;

in vec3 ourColor;
in vec2 TexCoord1;
in vec2 TexCoord2;

// texture sampler
uniform sampler2D texture1;
uniform sampler2D texture2;
uniform vec3 epicValue;

void main()
{
    FragColor = mix(texture(texture1, TexCoord1), ((vec4(epicValue, 1.0) * 5.) * texture(texture2, TexCoord2)), 0.2);
}