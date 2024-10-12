//
//  FeaturedCourseCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import SwiftUI

final class FeaturedCourseCollectionViewCell: UICollectionViewCell {
    private var hostingController: UIHostingController<FeaturedCourseView>!
    
    var onTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(
        imageLink: String,
        title: String,
        author: String,
        rating: Double,
        reviewCount: Int,
        price: Decimal
    ) {
        guard hostingController == nil else { return }
        let featuredCourseView = FeaturedCourseView(
            imageLink: imageLink,
            title: title,
            author: author,
            rating: rating,
            reviewCount: reviewCount,
            price: price
        )
        hostingController = UIHostingController(rootView: featuredCourseView)
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
