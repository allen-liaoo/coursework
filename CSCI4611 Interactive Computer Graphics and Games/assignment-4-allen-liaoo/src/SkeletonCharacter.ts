/* Assignment 4: So You Think Ants Can Dance
 * UMN CSci-4611 Instructors 2012+
 * Significant changes by Prof. Dan Keefe, 2023 
 * Initial GopherGfx implementation by Evan Suma Rosenberg <suma@umn.edu> 2022
 * License: Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
 * Please do not distribute beyond the CSci-4611 course
 */ 

import * as gfx from 'gophergfx'
import { AnimatedBone } from './AnimatedBone';
import { AnimatedCharacter } from './AnimatedCharacter'


/**
 * This character should draw each bone as a cylinder with radius 0.01.  Transformation matrices 
 * need to be used to scale, rotate, and translate the cylinder so that it starts at the origin
 * of bone space and extends in the bone's direction with a length equal to the bone's length.
 */
export class SkeletonCharacter extends AnimatedCharacter
{
    constructor() {
        super();
    }

    public override addGeometryToAnimatedBone(bone: AnimatedBone): void
    {
        // PART 3: Create a skeleton.
        //
        // Use a cylinder mesh as a starting point, then scale it, rotate it,
        // and translate it so the bones look like a skeleton. When this part is
        // complete, the skeleton should show representations of every bone, and
        // there should not be gaps between bones.
        //
        // You can also use the skeleton to verify that you've done PART 4 correctly.
        const skele = gfx.Geometry3Factory.createCylinder()
        // scale y by bone length
        const scale = gfx.Matrix4.makeScale(new gfx.Vector3(0.01, bone.length, 0.01))
        // move bone up so cylinder's bottom is the origin of bone space
        const trans = gfx.Matrix4.makeTranslation(new gfx.Vector3(0, (bone.length/2), 0))
        // align the bone (now on top of y axis) to point to the bone's direction
        const rot = gfx.Matrix4.makeAlign(gfx.Vector3.UP, bone.direction)
        const skeMat = gfx.Matrix4.multiplyAll(rot, trans, scale)
        skele.setLocalToParentMatrix(skeMat, false)
        bone.add(skele)
    }
}
