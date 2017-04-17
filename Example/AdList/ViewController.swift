//
//  ViewController.swift
//  AdList
//
//  Created by isapozhnik on 04/15/2017.
//  Copyright (c) 2017 isapozhnik. All rights reserved.
//

import UIKit
import AdList

class ViewController: UIViewController, AdListCollectionViewDataSource {
    
    let dataProvider: AdListCollectionViewDataProvider = {
        let source = AdListCollectionViewDataProvider()
        
        let facebookType0 = AdListFacebookItem(positioning: AdPositioning(position: 7, height: 90, isStatic: false))
//        let facebookType1 = AdListFacebookItem(positioning: AdPositioning(position: 20, height: 120, isStatic: true))
        let googleType1 = AdListGoogleItem(positioning: AdPositioning(position: 1, height: 280, isStatic: true))
        
        source.adItems = [facebookType0, googleType1]
        
        return source
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let data: [DataModel] = {
        
        var tempData: [DataModel] = []
        
        for index in 0...66 {
            let model = DataModel(title: "cell \(index)")
            tempData.insert(model, at: index)
        }
        
        return tempData
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataProvider.originalData = data
        dataProvider.delegate = self

        collectionView.backgroundColor = .white
        collectionView.register(UINib.init(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "adCell")
        collectionView.dataSource = dataProvider
        collectionView.delegate = dataProvider
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: 
    
    func ad_collectionView(_ collectionView: UICollectionView, itemCellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        
        cell.contentView.backgroundColor = .white
        let model = dataProvider.data[indexPath.row]
        cell.label.text = model.placeholderTitle() ?? "No title provided"
        
        return cell
    }
    
    func ad_collectionView(_ collectionView: UICollectionView, adCellForAdItem adItem: AdListItem, indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "adCell", for: indexPath)
        
        for view in cell.contentView.subviews {
            if view.isKind(of:UILabel.self) {
                view.removeFromSuperview()
            }
        }
        
        let label = UILabel(frame: cell.contentView.bounds)
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cell.contentView.backgroundColor = adItem.adBackgroundColor() ?? UIColor.lightGray
        label.textAlignment = .center
        label.text = adItem.placeholderTitle() ?? "Title for Ad not provided"
        cell.contentView.addSubview(label)

        return cell
    }
    
    func ad_collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 90)
    }

}

