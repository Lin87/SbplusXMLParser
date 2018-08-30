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
    @IBAction func selectFileBtn(_ sender: NSButton) {
        
        let singleFileOpenPanel = NSOpenPanel()
        
        singleFileOpenPanel.allowsMultipleSelection = false
        singleFileOpenPanel.canChooseDirectories = false
        singleFileOpenPanel.canChooseFiles = true
        singleFileOpenPanel.allowedFileTypes = ["xml"]
        
        singleFileOpenPanel.beginSheetModal(for: self.view.window!, completionHandler: { result in
            if result == NSApplication.ModalResponse.OK {
                
                let url = singleFileOpenPanel.url
                
                self.readFile( fileUrl: url! )
                
            }
            
        } )
        
    }
    
    @IBAction func saveToFileBtn(_ sender: NSButton) {

        if ( !output.string.isEmpty ) {
            
            let saveFileOpenPanel = NSSavePanel()
            saveFileOpenPanel.allowedFileTypes = ["xml"]
            saveFileOpenPanel.isExtensionHidden = false
            saveFileOpenPanel.canSelectHiddenExtension = true
            
            saveFileOpenPanel.beginSheetModal(for: self.view.window!, completionHandler: { result in
                
                if result == NSApplication.ModalResponse.OK {
                    
                    guard let saveUrl = saveFileOpenPanel.url else { return }
                    self.saveFile( fileUrl: saveUrl )
                    
                }
                
            } )
            
        } else {
            
            let alert = NSAlert()
            
            alert.messageText = "Empty output!"
            alert.informativeText = "No need to save."
            alert.alertStyle = .informational
            alert.addButton(withTitle: "OK")
            
            alert.beginSheetModal(for: self.view.window!, completionHandler: { result in
                // do some fun here otherwise nothing
            } )
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    private func readFile( fileUrl: URL ) {
        
        let xmlMngr = SbXmlManager()
        
        do {
            
            try xmlMngr.read( path: fileUrl.absoluteString );
            xmlMngr.parse();
            
            let xml = xmlMngr.getSbXml().toString()
            
            output.string = xml
            
        } catch let error as NSError {
            
            output.string = error.localizedFailureReason!;
            
        }
        
    }
    
    private func saveFile( fileUrl: URL ) {
        
        do {
            
            try output.string.write(to: fileUrl, atomically: true, encoding: .utf8)
            
        } catch let error as NSError {
            
            output.string = error.localizedFailureReason!;
            
        }
        
    }
    
}

