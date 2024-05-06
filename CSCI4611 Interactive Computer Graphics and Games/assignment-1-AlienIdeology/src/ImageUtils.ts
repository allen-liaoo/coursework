/** CSci-4611 Assignment 1 Support Code
 * Assignment concept and support code by Prof. Daniel Keefe, 2023
 * Inspired by Camille Utterbeck's "Text Rain" installation, 2000+
 * Copyright Regents of the University of Minnesota
 * Please do not distribute beyond the CSci-4611 course
 */

import * as gfx from 'gophergfx'

/**
 * A collection of helper routines for working with images stored in ImageData objects.
 * Feel free to add additional routines (e.g., image filters) if you like.  (We did in
 * our implementation.)
 */
export class ImageUtils
{
    /**
     * Creates a new ImageData object of the specified width and height.  Every byte in the data array
     * will be be initialized to 0 (i.e., black completely transparent pixels).
     */
    public static createBlank(width: number, height: number): ImageData
    {
        const nBytes = width * height * 4;
        return new ImageData(new Uint8ClampedArray(nBytes), width, height);
    }

    /**
     * Checks the image variable to determine if has already been created, then checks to see if it has
     * the desired width and height.  If these checks pass, then the function returns the existing image.
     * If either check fails, then the function creates a new ImageData object of the desired width and 
     * height and returns it.  In this case, the image will be initialized using ImageUtils.createBlank().   
     * @param image Can be null, undefined, or an existing image
     * @param width The desired width of the image
     * @param height The desired height of the image
     * @returns The current image if it matches the desired width and height or a new image that matches
     */
    public static createOrResizeIfNeeded(image: ImageData | undefined | null, width: number, height: number): ImageData
    {
        if (!(image instanceof ImageData) || image.width != width || image.height != height) {
            return this.createBlank(width, height);
        } else {
            return image;
        }
    }

    /**
     * Returns a new ImageData object that is a deep copy of the source image provided.  This includes copying
     * all of the pixel data from the source to the new image object.
     */
    public static clone(source: ImageData): ImageData
    {
        const copyOfPixelData = new Uint8ClampedArray(source.data);
        return new ImageData(copyOfPixelData, source.width, source.height);
    }

    /**
     * Copies the pixel data from the source image into the pixels of the destination image. 
     * @param source An existing ImageData object that is the source for the pixel data.
     * @param dest An existing ImageData object that is the destination for the pixel data.
     */
    public static copyPixels(source: ImageData, dest: ImageData): void
    {
        for (let i=0; i<source.data.length; i++) {
            dest.data[i] = source.data[i];
        }
    }

    public static convertToGrayscale(source: ImageData, dest: ImageData): void
    {
        //=========================================================================
        //Part 2.1 Convert to Grayscale
        //Iterate through the pixels in the source image data 
        //Calculate the grayscale value for each pixel
        //Set the corresponding pixel values (r,g,b,a) in the destination image data to the grayscale value
        //When this is complete, uncomment the corresponding line in RainingApp.ts  
        //Provide the appropriate parameters to that function to view the effect
        //=========================================================================
        for(let i = 0; i < source.data.length; i += 4) {
            const grayScale = source.data[i] * 0.3 + source.data[i+1] * 0.59 + source.data[i+2] * 0.11;
            dest.data[i] = grayScale;
            dest.data[i+1] = grayScale;
            dest.data[i+2] = grayScale;
            dest.data[i+3] = grayScale;
        }
    }

    public static convertToGrayscaleInPlace(image: ImageData): void
    {
        return this.convertToGrayscale(image, image);
    }

    public static mirror(source: ImageData, dest: ImageData): void
    {
        //=========================================================================
        //Part 2.2 Mirror the Image
        //Iterate through the pixels in the source image data
        //Calculate the mirrored pixel location
        //Set the corresponding pixel values (r,g,b,a) in the destination image data to the mirrored value
        //When this is complete, uncomment the corresponding line in RainingApp.ts  
        //Provide the appropriate parameters to that function to view the effect
        //=========================================================================
        for(let r = 0; r < source.height; r++) {
            for(let c = 0; c < source.width; c++) {
                const mirC = source.width-c-1;
                dest.data[this.getImageDataIndex(dest, mirC, r, 0)] = ImageUtils.getRed(source, c, r);
                dest.data[this.getImageDataIndex(dest, mirC, r, 1)] = ImageUtils.getGreen(source, c, r);
                dest.data[this.getImageDataIndex(dest, mirC, r, 2)] = ImageUtils.getBlue(source, c, r);
                dest.data[this.getImageDataIndex(dest, mirC, r, 3)] = ImageUtils.getAlpha(source, c, r);
            }
        }
    }

    public static threshold(source: ImageData, dest: ImageData, threshold: number): void
    {
        //=========================================================================
        //Part 2.3 Threshold the Image
        //Iterate through the pixels in the source image data 
        //Check if the pixel's color channel value is greater than or equal to the threshold
        //Set the corresponding pixel values (r,g,b,a) in the destination image data to the appropriate value
        //based on the threshold result
        //When this is complete, uncomment the corresponding line in RainingApp.ts  
        //Provide the appropriate parameters to that function to view the effect
        //=========================================================================
        threshold *= 255;
        for(let i = 0; i < source.data.length; i += 1) {
            if (source.data[i] < threshold) dest.data[i] = 0; // black
            else dest.data[i] = 255; // white
        }
    }

    public static getImageDataIndex(image: ImageData, col: number, row: number, colorChannel = 0) {
        return (row * image.width + col) * 4 + colorChannel;
    }

     // --- Additional Helper Functions ---
     // You may find it useful to complete these to assist with some calculations of RainingApp.ts
    
    public static getRed(image: ImageData, col: number, row: number)
    {
        if (row >= image.height) console.log("wrong row index");
        if (col >= image.width) console.log("wrong col index");
        const index = ImageUtils.getImageDataIndex(image, col, row);
        if (index >= image.data.length) {
            console.log("wrong dataindex!");
            console.log(`col:${col}, row:${row}, index:${index}`);
        }
        return image.data[ImageUtils.getImageDataIndex(image, col, row)];
    }

    public static getGreen(image: ImageData, col: number, row: number)
    {
        return image.data[ImageUtils.getImageDataIndex(image, col, row, 1)];
    }

    public static getBlue(image: ImageData, col: number, row: number)
    {
        return image.data[ImageUtils.getImageDataIndex(image, col, row, 2)];
    }

    public static getAlpha(image: ImageData, col: number, row: number)
    {
        return image.data[ImageUtils.getImageDataIndex(image, col, row, 3)];
    }
}
