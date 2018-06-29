//
//  CustomShareController.swift
//  ShareExtension
//
//  Created by Marcelo on 6/29/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import UIKit

class CustomShareController: UIViewController {

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    // MARK: - UI Actions
    @IBAction func closeView(_ sender: Any) {
        print("🤲 close view")
        self.extensionContext!.completeRequest(returningItems: [],completionHandler: nil)
    }
    
    
    
    
    

}
