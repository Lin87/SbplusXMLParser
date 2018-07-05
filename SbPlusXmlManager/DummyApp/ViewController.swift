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

    @IBOutlet weak var pathDisplay: UILabel!
    
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
        
        pathDisplay.text = xmlMngr.read( path: "Desktop/sbplus.xml" );
        
    }
    

}

