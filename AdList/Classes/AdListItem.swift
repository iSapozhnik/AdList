//
//  AdItem.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

@objc public protocol AdListItem {
    
    func placeholderTitle() -> String?
    func isAdvertisement() -> Bool
    @objc optional func adBackgroundColor() -> UIColor?

}

public protocol AdListAdItem: AdListItem {
    
    var positioning: AdPositioning! { get set }

}
