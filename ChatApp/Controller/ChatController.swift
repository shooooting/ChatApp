//
//  ChatController.swift
//  ChatApp
//
//  Created by ㅇ오ㅇ on 2020/12/24.
//

import UIKit

class ChatController: UICollectionViewController {
    
    // MARK: - Properties
    private let user: User
    
    // MARK: - Lifecycle
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        print("DEBUG: \(user.username)")
    }
    
    
    // MARK: - Helper
    
    func configureUI() {
        collectionView.backgroundColor = .white
    }
}
