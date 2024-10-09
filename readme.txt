The scene layout is just one section of a level of ice climbers. Nana and Popo are to the right, on a ledge with a moving cloud in the middle, and some icy floors.



My Toon shader is called CelShading.shader, and is on the cloud.

	i do this because it is a dynamic element in the scene, and thus the shading changes on them based on how 	it is moving, compared to the walls and floors which would remain statically coloured.

Colour Grading is implemented, but i had issues changing it to cooler colours. i am just using the default LUT given in week 5's  lecture. It also doesn't look that great with my Ice shader i made, so i kept the contribution value low. 

For my personal shader, i made an Ice shader in Shadergraph. It is pretty simple:

	First, i wanted the colour to change with elevation, so i take the objects world y position, and map it to 	the range 0-1, allowing me to use it as the uv/time parameter for a SampleGradient.

	i then give it a little bit of transparency using some noise. i combine a Voronoi and gradient noise node by 	multiplying them, then map the result to a smaller range to set a minimum opacity. i then apply this to the 	alpha of my fragment shader.

	Finally, i have parameters for the metallic and specular for the ice which the user can just set.

