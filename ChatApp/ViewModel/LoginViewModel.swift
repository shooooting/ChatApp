//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by ㅇ오ㅇ on 2020/12/13.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
    }
}
