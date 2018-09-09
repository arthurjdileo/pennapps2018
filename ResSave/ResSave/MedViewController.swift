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

extension MedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        imageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
}

class MedViewController: UIViewController {
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
    var allow = true
    

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var chooseBuuton: UIButton!
    var imagePicker = UIImagePickerController()
    

    @IBAction func onClickPickImage(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        imagePicker.delegate = self
    }
    
    @IBAction func subbed(_ sender: Any) {
        var namestring = name.text
        if namestring != nil {
            Userdef.set(namestring!, forKey: "name")}
        
        
        var bdatstring = bdat.text
        if bdatstring != nil {
            Userdef.set(bdatstring!, forKey: "bdat")}
        
        
        var condstring = cond.text
        if condstring != nil{
            Userdef.set(condstring, forKey: "cond")}
        
        
        var notesstring = notes.text
        if notesstring != nil{
            Userdef.set(notesstring!, forKey: "notes")}
        
        
        var allerstring = aller.text
        if allerstring != nil {
            Userdef.set(allerstring!, forKey: "aller")}
        
        
        var medstring = med.text
        if medstring != nil {
            Userdef.set(medstring!, forKey: "med")}
        
        
        var weistring = wei.text
        if weistring != nil {
            Userdef.set(weistring!, forKey: "wei")}
        
        
        var heistring = hei.text
        if heistring != nil {
            Userdef.set(heistring!, forKey: "hei")}
        
        if (namestring=="" || bdatstring=="" || condstring=="" || notesstring=="" || allerstring=="" || medstring=="" || weistring=="" || heistring=="") {
                allow = false
            print("entered")
        } else {
            Userdef.synchronize()
            print(Userdef.string(forKey: "name")!)
        }
        
        
    }


}
