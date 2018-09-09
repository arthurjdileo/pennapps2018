//
//  DataViewController.swift
//  ResSave
//
//  Created by Gregory on 9/7/18.
//  Copyright © 2018 Gregory. All rights reserved.
//

import UIKit
import MapKit

extension UIImage {
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
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
        
        
        
        let attrs = [NSAttributedString.Key.font: UIFont(name: "Helvetica Bold", size: 19)!,NSAttributedString.Key.foregroundColor : UIColor.black , NSAttributedString.Key.paragraphStyle: paragraphStyle]
        
        
        text.draw(with: rect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        
        
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
        
        
        
        // \n Latitude: \(lat) \n Longitude \(log) \n Height: \(hei) \n Weight: \(wei) Condition(s): \(cond)
    
    
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
       
    }

    @IBAction func execPanic(_ sender: Any) {
        super.viewDidLoad()
        let newprofile = UIImage(data: Userdef.object(forKey: "profile") as! Data)?.resized(toWidth: 100)
        
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        
        let location = CLLocationCoordinate2DMake(lat as! CLLocationDegrees, log as! CLLocationDegrees)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapSnapshotOptions.region = region
        mapSnapshotOptions.scale = UIScreen.main.scale
        mapSnapshotOptions.size = CGSize(width:200, height:200)
        mapSnapshotOptions.showsBuildings = false
        mapSnapshotOptions.showsPointsOfInterest = false
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        
        snapShotter.start { (snapshot, error) in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            
            var mapimg = snapshot?.image
            let mapData = mapimg?.pngData()
            let mapnewimg = UIImage(data: mapData!)
            UserDefaults.standard.set(mapData, forKey: "map")
            UserDefaults.standard.synchronize()
            
            var bottomImage = UIImage(named: "white.png")
            var topImage = mapnewimg
            var another = newprofile

            var size = CGSize(width: 500, height: 500)
            UIGraphicsBeginImageContext(size)
            
            let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            bottomImage!.draw(in: areaSize)
            another!.draw(in: CGRect(x:300, y:300, width: 200, height: 200), blendMode: .normal, alpha: 0.8)
            topImage!.draw(in: CGRect(x:0, y:300, width: 200, height: 200), blendMode: .normal, alpha: 0.8)
            
            var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            var testimage = self.textToImage(drawText: "Name: \(self.name)\n Birthday: \(self.bdat) \n Latitude: \(self.lat)\n Longitude: \(self.log) \nHeight: \(self.hei) \n Weight: \(self.wei)\n Condition(s): \(self.cond)\n Allergies & Reactions: \(self.aller)\n Medical Notes: \(self.notes)" as NSString, inImage: newImage, atPoint: CGPoint(x:1,y:75))
        let test = [testimage]
        let activity = UIActivityViewController(activityItems: test, applicationActivities: nil)
        let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.postToTwitter, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.mail, UIActivity.ActivityType.message, UIActivity.ActivityType.openInIBooks, ]
        activity.excludedActivityTypes = excludedActivities
        self.present(activity, animated: true, completion: nil)
            
        }
}

}
