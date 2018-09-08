//
//  DataViewController.swift
//  ResSave
//
//  Created by Gregory on 9/7/18.
//  Copyright © 2018 Gregory. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    let Userdef = UserDefaults.standard
    @IBOutlet var medview: UIView!
    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""

    @IBOutlet weak var panic: UIButton!
    
    @IBOutlet weak var pressed: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }

    @IBAction func execPanic(_ sender: Any) {
        super.viewDidLoad()
        
        print("panic time!")
        var lat = Userdef.object(forKey: "gplat")!
        var log = Userdef.object(forKey: "gplog")!
        var msg = "test \(lat) hi \(log)"
        
        let test = [msg]
        let activity = UIActivityViewController(activityItems: test, applicationActivities: nil)
        let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.postToTwitter, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.mail, UIActivity.ActivityType.message, UIActivity.ActivityType.openInIBooks, UIActivity.ActivityType.print]
        activity.excludedActivityTypes = excludedActivities
        present(activity, animated: true, completion: nil)
    }
    
}

