function generaterandom_dataermutation_array_seeded (seed) {
	    var arr = array_create(512);
	    var perm = array_create(256);

	    // Set seed for deterministic randomness
	    random_set_seed(seed);
    
	    // Fill with values 0 to 255
	    for (var i = 0; i < 256; i++) {
	        perm[i] = i;
	    }
    
	    // Shuffle the array using Fisher-Yates
	    for (var i = 255; i > 0; i--) {
	        var j = irandom(i);
	        var temp = perm[i];
	        perm[i] = perm[j];
	        perm[j] = temp;
	    }

		// Copy into result array
		for (var i = 0; i < 256; i++) {
			arr[i] = perm[i];
			arr[i + 256] = perm[i];
		}

		return arr;
}

time_seed = date_get_second((date_current_datetime()));
random_data = generaterandom_dataermutation_array_seeded(time_seed);

function perlin_noise(_x, _y = 70.213, _z = 123.9774) {

    static _fade = function(_t) {
        return _t * _t * _t * (_t * (_t * 6 - 15) + 10);
    }

	static _lerp = function(_t, _a, _b) { 
		return _a + _t * (_b - _a); 
	}

    static _grad = function(_hash, _x, _y, _z) {
        var _h, _u, _v;
        _h = _hash & 15;                       // CONVERT 4 BITS OF HASH CODE
        _u = (_h < 8) ? _x : _y;                 // INTO 12 GRADIENT DIRECTIONS.
        if (_h < 4) {
            _v = _y;
        } else if ((_h == 12) || (_h == 14)) {
            _v = _x;
        } else {
            _v = _z;
        }
		if ((_h & 1) != 0) {
			_u = -_u;
		}
		if ((_h & 2) != 0) {
			_v = -_v;
		}		
        return _u + _v;
    }

    var _X, _Y, _Z;
    _X = floor(_x);
    _Y = floor(_y);
    _Z = floor(_z);
    
    _x -= _X;
    _y -= _Y;
    _z -= _Z;
    
    _X = _X & 255;
    _Y = _Y & 255;
    _Z = _Z & 255;
    
    var _u, _v, _w;
    _u = _fade(_x);
    _v = _fade(_y);
    _w = _fade(_z);
    
    var A, AA, AB, B, BA, BB;
    A  = random_data[_X]+_Y;
    AA = random_data[A]+_Z;
    AB = random_data[A+1]+_Z;
    B  = random_data[_X+1]+_Y;
    BA = random_data[B]+_Z;
    BB = random_data[B+1]+_Z;

	//returns a number between -1 and 1
    return _lerp(_w, _lerp(_v, _lerp(_u,_grad(random_data[AA  ], _x  , _y  , _z   ),  // AND ADD
										_grad(random_data[BA  ], _x-1, _y  , _z   )), // BLENDED
                             _lerp(_u,	_grad(random_data[AB  ], _x  , _y-1, _z   ),  // RESULTS
										_grad(random_data[BB  ], _x-1, _y-1, _z   ))),// FROM  8
                    _lerp(_v, _lerp(_u,	_grad(random_data[AA+1], _x  , _y  , _z-1 ),  // CORNERS
										_grad(random_data[BA+1], _x-1, _y  , _z-1 )), // OF CUBE
                             _lerp(_u,	_grad(random_data[AB+1], _x  , _y-1, _z-1 ),
										_grad(random_data[BB+1], _x-1, _y-1, _z-1 )))); 

}

// World generation parameters
var grid_size = 64; // Size of each tile (match your cavewall sprite size)
var world_width = ceil(room_width / grid_size);
var world_height = ceil(room_height / grid_size);
var threshold = 0.5; // Threshold for placing a cavewall tile

// Create a grid to store terrain data
terrain_grid = ds_grid_create(world_width, world_height);

// Generate base terrain using noise
for (var xx = 0; xx < world_width; xx++) {
    for (var yy = 0; yy < world_height; yy++) {
        // Create more interesting terrain with multiple noise frequencies
		var noise = perlin_noise(xx * (400.0)) * 1.0 +
        perlin_noise(xx * (200.0)) * 0.5 +
        //perlin_noise(xx * (80.0))  * 0.25 +
        perlin_noise(xx * (47.5))  * 0.125;
        
        // Combine noise layers
        //var combined_noise = (noise1 + noise2) / 1.5;
        
        // Add a gradient that increases with depth (y-position)
        // This makes the bottom of the room more likely to have terrain
        var depth_factor = yy / world_height * 0.7;
        noise += depth_factor;
        
        // Store terrain value
        terrain_grid[# xx, yy] = noise;
    }
}




// Place cavewall tiles based on terrain values
for (var xx = 0; xx < world_width; xx++) {
	var y_start = 3 + irandom(7);
	var biome_variance = irandom(4);
    for (var yy = y_start; yy < world_height; yy++) {
		

		
        var terrain_value = terrain_grid[# xx, yy];
        
        // If terrain value exceeds threshold, place a cavewall
        if (terrain_value > threshold) {
            var xworld = xx * grid_size;
            var yworld = yy * grid_size;
            var terrain = instance_create_layer(xworld, yworld, "TerrainLayer", Terrain); 
			
			if (yy <= 15 + biome_variance) {
				terrain.sprite_index = terrain_light;
			} else if (15 + biome_variance < yy && yy < 25 + biome_variance) {
				terrain.sprite_index = terrain_middle;
			} else {
				terrain.sprite_index = terrain_darkest;
			}
        }
    }
}


// Clean up the grid once we're done with it
ds_grid_destroy(terrain_grid);


