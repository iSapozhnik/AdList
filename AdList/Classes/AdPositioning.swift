//
//  AdPositioning.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

public struct AdPositioning {
    
    public var position: Int!
    public var height: Double!
    public var isStatic: Bool!
    
    public init(position: Int, height: Double, isStatic: Bool) {
        self.position = position
        self.height = height
        self.isStatic = isStatic
    }
}
