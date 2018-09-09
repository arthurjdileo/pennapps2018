//
//  DataViewController.swift
//  ResSave
//
//  Created by Gregory on 9/7/18.
//  Copyright © 2018 Gregory. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    var ui = UIImage()
    let Userdef = UserDefaults.standard
    
    @IBOutlet weak var editMediInfo: UIButton!
    @IBOutlet weak var viewMap: UIButton!
    
    var dataObject = ""
    @IBOutlet weak var panic: UIButton!
    
    lazy var name = Userdef.string(forKey: "name")!
    lazy var lat = Userdef.object(forKey: "gplat")!
    lazy var log = Userdef.object(forKey: "gplog")!
    lazy var bdat = Userdef.string(forKey: "bdat")!
    lazy var cond = Userdef.string(forKey: "cond")!
    lazy var notes=Userdef.string(forKey: "notes")!
    lazy var aller=Userdef.string(forKey: "aller")!
    lazy var med = Userdef.string(forKey: "med")!
    lazy var wei = Userdef.string(forKey: "wei")!
    lazy var hei = Userdef.string(forKey: "hei")!
    
    func textToImage(drawText text: NSString, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        
        
        let attrs = [NSAttributedString.Key.font: UIFont(name: "Helvetica Bold", size: 12)!,NSAttributedString.Key.foregroundColor : UIColor.black , NSAttributedString.Key.paragraphStyle: paragraphStyle]
        
        
        text.draw(with: rect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
        
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
        
        
        
        // \n Latitude: \(lat) \n Longitude \(log) \n Height: \(hei) \n Weight: \(wei) Condition(s): \(cond)
    
    
    lazy var testimage = textToImage(drawText: "Name: \(name)\n Birthday: \(bdat) \n Latitude: \(lat)\n Longitude: \(log) \nHeight: \(hei) \n Weight: \(wei)\n Condition(s): \(cond)\n Allergies & Reactions: \(aller)\n Medical Notes: \(notes)" as NSString, inImage: UIImage(named: "white.png")!, atPoint: CGPoint(x:1,y:1))

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
       
    }

    @IBAction func execPanic(_ sender: Any) {
        super.viewDidLoad()

      
//        " Name: \(name) Lat/Long \(lat) \(log) H/W \(hei) \(wei) Condition(s): \(cond)"
//\n\n Birth Year: \(bdat)\n\n Lat: \(lat)\n\n Long: \(log)\n\n Height: \(hei)\n\n Weight: \(wei)\n\n Condition(s): \(cond) \n\n Allergies: \(aller) \n\n Misc: \(notes)"
        let test = [testimage]
        let activity = UIActivityViewController(activityItems: test, applicationActivities: nil)
        let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.postToTwitter, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.mail, UIActivity.ActivityType.message, UIActivity.ActivityType.openInIBooks, ]
        activity.excludedActivityTypes = excludedActivities
        present(activity, animated: true, completion: nil)
    }
    
    

    
}

