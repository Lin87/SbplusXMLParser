//
//  ViewController.swift
//  XmlMacTest
//
//  Created by Ethan Lin on 7/6/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Cocoa
import SbPlusXmlManager

class ViewController: NSViewController {
    
    @IBOutlet var output: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getXMLPath();
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func getXMLPath() {
        
        let xmlMngr = SbXmlManager()
        
        do {
            try xmlMngr.read( path: "file:///Volumes/Macintosh%20HD/Users/ethan.lin/Desktop/sbplus.xml" );
            xmlMngr.parse();
            
            let xml = xmlMngr.getSbXml().toString()
            
            output.string = xml
            
            var home = FileManager.default.homeDirectoryForCurrentUser
            let filePath = "Desktop/sbplus\(Int(NSDate().timeIntervalSince1970.rounded())).xml"
            
            home.appendPathComponent(filePath)
            
            try xml.write(to: home.absoluteURL, atomically: true, encoding: .utf8)
            
        } catch let error as NSError {
            output.string = error.localizedFailureReason!;
        }
        
    }
    
}

