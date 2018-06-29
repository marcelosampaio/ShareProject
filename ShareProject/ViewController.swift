//
//  ViewController.swift
//  ShareProject
//
//  Created by Marcelo on 6/28/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//
//  Base Article: http://www.yudiz.com/share-extention-in-ios-app/

import UIKit

class ViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // observers
        observerManager()
        
        
        print("*** 🐝 begin ***")
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("😇 view will appear")
        
        let userDefault = UserDefaults.standard
        userDefault.addSuite(named: "group.share.apps")
        
//        if let dict = userDefault.value(forKey: "img") as? NSDictionary{
        
//            let data = dict.value(forKey: "imgData") as! Data
//            let str = dict.value(forKey: "name") as! String
//
//            self.imgView.image = UIImage(data: data)
//            self.lblText.text = str
            
//            userDefault.removeObject(forKey: "img")
//            userDefault.synchronize()
//        }
    }
    
    
    
    // MARK: - Observers
    private func observerManager() {
        print("*** obserever added")
        //
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(shareExtensionDidClose(_:)),
                                               name: NSNotification.Name(rawValue: "shareExtensionDidClose"),
                                               object: nil)
        
        
        
    }
    // observer actions
    // rawValue: ReachabilityChangedNotification)
    @objc private func shareExtensionDidClose(_ sender: NSNotification) {
        
        print("*** share extension did close.")
        
    }
    
    
    
}
