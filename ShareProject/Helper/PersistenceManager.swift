//
//  PersistenceManager.swift
//  ShareProject
//
//  Created by Marcelo on 6/29/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import Foundation
import UIKit




private let sharedInstance = PersistenceManager()
class PersistenceManager {
    
    let keyAppGroups = "group.share.apps"
    let keyStatusExchangeDataTitle = "keyStatusExchangeDataTitle"
    let keyStatusExchangeDataImageUrl = "keyStatusExchangeDataImageUrl"
    
    
    
    
    // MARK: - Instance
    class var standard: PersistenceManager {
        return sharedInstance
    }
    init() {
    }
    
    // MARK: - Transient Exchange Data
    public func addTransientExchangeData(_ exchangeData: TransientExchangeData) {
        
        let shared: UserDefaults = UserDefaults(suiteName: keyAppGroups)!
        shared.set(exchangeData.title, forKey: keyStatusExchangeDataTitle)
        shared.set(exchangeData.imageUrl, forKey: keyStatusExchangeDataImageUrl)
        shared.synchronize()
    }
    
    public func getTransientExchangeData() -> TransientExchangeData {
        let shared: UserDefaults = UserDefaults(suiteName: keyAppGroups)!
        let title = shared.value(forKey: keyStatusExchangeDataTitle) as! String
        let imageUrl = shared.value(forKey: keyStatusExchangeDataImageUrl) as! String

        let transientExchangeData = TransientExchangeData.init(title: title, imageUrl: imageUrl)

        return transientExchangeData

    }
    
    
    
    
}

