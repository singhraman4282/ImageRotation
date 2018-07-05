//
//  ViewController.swift
//  ImageRotation
//
//  Created by Raman Singh on 2018-07-04.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    @IBAction func rotateImageTapped(_ sender: UIButton) {
        //        let rotatedImage = imageView.image?.rotate(radians: .pi/2)
        
        let rotatedImage = rotateImageAppropriately(imageView.image)
        imageView.image = rotatedImage
    }
    
    
    func rotateImageAppropriately(_ imageToRotate: UIImage?) -> UIImage? {
        var properlyRotatedImage: UIImage?
        let imageRef = imageToRotate?.cgImage
        if let aRef = imageRef, let anOrientation = UIImageOrientation(rawValue: 3) {
            properlyRotatedImage = UIImage(cgImage: aRef, scale: 1.0, orientation: anOrientation)
        }
        
        return properlyRotatedImage
    }
    
    
}













extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.x, y: -origin.y, width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
}






/*
 func rotateImageAppropriately(_ imageToRotate: UIImage?) -> UIImage? {
 var properlyRotatedImage: UIImage?
 let imageRef = imageToRotate?.cgImage
 if imageToRotate?.imageOrientation.rawValue == 0 {
 properlyRotatedImage = imageToRotate
 } else if imageToRotate?.imageOrientation.rawValue == 3 {
 let imgsize: CGSize? = imageToRotate?.size
 UIGraphicsBeginImageContext(imgsize!)
 imageToRotate?.draw(in: CGRect(x: 0.0, y: 0.0, width: imgsize?.width ?? 0.0, height: imgsize?.height ?? 0.0))
 properlyRotatedImage = UIGraphicsGetImageFromCurrentImageContext()
 UIGraphicsEndImageContext()
 } else if imageToRotate?.imageOrientation.rawValue == 1 {
 if let aRef = imageRef, let anOrientation = UIImageOrientation(rawValue: 1) {
 properlyRotatedImage = UIImage(cgImage: aRef, scale: 1.0, orientation: anOrientation)
 }
 }
 return properlyRotatedImage
 }
 */
