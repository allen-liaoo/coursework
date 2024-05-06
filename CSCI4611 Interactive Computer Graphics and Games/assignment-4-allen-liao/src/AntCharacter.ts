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
 * This character should draw an Ant or some other interesting custom 3D character by
 * adding geometry to the bones of the character.  We will assume the character's
 * skeleton is a humanoid skeleton in the CMU MoCap database format.  So, you can
 * selectively add geometry to the bone by checking the name of the bone using an
 * "if" statement as demonstrated in the support code.
 */
export class AntCharacter extends AnimatedCharacter
{
    private blackMaterial: gfx.UnlitMaterial;
    private antMaterial: gfx.PhongMaterial;

    constructor() {
        super();

        this.blackMaterial = new gfx.UnlitMaterial();
        this.blackMaterial.setColor(gfx.Color.BLACK);

        this.antMaterial = new gfx.PhongMaterial();
        this.antMaterial.ambientColor.set(0.7, 0, 0);
        this.antMaterial.diffuseColor.set(0.7, 0, 0);
        this.antMaterial.specularColor.set(0.7, 0.7, 0.7);
        this.antMaterial.shininess = 50;
    }


    public override addGeometryToAnimatedBone(bone: AnimatedBone): void
    {
        // PART 5: Create an character!
        //
        // For this part, create a convincing custom character out of basic
        // geometries. Start by creating a basic representation for *every* bone
        // (like you did in the SkeletonCharacter), and add additional
        // geometries for specific parts of the skeleton. We suggest drawing
        // geometries for at least the following parts (defined in the if
        // statement below):
        // - lowerback
        // - upperbackback
        // - thorax
        // - head
        //
        // A full list of available bones (and their hierarchical relationships)
        // can be seen in the skeleton files, for example /public/assets/data/05.asf.
        //
        // Lastly, add a face to the character! The character's face should
        // demonstrate your knowledge of composing transformations; at least one
        // part of the face should adjust the position, the rotation, and the
        // scale (like the antennae on the instructor solution).
        const bodyColor = new gfx.Color(0.36, 0.25, 0.05)

        // Skeleton
        const skele = gfx.Geometry3Factory.createCylinder()
        const scale = gfx.Matrix4.makeScale(new gfx.Vector3(0.01, bone.length, 0.01))
        const trans = gfx.Matrix4.makeTranslation(new gfx.Vector3(0, (bone.length/2), 0))
        const rot = gfx.Matrix4.makeAlign(gfx.Vector3.UP, bone.direction)
        const skeMat = gfx.Matrix4.multiplyAll(rot, trans, scale)
        skele.setLocalToParentMatrix(skeMat, false)
        skele.setColors(Array<gfx.Color>(skele.vertexCount).fill(gfx.Color.BLACK))
        bone.add(skele)

        const shPadColor = new gfx.Color(0.93, 0.5, 0.41)

        // PART 5.1: Draw specific parts of the character
        if (bone.name == 'lowerback') {
            const butt = gfx.Geometry3Factory.createSphere(0.1)
            const buttMat = gfx.Matrix4.multiplyAll(
                gfx.Matrix4.makeScale(new gfx.Vector3(1, 2.5, 1)),
                gfx.Matrix4.makeTranslation(new gfx.Vector3(0, -(bone.length/3), 0))
            )
            butt.setColors(Array<gfx.Color>(butt.vertexCount).fill(bodyColor))
            butt.setLocalToParentMatrix(buttMat, false)
            bone.add(butt)
        }
        else if (bone.name == 'upperback') {
            const tummy = gfx.Geometry3Factory.createSphere(0.1)
            tummy.setColors(Array<gfx.Color>(tummy.vertexCount).fill(bodyColor))
            bone.add(tummy)
        }
        else if (bone.name == 'thorax') {
            const chest = gfx.Geometry3Factory.createSphere(0.1)
            chest.setColors(Array<gfx.Color>(chest.vertexCount).fill(bodyColor))
            bone.add(chest)
        }
        else if (bone.name == 'lhumerus') {
            const lshoulderPad = gfx.Geometry3Factory.createSphere(0.05)
            // for protection
            const shPadMat = gfx.Matrix4.multiplyAll(
                gfx.Matrix4.makeRotationZ(-40*Math.PI/180),
                gfx.Matrix4.makeScale(new gfx.Vector3(0.5, 1, 1))
            )
            lshoulderPad.setLocalToParentMatrix(shPadMat, false)
            lshoulderPad.setColors(Array<gfx.Color>(lshoulderPad.vertexCount).fill(shPadColor))
            bone.add(lshoulderPad)
        } 
        else if (bone.name == 'rhumerus') {
            const rshoulderPad = gfx.Geometry3Factory.createSphere(0.05)
            const shPadMat = gfx.Matrix4.multiplyAll(
                gfx.Matrix4.makeRotationZ(40*Math.PI/180),
                gfx.Matrix4.makeScale(new gfx.Vector3(0.5, 1, 1))
            )
            rshoulderPad.setLocalToParentMatrix(shPadMat, false)
            rshoulderPad.setColors(Array<gfx.Color>(rshoulderPad.vertexCount).fill(shPadColor))
            bone.add(rshoulderPad)
        }
        else if (bone.name == 'head')
        {
            // PART 5.2: Add a face to the character
            const noggin = gfx.Geometry3Factory.createSphere(0.2)
            const nogginRot = gfx.Matrix4.makeRotationX(-60 * Math.PI/180)
            const nogginMat = gfx.Matrix4.multiplyAll(
                nogginRot,
                gfx.Matrix4.makeScale(new gfx.Vector3(0.5, 1, 0.5))
            )
            noggin.setLocalToParentMatrix(nogginMat, false)
            noggin.setColors(Array<gfx.Color>(noggin.vertexCount).fill(bodyColor))
            bone.add(noggin)

            const eyeColor = gfx.Color.YELLOW
            const eyeRadius = 0.025
            const leye = gfx.Geometry3Factory.createSphere(eyeRadius)
            leye.setColors(Array<gfx.Color>(leye.vertexCount).fill(eyeColor))
            const ltrans = gfx.Matrix4.makeTranslation(new gfx.Vector3(-.05, 0.01, .12))
            leye.setLocalToParentMatrix(ltrans, false)
            bone.add(leye)

            const reye = gfx.Geometry3Factory.createSphere(eyeRadius)
            reye.setColors(Array<gfx.Color>(reye.vertexCount).fill(eyeColor))
            const rtrans = gfx.Matrix4.makeTranslation(new gfx.Vector3(.05, 0.01, .12))
            reye.setLocalToParentMatrix(rtrans, false)
            bone.add(reye)

            // ant on a stick
            const antonastick = gfx.Geometry3Factory.createSphere(0.1)
            const antennaMat = gfx.Matrix4.multiplyAll(
                nogginRot,
                gfx.Matrix4.makeScale(new gfx.Vector3(0.1, 4, 0.1))
            )
            antonastick.setColors(Array<gfx.Color>(leye.vertexCount).fill(new gfx.Color(0.93, 0.75, 0.41)))
            antonastick.setLocalToParentMatrix(antennaMat, false)
            bone.add(antonastick)
        }
    }
}
