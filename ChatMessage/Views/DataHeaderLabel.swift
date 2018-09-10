//
//  DataHeaderLabel.swift
//  ChatMessage
//
//  Created by Marcos Felipe Souza on 09/09/2018.
//  Copyright © 2018 Marcos. All rights reserved.
//

import UIKit

class DataHeaderLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 50/255, green: 207/255, blue: 114/255, alpha: 0.7)
        textColor = .white
        textAlignment = .center
        font = UIFont.boldSystemFont(ofSize: 14)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 20, height: height)
    }
    
}
