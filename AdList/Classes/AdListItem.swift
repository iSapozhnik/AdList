//
//  AdItem.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

public protocol AdListItem {
    
    func placeholderTitle() -> String?
    func isAdvertisement() -> Bool
    func adBackgroundColor() -> UIColor?
}

public extension AdListItem {
    
    // Default implementation. i.e. optional method
    
    func adBackgroundColor() -> UIColor? { return nil }
    
    // For user models there is no need to implement this method - 
    // by default it is false.
    // Only Ad items should implement this and return true
    func isAdvertisement() -> Bool { return false }
}

public protocol AdListAdItem: AdListItem {
    
    var positioning: AdPositioning! { get set }

}
