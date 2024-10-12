//
//  TextHeaderCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import UIKit

final class TextHeaderCollectionViewCell: UICollectionViewCell {
    
    private let label = AttributedTappableLabel()
    
    var onTap : (() -> Void)?
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, highlightedText: String?) {
        label.setAttributedText(text: text,
                                highlightedText: highlightedText,
                                color: .systemIndigo,
                                font: .systemFont(ofSize: 18, weight: .bold))
    }
    
    private func layout() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        label.onTap = { [weak self] in
            self?.onTap?()
        }
    }
    
}
