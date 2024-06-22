CSD1   7c06a2f395ac59bf0ab1199001d48229    cX     @      �X  `    k  z  �    �  �  �    �  �  Q    \  �  �    �  �  �    �  �   �    �    �%    �&    �'    �(    �+    -  �  �4    �5  �  �7    �8  p  4;    ?<  �  �>    �?  �  ]B    hC  �  �K    M  �  �O    �P  
  �R    �S  �  #version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

uniform float gamma;
in vec2 ps_texcoord;
out vec4 oColor;

void main()
{
	vec4 color = texture(texture0, ps_texcoord);
		for(int i = 0; i < 4; i++)
			oColor[i] = pow(color[i], 1.0/gamma);
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

void main()
{
	float offset[5] = float[]( 0.0, 1.0, 2.0, 3.0, 4.0 );
		float weight[5] = float[]( 0.2270270270, 0.1945945946, 0.1216216216, 0.0540540541, 0.0162162162 );
	
		vec4 outcolor = texture(texture0, ps_texcoord)*weight[0];
		for(int i = 1; i < 5; i++)
		{
			outcolor += texture(texture0, ps_texcoord+vec2(offset[i], 0))*weight[i];
			outcolor += texture(texture0, ps_texcoord-vec2(offset[i], 0))*weight[i];
		}
		oColor = outcolor * color;
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

void main()
{
	float offset[5] = float[]( 0.0, 1.0, 2.0, 3.0, 4.0 );
		float weight[5] = float[]( 0.2270270270, 0.1945945946, 0.1216216216, 0.0540540541, 0.0162162162 );
	
		vec4 outcolor = texture(texture0, ps_texcoord)*weight[0];
		for(int i = 1; i < 5; i++)
		{
			outcolor += texture(texture0, ps_texcoord+vec2(0, offset[i]))*weight[i];
			outcolor += texture(texture0, ps_texcoord-vec2(0, offset[i]))*weight[i];
		}
		oColor = outcolor * color;
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

uniform float offset;
in vec2 ps_texcoord;
out vec4 oColor;

void main()
{
	vec2 texc = ps_texcoord;
		texc.x += (sin(texc.y * 0.03 + offset) * 10) * color.a;

		oColor = texture(texture0, texc) * color;
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

uniform sampler2DRect blurtexture;
in vec2 ps_texcoord;
out vec4 oColor;

void main()
{
	vec4 maintex = texture(texture0, ps_texcoord);
		vec4 blurtex = texture(blurtexture, ps_texcoord);
		oColor = maintex*(1.0-color.a)+blurtex*(color.a);
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

void main()
{
	oColor = color;
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float timer;

const float permTexUnit = 1.0/256.0;		// Perm texture texel-size
const float permTexUnitHalf = 0.5/256.0;	// Half perm texture texel-size

const float grainamount = 0.05; //grain amount
float grainsize = 1.6; //grain particle size (1.5 - 2.5)
float lumamount = 1.0; //
float coloramount = 0.6;

//a random texture generator, but you can also use a pre-computed perturbation texture
vec4 rnm(in vec2 tc) 
{
    float noise =  sin(dot(tc + vec2(timer,timer),vec2(12.9898,78.233))) * 43758.5453;

	float noiseR =  fract(noise)*2.0-1.0;
	float noiseG =  fract(noise*1.2154)*2.0-1.0; 
	float noiseB =  fract(noise*1.3453)*2.0-1.0;
	float noiseA =  fract(noise*1.3647)*2.0-1.0;
	
	return vec4(noiseR,noiseG,noiseB,noiseA);
}

float fade(in float t) {
	return t*t*t*(t*(t*6.0-15.0)+10.0);
}

float pnoise3D(in vec3 p)
{
	vec3 pi = permTexUnit*floor(p)+permTexUnitHalf; // Integer part, scaled so +1 moves permTexUnit texel
	// and offset 1/2 texel to sample texel centers
	vec3 pf = fract(p);     // Fractional part for interpolation

	// Noise contributions from (x=0, y=0), z=0 and z=1
	float perm00 = rnm(pi.xy).a ;
	vec3  grad000 = rnm(vec2(perm00, pi.z)).rgb * 4.0 - 1.0;
	float n000 = dot(grad000, pf);
	vec3  grad001 = rnm(vec2(perm00, pi.z + permTexUnit)).rgb * 4.0 - 1.0;
	float n001 = dot(grad001, pf - vec3(0.0, 0.0, 1.0));

	// Noise contributions from (x=0, y=1), z=0 and z=1
	float perm01 = rnm(pi.xy + vec2(0.0, permTexUnit)).a ;
	vec3  grad010 = rnm(vec2(perm01, pi.z)).rgb * 4.0 - 1.0;
	float n010 = dot(grad010, pf - vec3(0.0, 1.0, 0.0));
	vec3  grad011 = rnm(vec2(perm01, pi.z + permTexUnit)).rgb * 4.0 - 1.0;
	float n011 = dot(grad011, pf - vec3(0.0, 1.0, 1.0));

	// Noise contributions from (x=1, y=0), z=0 and z=1
	float perm10 = rnm(pi.xy + vec2(permTexUnit, 0.0)).a ;
	vec3  grad100 = rnm(vec2(perm10, pi.z)).rgb * 4.0 - 1.0;
	float n100 = dot(grad100, pf - vec3(1.0, 0.0, 0.0));
	vec3  grad101 = rnm(vec2(perm10, pi.z + permTexUnit)).rgb * 4.0 - 1.0;
	float n101 = dot(grad101, pf - vec3(1.0, 0.0, 1.0));

	// Noise contributions from (x=1, y=1), z=0 and z=1
	float perm11 = rnm(pi.xy + vec2(permTexUnit, permTexUnit)).a ;
	vec3  grad110 = rnm(vec2(perm11, pi.z)).rgb * 4.0 - 1.0;
	float n110 = dot(grad110, pf - vec3(1.0, 1.0, 0.0));
	vec3  grad111 = rnm(vec2(perm11, pi.z + permTexUnit)).rgb * 4.0 - 1.0;
	float n111 = dot(grad111, pf - vec3(1.0, 1.0, 1.0));

	// Blend contributions along x
	vec4 n_x = mix(vec4(n000, n001, n010, n011), vec4(n100, n101, n110, n111), fade(pf.x));

	// Blend contributions along y
	vec2 n_xy = mix(n_x.xy, n_x.zw, fade(pf.y));

	// Blend contributions along z
	float n_xyz = mix(n_xy.x, n_xy.y, fade(pf.z));

	// We're done, return the final noise value.
	return n_xyz;
}

//2d coordinate orientation thing
vec2 coordRot(in vec2 tc, in float angle)
{
	float aspect = screenwidth/screenheight;
	float rotX = ((tc.x*2.0-1.0)*aspect*cos(angle)) - ((tc.y*2.0-1.0)*sin(angle));
	float rotY = ((tc.y*2.0-1.0)*cos(angle)) + ((tc.x*2.0-1.0)*aspect*sin(angle));
	rotX = ((rotX/aspect)*0.5+0.5);
	rotY = rotY*0.5+0.5;
	return vec2(rotX,rotY);
}
void main()
{
	vec2 norm_texcoords = vec2(ps_texcoord.x/screenwidth, ps_texcoord.y/screenheight);
	
		vec3 rotOffset = vec3(1.425,3.892,5.835); //rotation offset values	
		vec2 rotCoordsR = coordRot(norm_texcoords, timer*0.25 + rotOffset.x);
		vec2 rotCoordsG = coordRot(norm_texcoords, timer*0.25 + rotOffset.y);
		vec2 rotCoordsB = coordRot(norm_texcoords, timer*0.25 + rotOffset.z);
		
		vec3 noise;
		noise.r = vec3(pnoise3D(vec3(rotCoordsR*vec2(screenwidth/grainsize,screenheight/grainsize),0.0))).r;
		noise.g = mix(noise.r,pnoise3D(vec3(rotCoordsG*vec2(screenwidth/grainsize,screenheight/grainsize),1.0)), coloramount);
		noise.b = mix(noise.r,pnoise3D(vec3(rotCoordsB*vec2(screenwidth/grainsize,screenheight/grainsize),2.0)), coloramount);
		
		vec3 col = texture(texture0, ps_texcoord).rgb;

		//noisiness response curve based on scene luminance
		vec3 lumcoeff = vec3(0.299,0.587,0.114);
		float luminance = mix(0.0,dot(col, lumcoeff),lumamount);
		luminance = clamp(luminance, 0.25, 0.75);
		float lum = smoothstep(0.2,0.0,luminance);
		lum += luminance;

		noise = mix(noise,vec3(0.0),pow(lum,4.0));
		col = col+noise*grainamount;
	   
		oColor =  vec4(col,1.0);	
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

void main()
{
	oColor = texture(texture0, ps_texcoord);
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float chromaticStrength;
void main()
{
	vec2 offsetR = vec2(chromaticStrength / screenwidth, 0.0);
    vec2 offsetG = vec2(-chromaticStrength / screenwidth, 0.0);
    vec2 offsetB = vec2(0.0, chromaticStrength / screenheight);
    vec4 colorR = texture(texture0, ps_texcoord + offsetR);
    vec4 colorG = texture(texture0, ps_texcoord + offsetG);
    vec4 colorB = texture(texture0, ps_texcoord + offsetB);
    oColor.r = colorR.r;
    oColor.g = colorG.g;
    oColor.b = colorB.b;
    oColor.a = (colorR.a + colorG.a + colorB.a) / 3.0;
    }
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float FXAAStrength;
void main()
{
	vec2 texelSize = 1.0 / vec2(screenwidth, screenheight);
    vec4 color = texture(texture0, ps_texcoord);
    vec2 texCoord = ps_texcoord;

    vec3 rgbNW = texture(texture0, texCoord + vec2(-1, -1) * texelSize).rgb;
    vec3 rgbNE = texture(texture0, texCoord + vec2(1, -1) * texelSize).rgb;
    vec3 rgbSW = texture(texture0, texCoord + vec2(-1, 1) * texelSize).rgb;
    vec3 rgbSE = texture(texture0, texCoord + vec2(1, 1) * texelSize).rgb;
    vec3 rgbM = texture(texture0, texCoord).rgb;

    vec3 luma = vec3(0.299, 0.587, 0.114);
    float lumaNW = dot(rgbNW, luma);
    float lumaNE = dot(rgbNE, luma);
    float lumaSW = dot(rgbSW, luma);
    float lumaSE = dot(rgbSE, luma);
    float lumaM = dot(rgbM, luma);

    float lumaMin = min(lumaM, min(min(lumaNW, lumaNE), min(lumaSW, lumaSE)));
    float lumaMax = max(lumaM, max(max(lumaNW, lumaNE), max(lumaSW, lumaSE)));

    vec2 dir = vec2(-((lumaNW + lumaNE) - (lumaSW + lumaSE)), ((lumaNW + lumaSW) - (lumaNE + lumaSE)));
    float dirReduce = max((lumaNW + lumaNE + lumaSW + lumaSE) * (0.25 * FXAAStrength), 0.001);
    float rcpDirMin = 1.0 / min(abs(dir.x), abs(dir.y));
    dir = min(vec2(FXAAStrength), max(vec2(-FXAAStrength), dir * rcpDirMin)) * dirReduce;

    vec3 rgbA = 0.5 * (texture(texture0, texCoord + dir * (1.0 / 3.0 - 0.5)).rgb + 
                       texture(texture0, texCoord + dir * (2.0 / 3.0 - 0.5)).rgb);
    vec3 rgbB = rgbA * 0.5 + 0.25 * (texture(texture0, texCoord + dir * -0.5).rgb + 
                                      texture(texture0, texCoord + dir * 0.5).rgb);

    float lumaB = dot(rgbB, luma);
    oColor = vec4((lumaB < lumaMin || lumaB > lumaMax) ? rgbA : rgbB, color.a);
}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float BWStrength;
void main()
{
	vec4 color = texture(texture0, ps_texcoord);
    float luminance = 0.3 * color.r + 0.59 * color.g + 0.11 * color.b;
    vec4 grayscaleColor = vec4(vec3(luminance), color.a);
    oColor = mix(color, grayscaleColor, BWStrength);
    }
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float bleachStrength;
void main()
{
	vec4 color = texture(texture0, ps_texcoord);
        float grayscale = dot(color.rgb, vec3(0.299, 0.587, 0.114));
        vec3 desaturatedColor = mix(color.rgb, vec3(grayscale), bleachStrength);
        vec3 contrastColor = desaturatedColor * bleachStrength + (1.0 - bleachStrength) * desaturatedColor;
        oColor = vec4(contrastColor, color.a);
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

const float bloomThreshold = 0.5;
uniform float bloomStrength;
void main()
{
	vec4 color = texture(texture0, ps_texcoord);
vec4 brightColor = max(color - vec4(bloomThreshold), vec4(0.0));

// Amplify bloom effect for bright areas
vec4 bloomColor = brightColor * bloomStrength;

// Ensure the bloom effect does not exceed original color
bloomColor = min(bloomColor, vec4(1.0));

oColor = color + bloomColor;
}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float vignetteStrength;
uniform float vignetteRadius;
void main()
{
	vec4 color = texture(texture0, ps_texcoord);
    vec2 uv = vec2(ps_texcoord.x / screenwidth, ps_texcoord.y / screenheight);
    vec2 centeredUV = uv - vec2(0.5, 0.5);
    float distance = length(centeredUV);
    float vignette = smoothstep(vignetteRadius, vignetteRadius - vignetteStrength, distance);
    color.rgb *= vignette;
    oColor = color;
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float SSAORadius;
uniform float SSAOStrength;
void main()
{
	vec2 texelSizeSSAO = 1.0 / vec2(screenwidth, screenheight);
    vec3 rgbM_SSAO = texture(texture0, ps_texcoord).rgb;
    vec3 rgbNW_SSAO = texture(texture0, ps_texcoord + vec2(-1, -1) * texelSizeSSAO).rgb;
    vec3 rgbNE_SSAO = texture(texture0, ps_texcoord + vec2(1, -1) * texelSizeSSAO).rgb;
    vec3 rgbSW_SSAO = texture(texture0, ps_texcoord + vec2(-1, 1) * texelSizeSSAO).rgb;
    vec3 rgbSE_SSAO = texture(texture0, ps_texcoord + vec2(1, 1) * texelSizeSSAO).rgb;

    vec3 luma_SSAO = vec3(0.299, 0.587, 0.114);
    float lumaNW_SSAO = dot(rgbNW_SSAO, luma_SSAO);
    float lumaNE_SSAO = dot(rgbNE_SSAO, luma_SSAO);
    float lumaSW_SSAO = dot(rgbSW_SSAO, luma_SSAO);
    float lumaSE_SSAO = dot(rgbSE_SSAO, luma_SSAO);
    float lumaM_SSAO = dot(rgbM_SSAO, luma_SSAO);

    float lumaMin_SSAO = min(lumaM_SSAO, min(min(lumaNW_SSAO, lumaNE_SSAO), min(lumaSW_SSAO, lumaSE_SSAO)));
    float lumaMax_SSAO = max(lumaM_SSAO, max(max(lumaNW_SSAO, lumaNE_SSAO), max(lumaSW_SSAO, lumaSE_SSAO)));

    vec2 dir_SSAO = vec2(-((lumaNW_SSAO + lumaNE_SSAO) - (lumaSW_SSAO + lumaSE_SSAO)), ((lumaNW_SSAO + lumaSW_SSAO) - (lumaNE_SSAO + lumaSE_SSAO)));
    float dirReduce_SSAO = max((lumaNW_SSAO + lumaNE_SSAO + lumaSW_SSAO + lumaSE_SSAO) * (0.25 * SSAOStrength), 0.001);
    float rcpDirMin_SSAO = 1.0 / min(abs(dir_SSAO.x), abs(dir_SSAO.y));
    dir_SSAO = min(vec2(SSAOStrength), max(vec2(-SSAOStrength), dir_SSAO * rcpDirMin_SSAO)) * dirReduce_SSAO;

    vec3 rgbA_SSAO = texture(texture0, ps_texcoord + dir_SSAO * (1.0 / 3.0 - 0.5) * SSAORadius).rgb;
    vec3 rgbB_SSAO = texture(texture0, ps_texcoord + dir_SSAO * (2.0 / 3.0 - 0.5) * SSAORadius).rgb;

    float lumaB_SSAO = dot(rgbB_SSAO, luma_SSAO);

    float edgeDarken = smoothstep(0.2, 0.5, (lumaB_SSAO - lumaMin_SSAO) / (lumaMax_SSAO - lumaMin_SSAO));

    oColor = vec4(mix(rgbB_SSAO, rgbA_SSAO, edgeDarken), 1.0);
}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float underExposure;
uniform float overExposure;
vec3 ACESFilm(vec3 x)
{
    float a = 2.51;
    float b = 0.03;
    float c = 2.43;
    float d = 0.59;
    float e = 0.14;
    return clamp((x*(a*x+b))/(x*(c*x+d)+e), 0.0, 1.0);
}
void main()
{
	vec3 color = texture(texture0, ps_texcoord).rgb;
    color *= exp2(overExposure);
    color = ACESFilm(color);
    color *= exp2(underExposure);
    oColor = vec4(color, 1.0);
	}
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float sepiaStrength;
void main()
{
	vec4 color = texture(texture0, ps_texcoord);
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    vec3 sepiaColor = vec3(1.0, 0.95, 0.82);
    vec3 sepia = mix(vec3(gray), sepiaColor, sepiaStrength);
    oColor = vec4(sepia, color.a);
    }
#version 460

uniform mat4 projection;
uniform mat4 modelview;

in vec4 in_position;
in vec2 in_texcoord;

out vec2 ps_texcoord;

void main()
{
	ps_texcoord = in_texcoord;
	vec4 position = in_position*modelview;;
	gl_Position = position*projection;
}
#version 460
#extension GL_ARB_texture_rectangle : enable

uniform sampler2DRect texture0;
uniform vec4 color;
uniform float screenwidth;
uniform float screenheight;

in vec2 ps_texcoord;
out vec4 oColor;

uniform float bokehStrength;
uniform float bokehRadius;
void main()
{
	vec4 color = texture(texture0, ps_texcoord);
    const int kernelSize = 13;
    float kernel[kernelSize];
    kernel[0] = 0.006;
    kernel[1] = 0.061;
    kernel[2] = 0.242;
    kernel[3] = 0.383;
    kernel[4] = 0.242;
    kernel[5] = 0.061;
    kernel[6] = 0.006;
    vec3 outColor = vec3(0.0);
    for (int i = -kernelSize/2; i <= kernelSize/2; ++i) {
        outColor += texture(texture0, ps_texcoord + vec2(float(i) / screenwidth, 0.0)).rgb * kernel[i + kernelSize/2];
    }
    for (int i = -kernelSize/2; i <= kernelSize/2; ++i) {
        outColor += texture(texture0, ps_texcoord + vec2(0.0, float(i) / screenheight)).rgb * kernel[i + kernelSize/2];
    }
    vec2 uv = ps_texcoord * 2.0 - 1.0;
    float distance = length(uv);
    float bokeh = smoothstep(0.0, bokehRadius, distance);
    outColor *= bokehStrength * bokeh;
    oColor = vec4(outColor, 1.0);
}
pp_type                            �X                   	 
        