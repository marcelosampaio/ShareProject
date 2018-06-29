//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Marcelo on 6/28/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import UIKit
import Social


class ShareViewController: SLComposeServiceViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Reset Post button text.
        for item in (self.navigationController?.navigationBar.items)! {
            if let rightItem = item.rightBarButtonItem {
                rightItem.title = "Meu Botao Aqui Mesmo"
//                break
            }
            if let leftItem = item.leftBarButtonItem {
                leftItem.title = "Fechar"
//                break
            }
        }
    }
    
    
    
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
        if let item = self.extensionContext?.inputItems[0] as? NSExtensionItem{
            for ele in item.attachments!{
                let itemProvider = ele as! NSItemProvider
                
                if itemProvider.hasItemConformingToTypeIdentifier("public.jpeg"){
                    
                    itemProvider.loadItem(forTypeIdentifier: "public.jpeg", options: nil, completionHandler: { (item, error) in
                        
                        var imgData: Data!
                        if let url = item as? URL{
                            imgData = try! Data(contentsOf: url)
                        }
                        
                        if let img = item as? UIImage{
                            imgData = UIImagePNGRepresentation(img)
                        }
                        
                        let dict: [String : Any] = ["imgData" :  imgData, "name" : self.contentText]
                        let shared: UserDefaults = UserDefaults(suiteName: "group.share.apps")!
                        shared.set("string content goes here", forKey: "StatusShareExtensionKeyImage")
                        shared.synchronize()
                        
                        
                        
                        
                        
                        
//                        let userDefault = UserDefaults.standard
//                        userDefault.addSuite(named: "group.share.apps")
//                        userDefault.set(dict, forKey: "StatusShareExtensionKeyImage")
//                        userDefault.synchronize()
                    })
                }
            }
        }
        
        
        /////////////////////////////////
        
        let shared2 : UserDefaults = UserDefaults(suiteName: "group.share.apps")!
        let content = shared2.object(forKey: "StatusShareExtensionKeyImage") as! String
        
        print("🐲🐲🐲🐲🐲🐲🐲🐲🐲 shared conntent: \(content)")
        
        /////////////
        
        
        
        
        print("🦖 will complete request 🦖")
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
