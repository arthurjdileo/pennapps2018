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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func subbed(_ sender: Any) {
        var namestring = name.text
        Userdef.set(namestring!, forKey: "name")
        
        
        var bdatstring = bdat.text
        Userdef.set(namestring!, forKey: "bdat")
        
        
        var condstring = cond.text
        Userdef.set(namestring!, forKey: "cond")
        
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
