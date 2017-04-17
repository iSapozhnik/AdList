//
//  AdListScrollDirection.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/17/17.
//
//

import UIKit

public enum AdListScrollDirectionType {
    case undefined
    case up
    case down
}

public class AdListScrollDirection: NSObject {
    
    private var lastContentOffset: CGPoint!

    public var direction: AdListScrollDirectionType = .undefined
    
    public func calculateDirection(_ offset: CGPoint) {
        
        let currentOffset = offset

        guard lastContentOffset != nil else {
            self.lastContentOffset = currentOffset
            return
        }
        
        if currentOffset.y > self.lastContentOffset.y {
            direction = .up
        } else {
            direction = .down
        }
        
        self.lastContentOffset = currentOffset

    }
}
