//
//  AdListAdapterDataSource.swift
//  Pods
//
//  Created by Sapozhnik Ivan on 15/04/17.
//
//

import UIKit

protocol AdListAdapterDataSource {
    
    func objectsForListAdapter(_ adapter: AdListAdapter) -> [Any]
    
}
