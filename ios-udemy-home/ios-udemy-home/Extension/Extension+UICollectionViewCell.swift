//
//  Extension+UICollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import UIKit

extension UICollectionViewCell {
     static var namedIdentifier: String {
        return String(describing: self)
    }
}
