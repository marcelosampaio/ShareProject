//
//  CustomShareController.swift
//  ShareExtension
//
//  Created by Marcelo on 6/29/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class CustomShareController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var innerView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        innerView.layer.cornerRadius = 18
        innerView.layer.masksToBounds = true
        innerView.layer.borderColor = UIColor.black.cgColor
        innerView.layer.borderWidth = 1.5
        
        
        
        let content = extensionContext!.inputItems[0] as! NSExtensionItem
        let contentType = kUTTypeImage as String
        
        for attachment in content.attachments as! [NSItemProvider] {
            if attachment.hasItemConformingToTypeIdentifier(contentType) {
                
                attachment.loadItem(forTypeIdentifier: contentType, options: nil) { data, error in
                    if error == nil {
                        let url = data as! URL
                        
                        if let imageData = NSData.init(contentsOf: url) {
                            // load image
                            print("📮 image url: \(url)")
                            self.imageView.image = UIImage(data: imageData as Data)
//                            self.imageView.image = UIImage.init(data: imageData as Data)
                            
                        }
                    } else {
                        
//                        let alert = UIAlertController(title: "Error", message: "Error loading image", preferredStyle: .Alert)
//
//                        let action = UIAlertAction(title: "Error", style: .Cancel) { _ in
//                            self.dismissViewControllerAnimated(true, completion: nil)
//                        }
//
//                        alert.addAction(action)
//                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                }
            }
        }
        
        
        
        
        
        
        
        
        print("🎾 content: \(content)")
        print(".....")
    }
    
    // MARK: - UI Actions
    @IBAction func closeView(_ sender: Any) {
        print("🤲 close view")
        self.extensionContext!.completeRequest(returningItems: [],completionHandler: nil)
    }
    
}
