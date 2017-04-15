//
//  DataModel.swift
//  AdList
//
//  Created by Ivan Sapozhnik on 4/15/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import AdList

class DataModel: AdListItem {
    
    fileprivate var itemTitle: String!
    
    public init(title: String) {
        itemTitle = title
    }
    
    func placeholderTitle() -> String? {
        return itemTitle
    }
    
    public func isAdvertisement() -> Bool {
        return false
    }
    
}
