//
//  AdPositioning.swift
//  Pods
//
//  Created by Ivan Sapozhnik on 4/15/17.
//
//

import Foundation

public struct AdPositioning {
    public var position: Int!
    public var height: Double!
    public var isStatic: Bool!
    
    public init(position: Int, height: Double, isStatic: Bool) {
        self.position = position
        self.height = height
        self.isStatic = isStatic
    }
    
    //    func isAd(indexPath: IndexPath, total: Int) -> Bool {
    //        if `static` {
    //
    //            if indexPath.row < position {
    //                if indexPath.row == total - 1 {
    //                    return true
    //                } else {
    //                    return position == indexPath.row
    //                }
    //            } else {
    //                 return indexPath.row == position
    //            }
    //
    //        } else {
    //            return indexPath.row != 0 && (indexPath.row % position == 0 || indexPath.row == total - 1)
    //        }
    //    }
}
