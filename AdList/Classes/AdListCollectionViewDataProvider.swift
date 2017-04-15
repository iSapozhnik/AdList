//
//  AdListCollectionViewDatasource.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

public class AdListCollectionViewDataProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var adPlacer = AdPlacer(ads: Set())
    public var data: [String]!

    public var delegate: AdListCollectionViewDataSource?
    public var adPosition: AdPositioning!
    public var originalData: [String]! {
        
        didSet {
            data = originalData
            
            // Display ad only if we have results to display
            if originalData.count > 0 {
                
                if adPosition.isStatic {
                    let insertionPosition = adPosition.position < data.count ? adPosition.position : originalData.count
                    data.insert("Advertisement", at: insertionPosition!)
                    adPlacer.append(position: insertionPosition!)
                } else {
                    if adPosition.position > data.count {
                        data.insert("Advertisement", at: data.count)
                        adPlacer.append(position: data.count)
                    } else {
                        for index in (0..<data.count/adPosition.position) {
                            let insertionPosition = (index + 1) * adPosition.position
                            data.insert("Advertisement", at: insertionPosition)
                            adPlacer.append(position: insertionPosition)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if adPlacer.isAd(position: indexPath.row) {
            return (delegate?.ad_collectionView(collectionView, adCellForItemAt:indexPath))!
        } else {
            return (delegate?.ad_collectionView(collectionView, itemCellForItemAt:indexPath))!
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if adPlacer.isAd(position: indexPath.row) {
            return CGSize(width: collectionView.bounds.width, height: CGFloat(adPosition.height))
        } else {
            return (delegate?.ad_collectionView(collectionView, layout:collectionViewLayout, sizeForItemAt:indexPath))!
        }
    }
    
}
