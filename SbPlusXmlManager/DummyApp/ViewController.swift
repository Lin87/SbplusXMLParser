//
//  ViewController.swift
//  DummyApp
//
//  Created by Ethan Lin on 7/5/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import UIKit
import SbPlusXmlManager

class ViewController: UIViewController {

    @IBOutlet weak var output: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getXMLPath();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getXMLPath() {
        
        let xmlMngr = SbXmlManager()
        
        do {
            try xmlMngr.read( path: "file:///Volumes/Macintosh%20HD/Users/ethan.lin/Desktop/sbplus.xml" );
            output.text = xmlMngr.getXmlString();
            xmlMngr.parse();
        } catch let error as NSError {
            output.text = error.localizedFailureReason;
        }
        
    }
    

}

