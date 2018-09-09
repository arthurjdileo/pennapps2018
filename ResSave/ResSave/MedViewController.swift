//
//  MedViewController.swift
//  ResSave
//
//  Created by Arthur DiLeo on 9/8/18.
//  Copyright © 2018 Gregory. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


class MedViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let Userdef = UserDefaults.standard
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var bdat: UITextField!
    @IBOutlet weak var cond: UITextField!
    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var aller: UITextField!
    @IBOutlet weak var sub: UIButton!
    @IBOutlet weak var med: UITextField!
    @IBOutlet weak var wei: UITextField!
    @IBOutlet weak var hei: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var uploadPictureBtn: UIButton!
    

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var chooseBuuton: UIButton!
    var imagePicker = UIImagePickerController()
    
    @IBAction func btnClicked() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func subbed(_ sender: Any) {
        var namestring = name.text
        Userdef.set(namestring!, forKey: "name")
        
        
        var bdatstring = bdat.text
        Userdef.set(bdatstring!, forKey: "bdat")
        
        
        var condstring = cond.text
        Userdef.set(condstring, forKey: "cond")
        
        
        var notesstring = notes.text
        Userdef.set(notesstring!, forKey: "notes")
        
        
        var allerstring = aller.text
        Userdef.set(allerstring!, forKey: "aller")
        
        
        var medstring = med.text
        Userdef.set(medstring!, forKey: "med")
        
        
        var weistring = wei.text
        Userdef.set(weistring!, forKey: "wei")
        
        
        var heistring = hei.text
        Userdef.set(heistring!, forKey: "hei")
        
        
        
        
        Userdef.synchronize()
        print(Userdef.string(forKey: "name")!)
    }


}
