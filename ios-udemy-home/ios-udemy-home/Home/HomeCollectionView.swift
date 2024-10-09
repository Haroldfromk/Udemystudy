//
//  HomeCollectionView.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import UIKit

final class HomeCollectionView: UICollectionView {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .green
    }
}
