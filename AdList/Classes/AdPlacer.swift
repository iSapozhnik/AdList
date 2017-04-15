//
//  AdPlacer.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

struct AdPlacer {
    
    var adsIndexes: Set<Int>

    func isAd(index: Int) -> Bool {
        return adsIndexes.contains(index)
    }
    
    mutating func append(index: Int) {
        adsIndexes.insert(index)
    }
}
