#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aColor;
layout (location = 2) in vec2 aTexCoord;

uniform vec3 epicValue;

uniform sampler2D texture1;
uniform sampler2D texture2;

out vec3 ourColor;
out vec2 TexCoord1;
out vec2 TexCoord2;

void main()
{
	gl_Position = vec4(aPos, 1.0);
	ourColor = aColor;
    TexCoord1 = vec2(aTexCoord.x, aTexCoord.y);
	TexCoord2 = vec2(aTexCoord.x * epicValue.x, aTexCoord.y * epicValue.y);
}