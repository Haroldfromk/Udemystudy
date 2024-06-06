//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by Dongik Song on 6/5/24.
//

import UIKit

protocol AuthLoginModel {
    var formIsFailed: Bool { get }
    var backgroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}


struct LoginViewModel {
    
    var email: String?
    var password: String?
    
    var formIsFailed: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var backgroundColor: UIColor {
        return formIsFailed ? (UIColor.black) : (UIColor.black.withAlphaComponent(0.5))
    }
    
    var buttonTitleColor: UIColor {
        return formIsFailed ? (UIColor.white) : (UIColor(white: 1, alpha: 0.7))
    }
    
}

struct RegViewModel: AuthLoginModel{
    
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsFailed: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullname?.isEmpty == false && username?.isEmpty == false
    }
    
    var backgroundColor: UIColor {
        return formIsFailed ? (UIColor.black) : (UIColor.black.withAlphaComponent(0.5))
    }
    
    var buttonTitleColor: UIColor {
        return formIsFailed ? (UIColor.white) : (UIColor(white: 1, alpha: 0.7))
    }
    
}
