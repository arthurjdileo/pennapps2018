//
//  MedViewController.swift
//  ResSave
//
//  Created by Arthur DiLeo on 9/7/18.
//  Copyright © 2018 Gregory. All rights reserved.
//

import UIKit

class MedViewController: UIViewController {

<<<<<<< Updated upstream
//    @IBOutlet weak var name: UITextField!
//    @IBOutlet weak var bday: UITextField!
//    @IBOutlet weak var cond: UITextField!
//    @IBOutlet weak var notes: UITextField!
//    @IBOutlet weak var allerg: UITextField!
//    @IBOutlet weak var meds: UITextField!
//    @IBOutlet weak var weight: UITextField!
//    @IBOutlet weak var height: UITextField!
//
//    let userDefaults = UserDefaults.standard
//    userDefaults.set(name, forKey: "name")
//    userDefaults.set(bday, forKey: "bday")
//    userDefaults.set(cond, forKey: "cond")
//    userDefaults.set(notes, forKey: "notes")
//    userDefaults.set(allerg, forKey: "allerg")
//    userDefaults.set(meds, forKey: "meds")
//    userDefaults.set(weight, forKey: "weight")
//    userDefaults.set(height, forKey: "height")

=======
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var bday: UITextField!
    @IBOutlet weak var cond: UITextField!
    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var allerg: UITextField!
    @IBOutlet weak var meds: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    
    let userDefaults = UserDefaults.standard
    
    
>>>>>>> Stashed changes
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = userDefaults.object(forKey: "name") as? String
        bday.text = userDefaults.object(forKey: "bday") as? String
        cond.text = userDefaults.object(forKey: "cond") as? String
        notes.text = userDefaults.object(forKey: "notes") as? String
        allerg.text = userDefaults.object(forKey: "allerg") as? String
        meds.text = userDefaults.object(forKey: "meds") as? String
        weight.text = userDefaults.object(forKey: "weight") as? String
        height.text = userDefaults.object(forKey: "height") as? String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
<<<<<<< Updated upstream
//    @IBAction func submit(_ sender: UIButton) {
//
//        print(userDefaults.string(forKey: "name"))
//        
//    }
=======
    @IBAction func submit(_ sender: UIButton) {

        userDefaults.set(name, forKey: "name")
        userDefaults.set(bday, forKey: "bday")
        userDefaults.set(cond, forKey: "cond")
        userDefaults.set(notes, forKey: "notes")
        userDefaults.set(allerg, forKey: "allerg")
        userDefaults.set(meds, forKey: "meds")
        userDefaults.set(weight, forKey: "weight")
        userDefaults.set(height, forKey: "height")
        
    }
>>>>>>> Stashed changes
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
