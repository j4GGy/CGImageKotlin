//
//  ViewController.swift
//  CGImageKotlin
//
//  Created by TesMath on 05.06.20.
//

import UIKit

import image

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        doImageTest()
    }

    func doImageTest() {
        
        let uiImageFromAssets = UIImage(named: "sun")
        imageView.contentMode = .scaleAspectFit
        imageView.image = uiImageFromAssets
        
        guard let cgImage = uiImageFromAssets?.cgImage else {
            print("CGImage is nil")
            return
        }
        
        let pointer : UnsafeMutablePointer<CGImage> = UnsafeMutablePointer<CGImage>.allocate(capacity: 1)
        pointer.pointee = cgImage
        
        let kImage1 = KotlinImage(cgImageRef: pointer)
        print("kImage1: \(kImage1.width) x \(kImage1.height)")
        
        let kImage1Swift = kImage1.cgImageRef.assumingMemoryBound(to: CGImage.self).pointee
        print("kImage1Swift: \(kImage1Swift.width) x \(kImage1Swift.height)")
        
        let kImage2 = KotlinImage(uiImage: UIImage(cgImage: pointer.pointee))
        print("kImage2: \(kImage2.width) x \(kImage2.height)")
        
        let kImage2Swift = kImage2.cgImageRef.assumingMemoryBound(to: CGImage.self).pointee
        print("kImage2Swift: \(kImage2Swift.width) x \(kImage2Swift.height)")
        
        pointer.deallocate()
        
    }
    
    

}

