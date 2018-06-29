//
//  TransientExchangeData.swift
//  ShareProject
//
//  Created by Marcelo on 6/29/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import Foundation

struct TransientExchangeData {
    var title: String?
    var imageUrl: String?
    
    // MARK: - Initializers
    init(){
        self.title = String()
        self.imageUrl = String()
    }
    
    init(title: String, imageUrl: String) {
        self.title = title
        self.imageUrl = imageUrl
    }
}
