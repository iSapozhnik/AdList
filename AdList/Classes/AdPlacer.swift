//
//  AdPlacer.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

struct AdPlacer {
    var ads: Set<Int>
    
    func isAd(position: Int) -> Bool {
        return ads.contains(position)
    }
    
    mutating func append(position: Int) {
        ads.insert(position)
    }
}
