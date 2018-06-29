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
        
        
        print("*** begin ***")
        
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
