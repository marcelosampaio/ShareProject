//
//  CustomShareController.swift
//  ShareExtension
//
//  Created by Marcelo on 6/29/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import UIKit
import Social

//@objc (CustomShareController)
class CustomShareController: SLComposeServiceViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        

        
    }

    
    
    
    ////////////////////////
    
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
    
    
    


}
