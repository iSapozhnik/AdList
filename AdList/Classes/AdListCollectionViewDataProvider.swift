//
//  AdListCollectionViewDatasource.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

public class AdListCollectionViewDataProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var adPlacer = AdPlacer()
    var scrollDirection = AdListScrollDirection()
    
    public var data: [AdListItem]!

    public var delegate: AdListCollectionViewDataSource?
    public var adItems: [AdListAdItem]!
    public var originalData: [AdListItem]! {
        
        didSet {
            data = originalData
            
            // Display ad only if we have results to display
            if originalData.count > 0 {
                
                for adItem in adItems {
                    
                    if adItem.positioning.isStatic {
                        
                        let insertionPosition = adItem.positioning.position < data.count ? adItem.positioning.position : originalData.count
                        data.insert(adItem, at: insertionPosition!)
                    } else {
                        
                        if adItem.positioning.position > originalData.count {
                            data.insert(adItem, at: originalData.count)

                        } else {
                            
                            for index in (0..<(data.count)/adItem.positioning.position) {
                                let insertionPosition = (index + 1) * adItem.positioning.position
                                data.insert(adItem, at: insertionPosition)

                            }
                        }
                    }
                }
                
                for (index, item) in data.enumerated() {
                    if item.isAdvertisement() {
                        adPlacer.append(index: index)
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
        
//        print("cellForItemAtRow \(indexPath.row)")
        
        if adPlacer.isAd(index: indexPath.row) {
            let adItem = data[indexPath.row]
            return (delegate?.ad_collectionView(collectionView, adCellForAdItem:adItem, indexPath: indexPath))!
        } else {
            return (delegate?.ad_collectionView(collectionView, itemCellForItemAt:indexPath))!
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let index = indexPath.row
        
        if adPlacer.isAd(index: indexPath.row) {
            print("Going to display ad with index \(index)")
            print("Next ad will be with Index \(adPlacer.adIndex(forCurrentIndex: index, scrollDirection: scrollDirection.direction))")
        }

    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if adPlacer.isAd(index: indexPath.row) {
            let adItem = data[indexPath.row] as! AdListAdItem
            return CGSize(width: collectionView.bounds.width, height: CGFloat(adItem.positioning.height))
        } else {
            return (delegate?.ad_collectionView(collectionView, layout:collectionViewLayout, sizeForItemAt:indexPath))!
        }
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDirection.calculateDirection(scrollView.contentOffset)
        
//        print("\(scrollDirection.direction)")
   
    }
    
}
