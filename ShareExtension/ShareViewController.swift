//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Marcelo on 6/28/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//
import Foundation
import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        
        if let currentMessage = contentText {
            
            if !contentText.isEmpty {
                print("📮 contentText: \(contentText)")
                print("📮 current message: \(currentMessage)")
                print("📮 .......")
                
            }

        
        }
        
        
        
        
        
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
        
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.

        //

        print("*** did select post -> post notification to the app")
        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "shareExtensionDidClose"), object:self)
        
        
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

    

    
    
    
}
