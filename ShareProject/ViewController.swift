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
        
        
        /////////////// FORCE WRITE DATA

//        let shared: UserDefaults = UserDefaults(suiteName: "group.share.apps")!
//        shared.set("string content goes here", forKey: "StatusShareExtensionKeyImage")
//        shared.synchronize()
        
        /////////////////////////////////
        
        let shared2 : UserDefaults = UserDefaults(suiteName: "group.share.apps")!
        let content = shared2.object(forKey: "StatusShareExtensionKeyImage") as! String
        
        print("🐲 shared conntent: \(content)")
        
        /////////////
        
        
        
        
        
        
        
        print("*** 🐝 begin ***")
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("😇 view will appear")
        
        /////////
        let shared: UserDefaults = UserDefaults(suiteName: "group.share.apps")!
        if let storedContent = shared.value(forKey: "StatusShareExtensionKeyImage") as? NSDictionary{
            print("🏵 stored content: \(storedContent)")
        }
        print("🦖 outside")
        print("...")
//        let storedContent = shared.value(forKey: "StatusShareExtensionKeyImage") as! NSDictionary
        
        /////////
        
        
        
//        let userDefault = UserDefaults.standard
//        userDefault.addSuite(named: "group.share.apps")
//
//        if let dict = userDefault.value(forKey: "StatusShareExtensionKeyImage") as? NSDictionary{
//
////            let data = dict.value(forKey: "imgData") as! Data
//            let str = dict.value(forKey: "name") as! String
//
////            self.imgView.image = UIImage(data: data)
////            self.lblText.text = str
//            print("🦑 string: \(str)")
//
//
//            userDefault.removeObject(forKey: "img")
//            userDefault.synchronize()
//        }else{
//            print("🏂 no data has been stoted yet")
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
