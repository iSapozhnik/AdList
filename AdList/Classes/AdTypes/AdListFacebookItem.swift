//
//  AdListFacebookItem.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

public class AdListFacebookItem: AdListAdItem {
    
    public var positioning: AdPositioning!
    
    public init(positioning: AdPositioning) {
        self.positioning = positioning
    }
    
    public func placeholderTitle() -> String? {
        return "Facebook Ad, static: \(String(positioning.isStatic)), position: \(String(positioning.position))"
    }
    
    public func adBackgroundColor() -> UIColor? {
        return .blue
    }
    
    public func isAdvertisement() -> Bool {
        return true
    }
}
