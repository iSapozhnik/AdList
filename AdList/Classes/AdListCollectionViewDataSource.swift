//
//  AdListCollectionViewDatasource.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

public protocol AdListCollectionViewDataSource {
    
    func ad_collectionView(_ collectionView: UICollectionView, itemCellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    func ad_collectionView(_ collectionView: UICollectionView, adCellForAdItem adItem: AdListItem, indexPath: IndexPath) -> UICollectionViewCell
    
    func ad_collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
}
