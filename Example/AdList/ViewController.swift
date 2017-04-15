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
        source.adPosition = AdPositioning(position: 7, height: 40, isStatic: false)
        return source
    }()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let data: [String] = {
        
        var tempData: [String] = []
        
        for index in 0...29 {
            tempData.insert("cell \(index)", at: index)
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
        cell.label.text = dataProvider.data[indexPath.row]

        return cell
    }
    
    func ad_collectionView(_ collectionView: UICollectionView, adCellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "adCell", for: indexPath)
        
        for view in cell.contentView.subviews {
            if view.isKind(of:UILabel.self) {
                view.removeFromSuperview()
            }
        }
        
        let label = UILabel(frame: cell.contentView.bounds)
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cell.contentView.backgroundColor = .lightGray
        label.textAlignment = .center
        label.text = "Ad Cell"
        cell.contentView.addSubview(label)

        return cell
    }
    
    func ad_collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }

}

