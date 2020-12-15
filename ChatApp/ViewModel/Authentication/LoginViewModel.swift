//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by ㅇ오ㅇ on 2020/12/13.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
        /*
         email과 password에 값이 들어오면 false 가 됨, 안들어오면 true.
         
         return false == false && true == false => 이렇게 되면 false.
         
         false == false 면 true
         true == false 면 false
         
         return 한다.
         */
    }
}
