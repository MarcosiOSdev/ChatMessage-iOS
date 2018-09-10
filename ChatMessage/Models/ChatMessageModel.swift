//
//  ChatMessageModel.swift
//  ChatMessage
//
//  Created by Marcos Felipe Souza on 29/08/2018.
//  Copyright © 2018 Marcos. All rights reserved.
//

import Foundation

struct ChatMessageModel {
    let date: Date
    let chat: [ChatModel]
}

struct ChatModel {
    let message: String
    let isComming: Bool
}
