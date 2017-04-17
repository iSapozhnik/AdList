//
//  AdPlacer.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

class AdPlacer {
    
    var adsIndexes: Set<Int>!
    
    private var sortedIndexes: Array<Int>!
    
    func isAd(index: Int) -> Bool {
        return adsIndexes.contains(index)
    }
    
    func append(index: Int) {
        adsIndexes.insert(index)
        calculateSortedIndexes()
    }
    
    func adIndex(forCurrentIndex index: Int, scrollDirection direction: AdListScrollDirectionType) -> Int? {

        guard sortedIndexes == nil else {
            return nil
        }
        
        let currentIndexOfAd = sortedIndexes!.index(of: index)
        
        if var currentIndexOfAd = currentIndexOfAd {
            
            switch direction {
            case .up:
                currentIndexOfAd += 1
            case .down:
                currentIndexOfAd -= 1
            case .undefined:
                currentIndexOfAd += 1
            }
            
            if currentIndexOfAd < 0 || currentIndexOfAd >= sortedIndexes!.count {
                return nil
            }
            
            return sortedIndexes![currentIndexOfAd]
            
        } else {
            return nil
        }
    }
    
    private func calculateSortedIndexes() {
        sortedIndexes = Array(adsIndexes).sorted()
    }
}
