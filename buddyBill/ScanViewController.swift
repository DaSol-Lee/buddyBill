//
//  ScanViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/14/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var unscaledImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func scanButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        unscaledImage = info[.originalImage] as! UIImage
        
        // calculates reduced dimensions
//        let scale = 500 / image.size.width
//        let newHeight = image.size.height * scale
//        let size = CGSize(width: 500, height: newHeight)
        
        // creates scaled image
//        let renderer = UIGraphicsImageRenderer(size: size)
//        scaledImage = (renderer.image { (context) in
//                        image.draw(in: CGRect(origin: .zero, size: size))
//                      }).pngData()
        // let scaledImage = image.af_imageAspectScaled(toFill: size)

        dismiss(animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "calculateSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let calculateViewController = segue.destination as! CalculateViewController
        calculateViewController.unscaledImage = unscaledImage
    }

}
