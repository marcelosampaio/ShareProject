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
    
    
    // MARK: - Instance
    class var standard: PersistenceManager {
        return sharedInstance
    }
    init() {
    }
    
    // MARK: - Transient Exchange Data
    public func addTransientExchangeData(_ exchangeData: TransientExchangeData) {
        
//        let shared: UserDefaults = UserDefaults(suiteName: keyAppGroups)!
//        shared.set(exchangeData.contactType, forKey: keyContactType)
//        shared.set(exchangeData.callCenterId, forKey: keyContactCallCenterId)
//        shared.set(exchangeData.channelId, forKey: keyContactChannelId)
//        shared.synchronize()
    }
    
    public func getTransientExchangeData() -> TransientExchangeData {
//        let shared: UserDefaults = UserDefaults(suiteName: keyAppGroups)!
//        let storedContactType = shared.value(forKey: keyContactType) as! String
//        let storedCallCenterId = shared.value(forKey: keyContactCallCenterId) as! Int
//        let storedChannelId = shared.value(forKey: keyContactChannelId) as! Int
//
//        let transientExchangeData = TransientExchangeData.init(contactType: storedContactType, callCenterId: storedCallCenterId, channelId: storedChannelId)
//
//        return transientExchangeData
        return TransientExchangeData()
    }
    
    
    
    
}

