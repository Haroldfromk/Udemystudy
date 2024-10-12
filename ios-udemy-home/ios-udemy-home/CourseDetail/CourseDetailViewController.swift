//
//  CourseDetailViewController.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/12/24.
//

import UIKit

class CourseDetailViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
    }
    
    func setText(title: String) {
        titleLabel.text = title
        
    }
}
