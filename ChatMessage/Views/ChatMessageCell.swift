//
//  ChatMessageCell.swift
//  ChatMessage
//
//  Created by Marcos Felipe Souza on 26/08/2018.
//  Copyright © 2018 Marcos. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "When you provider a long string that is actually going to wrap onto the next line and maybe even a third line"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let contentChat: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var chatModel: ChatModel! {
        didSet {
            let myselfColor = UIColor(red: 50/255, green: 207/255, blue: 114/255, alpha: 1)
            
            contentChat.backgroundColor = chatModel.isComming ? .white : myselfColor
            messageLabel.textColor = chatModel.isComming ? .black : .white
            
            messageLabel.text = chatModel.message
            
            if chatModel.isComming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                trailingConstraint.isActive = true
                leadingConstraint.isActive = false
            }
        }
    }
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        addSubview(contentChat)
        addSubview(messageLabel)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupConstraints() {
        //Making constraints
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),            
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            contentChat.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
            contentChat.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            contentChat.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
            contentChat.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        
        
        
        
    }
}
