//
//  UdemyBusinessCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import SwiftUI

final class UdemyBusinessCollectionViewCell: UICollectionViewCell {
    private var hostingController: UIHostingController<UdemyBusinessView>!
    
    var onTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        hostingController = UIHostingController(rootView: UdemyBusinessView())
        addSubview(hostingController.view)
        hostingController.view.clipsToBounds = true
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hostingController.rootView.onTap = { [weak self] in
            self?.onTap?()
        }
    }
}


