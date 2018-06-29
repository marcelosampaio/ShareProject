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
        
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

    
    override func presentationAnimationDidFinish() {
        // Only interested in the first item
        let extensionItem = extensionContext?.inputItems[0] as! NSExtensionItem
        print("extensionItem: \(extensionItem)")
        print("")
        

    }
    

    // MARK: - Helpers
    private func imageFromExtensionItem(extensionItem: NSExtensionItem, callback: (_ image: UIImage?) -> Void) {
        
//        for attachment in extensionItem.attachments as! [NSItemProvider] {
//            if(attachment.hasItemConformingToTypeIdentifier("0" as String)) {
//                // Marshal on to a background thread
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, UInt(0))) {
//                    attachment.loadItemForTypeIdentifier("0" as String, options: nil) {
//                        (imageProvider, error) in
//                        var image: UIImage? = nil
//                        if let error = error {
//                            println("Item loading error: \(error.localizedDescription)")
//                        }
//                        image = imageProvider as? UIImage
//                        dispatch_async(dispatch_get_main_queue()) {
//                            callback(image: image)
//                        }
//                    }
//                }
//            }
//        }
    }
    
    
    
}
