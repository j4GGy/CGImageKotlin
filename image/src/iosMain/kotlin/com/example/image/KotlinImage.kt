package com.example.image

import platform.CoreGraphics.CGImageGetHeight
import platform.CoreGraphics.CGImageGetWidth
import platform.CoreGraphics.CGImageRef
import platform.UIKit.UIImage

class KotlinImage(val cgImageRef: CGImageRef) {

    constructor(uiImage: UIImage) : this(uiImage.CGImage!!)

    val width = CGImageGetWidth(cgImageRef)
    val height = CGImageGetHeight(cgImageRef)
}