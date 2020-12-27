//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by ㅇ오ㅇ on 2020/12/27.
//

import UIKit

struct MessageViewModel {

    private let message: Message
    
    var messageBackgroundColor: UIColor {
        return message.isFromCurrentUser ? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) : .systemPurple
    }
    
    var messageTextColor: UIColor {
        return message.isFromCurrentUser ? .black : .white
    }
    
    init(message: Message) {
        self.message = message
    }
}
