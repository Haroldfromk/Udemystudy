//
//  MainBannerCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import SwiftUI

final class MainBannerCollectionViewCell: UICollectionViewCell {
    
    private var hostingController: UIHostingController<MainBannerView>!
    
    func configure(
        imageLink: String,
        title: String,
        caption: String)
    {
        guard hostingController == nil else { return }
        let mainBannerView = MainBannerView(imageLink: imageLink, title: title, caption: caption)
        hostingController = UIHostingController(rootView: mainBannerView)
        guard let hostingController = hostingController else { return }
        addSubview(hostingController.view)
        hostingController.view.clipsToBounds = true
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
