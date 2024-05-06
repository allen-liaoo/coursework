/* Assignment 3: Earthquake Visualization Support Code
 * UMN CSci-4611 Instructors 2012+
 * GopherGfx implementation by Evan Suma Rosenberg <suma@umn.edu> 2022
 * License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
 * Please do not distribute beyond the CSci-4611 course
 */ 

import * as gfx from 'gophergfx'
import { EarthquakeMarker } from './EarthquakeMarker';
import { EarthquakeRecord } from './EarthquakeRecord';

export class Earth extends gfx.Node3
{
    private earthMesh: gfx.MorphMesh3;
    private morphElapsedTime: number;

    public globeMode: boolean;

    constructor()
    {
        // Call the superclass constructor
        super();

        this.earthMesh = new gfx.MorphMesh3();
        this.morphElapsedTime = 0;

        this.globeMode = false;
    }

    public createMesh() : void
    {
        // Initialize texture: you can change to a lower-res texture here if needed
        // Note that this won't display properly until you assign texture coordinates to the mesh
        this.earthMesh.material.texture = new gfx.Texture('./assets/earth-2k.png');
        
        // This disables mipmapping, which makes the texture appear sharper
        this.earthMesh.material.texture.setMinFilter(true, false);   

        // You can use this variable to define the resolution of your flat map and globe map
        // using a nested loop. 20x20 is reasonable for a good looking sphere, and you don't
        // need to change this constant to complete the base assignment.
        const meshResolution = 20;
        
        // Precalculated vertices and normals for the earth plane mesh.
        // After we compute them, we can store them directly in the earthMesh,
        // so they don't need to be member variables.
        const mapVertices: gfx.Vector3[] = [];
        const mapNormals: gfx.Vector3[] = [];
        const globeVertices: gfx.Vector3[] = [];
        const globeNormals: gfx.Vector3[] = [];

        // Part 1: Creating the Flat Map Mesh
        // To demo, we'll add a rectangle with two triangles.
        // This defines four vertices at each corner in latitude and longitude 
        // and converts to the coordinates used for the flat map.
        const startX = -180
        const startY = 90
        const deltaX = 180*2 / meshResolution
        const deltaY = 90*2 / meshResolution
        let x = startX, y = startY;
        for (let i = 0; i < meshResolution+1; i++) {
            x = startX;
            for (let j = 0; j < meshResolution+1; j++) {
                mapVertices.push(this.convertLatLongToPlane(y,x))
                globeVertices.push(this.convertLatLongToSphere(y,x))
                x += deltaX
            }
            y -= deltaY
        }
        // mapVertices.forEach(e => console.log(`${e.x}, ${e.y}, ${e.z}`))
        // mapVertices.push(this.convertLatLongToPlane(-90, -180));
        // mapVertices.push(this.convertLatLongToPlane(-90, 180));
        // mapVertices.push(this.convertLatLongToPlane(90, 180));
        // mapVertices.push(this.convertLatLongToPlane(90, -180));

        // The flat map normals are always directly outward towards the camera
        for (let i = 0; i < mapVertices.length; i++) {
            mapNormals.push(gfx.Vector3.BACK);
        }
        // mapNormals.push(gfx.Vector3.BACK);
        // mapNormals.push(gfx.Vector3.BACK);
        // mapNormals.push(gfx.Vector3.BACK);
        // mapNormals.push(gfx.Vector3.BACK);

        // Define indices into the array for the two triangles
        const indices: number[] = [];
        for (let i = 0; i < meshResolution; i++) {
            for (let j = 0; j < meshResolution; j++) {
                const width = meshResolution + 1
                const left = i * width + j;
                const lowerLeft = (i+1) * width + j
                const right = i * width + j + 1
                const lowerRight = (i+1) * width + j + 1

                // triangle 1 for this pair of vertices
                indices.push(left, lowerRight, right)

                // triangle 2 for this pair of vertices
                indices.push(left, lowerLeft, lowerRight)
            }
        }
        // indices.push(0, 1, 2);
        // indices.push(0, 2, 3);

        // Part 2: Texturing the Mesh
        // You should replace the example code below with texture coordinates for the earth mesh.
        const texCoords: number[] = [];
        const delta = 1 / meshResolution
        let tx = 0, ty = 0;
        for (let i = 0; i < meshResolution+1; i++) {
            tx = 0;
            for (let j = 0; j < meshResolution+1; j++) {
                texCoords.push(tx, ty)
                tx += delta
            }
            ty += delta
        }
        // texCoords.push(0, 1);
        // texCoords.push(1, 1);
        // texCoords.push(1, 0);
        // texCoords.push(0, 0);

        // Set all the earth mesh data
        this.earthMesh.setVertices(mapVertices, true);
        this.earthMesh.setNormals(mapNormals, true);
        this.earthMesh.setIndices(indices);
        this.earthMesh.setTextureCoordinates(texCoords);

        // Part 3: Creating the Globe Mesh
        // You should compute a new set of vertices and normals
        // for the globe. You will need to also add code in
        // the convertLatLongToSphere() method below.
        const globeCenter = this.earthMesh.morphTargetBoundingSphere.center
        for (let i = 0; i < globeVertices.length; i++) {
            const normal = gfx.Vector3.subtract(globeVertices[i], globeCenter)
            normal.normalize()
            globeNormals.push(normal)
        }

        this.earthMesh.setMorphTargetVertices(globeVertices, true)
        this.earthMesh.setMorphTargetNormals(globeNormals, true)

        // Add the mesh to this group
        this.add(this.earthMesh);
    }

