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
        
        dismiss(animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "calculateSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let calculateViewController = segue.destination as! CalculateViewController
        calculateViewController.unscaledImage = unscaledImage
    }

}
