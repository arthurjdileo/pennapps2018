//
//  DataViewController.swift
//  ResSave
//
//  Created by Gregory on 9/7/18.
//  Copyright © 2018 Gregory. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

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
        let hello = "hello how are you"
        let filename = "text"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(filename).appendingPathExtension("txt")
        print("File Path: \(fileURL.path)")
        do {
            try hello.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("failed to write")
            print(error)
        }
        
        var readString = ""
        do {
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError{
            print("Failed to read file")
            print(error)
        }
        
        print("contents: \(readString)")
    
    }
    
}