    public update(deltaTime: number) : void
    {
        // Part 4: Morphing Between the Map and Globe
        // The value of this.globeMode will be changed whenever
        // the user selects flat map or globe mode in the GUI.
        // You should use this boolean to control the morphing
        // of the earth mesh, as described in the readme.

        if (this.globeMode && this.earthMesh.morphAlpha != 1) {
            this.earthMesh.morphAlpha = gfx.MathUtils.clamp(this.earthMesh.morphAlpha+deltaTime, 0, 1);

        } else if (!this.globeMode && this.earthMesh.morphAlpha != 0) {
            this.earthMesh.morphAlpha = gfx.MathUtils.clamp(this.earthMesh.morphAlpha-deltaTime, 0, 1);
        }
    }

    public createEarthquake(record: EarthquakeRecord)
    {
        // Number of milliseconds in 1 year (approx.)
        const duration = 12 * 28 * 24 * 60 * 60;

        // Part 5: Creating the Earthquake Markers
        // Currently, the earthquakes are just placed randomly
        // on the plane. You will need to update this code to
        // correctly calculate both the map and globe positions of the markers.

        const mapPosition = this.convertLatLongToPlane(record.latitude, record.longitude)//new gfx.Vector3(Math.random()*6-3, Math.random()*4-2, 0);
        const globePosition = this.convertLatLongToSphere(record.latitude, record.longitude)//new gfx.Vector3(Math.random()*6-3, Math.random()*4-2, 0);

        const earthquake = new EarthquakeMarker(mapPosition, globePosition, record, duration);

        // Global adjustment to reduce the size. You should probably
        // update this be a more meaningful representation.
        const scale = gfx.MathUtils.lerp(0.01, 1, earthquake.magnitude)
        earthquake.scale.set(scale, scale, scale);
        const color = gfx.Color.lerp(gfx.Color.YELLOW, gfx.Color.RED, earthquake.magnitude)
        earthquake.material.setColor(color)

        // Uncomment this line of code to active the earthquake markers
        this.add(earthquake);
    }

    public animateEarthquakes(currentTime : number)
    {
        // This code removes earthquake markers after their life has expired
        this.children.forEach((quake: gfx.Node3) => {
            if(quake instanceof EarthquakeMarker)
            {
                const playbackLife = (quake as EarthquakeMarker).getPlaybackLife(currentTime);

                // The earthquake has exceeded its lifespan and should be moved from the scene
                if(playbackLife >= 1)
                {
                    quake.remove();
                }
                // The earthquake positions should be updated
                else
                {
                    // Part 6: Morphing the Earthquake Positions
                    // If you have correctly computed the flat map and globe positions
                    // for each earthquake marker in part 5, then you can simply lerp
                    // between them using the same alpha as the earth mesh.
                    quake.position = gfx.Vector3.lerp(quake.mapPosition, quake.globePosition, this.earthMesh.morphAlpha)
                }
            }
        });
    }

    // This convenience method converts from latitude and longitude (in degrees) to a Vector3 object
    // in the flat map coordinate system described in the readme.
    public convertLatLongToPlane(latitude: number, longitude: number): gfx.Vector3
    {
        return new gfx.Vector3(longitude * Math.PI / 180, latitude * Math.PI / 180, 0);
    }

    // This convenience method converts from latitude and longitude (in degrees) to a Vector3 object
    // in the globe mesh map coordinate system described in the readme.
    public convertLatLongToSphere(latitude: number, longitude: number): gfx.Vector3
    {
        // Part 3: Creating the Globe Mesh
        // Add code here to correctly compute the 3D sphere position
        // based on latitude and longitude.
        latitude = latitude * Math.PI / 180
        longitude = longitude * Math.PI / 180
        return new gfx.Vector3(
            Math.cos(latitude) * Math.sin(longitude),
            Math.sin(latitude),
            Math.cos(latitude) * Math.cos(longitude));
    }

    // This function toggles the wireframe debug mode on and off
    public toggleDebugMode(debugMode : boolean)
    {
        this.earthMesh.material.wireframe = debugMode;
    }
}