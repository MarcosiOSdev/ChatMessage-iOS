//
//  ViewController.swift
//  ChatMessage
//
//  Created by Marcos Felipe Souza on 26/08/2018.
//  Copyright © 2018 Marcos. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate let cellIdentifier = "cellIdentifier"
    
    let messages: [ChatMessageModel]
        = [ ChatMessageModel(date: Date(stringDate: "28/09/2018"), chat: [ChatModel(message: "Olá , minha primeira mensagem", isComming: true),
                                                 ChatModel(message: "Está aqui é minha primeira mensagem um pouco maior", isComming: true)]),
                                         
            ChatMessageModel(date: Date(stringDate: "29/09/2018"), chat: [ChatModel(message: "Agora está mensagem eu vou mensagear um outra menssagem para que estore as margens,Agora está mensagem eu vou mensagear um outra menssagem para que estore as margens,Agora está mensagem eu vou mensagear um outra menssagem para que estore as margens,Agora está mensagem eu vou mensagear um outra menssagem para que estore as margens", isComming: false),
                                                 ChatModel(message: "Okay, Vlw!", isComming: true),
                                                 ChatModel(message: "Essa eh pra ir a UK!", isComming: false)]),
            
            ChatMessageModel(date: Date(stringDate: "30/09/2018"), chat: [
                ChatModel(message: "Vai sim !", isComming: true),
                ChatModel(message: "So ter fé", isComming: true),
                ChatModel(message: "kkkkk... Vlw!", isComming: false)
                ])
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Big titles
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //Register Cell Identifier in TableView
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellIdentifier)
        
        //Remove Separator lines
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        tableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].chat.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ChatMessageCell
        let chatModel = messages[indexPath.section].chat[indexPath.row]
        cell.chatModel = chatModel
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateString = convertDateInString(messages[section].date)
        return dateString
    }
    
    fileprivate func convertStringInDate(_ stringDt: String) -> Date {
        let converter = DateFormatter()
        converter.dateFormat = "dd/MM/yyyy"
        return converter.date(from: stringDt) ?? Date()
    }
    
    fileprivate func convertDateInString(_ date: Date) -> String {
        let converter = DateFormatter()
        converter.dateFormat = "dd/MM/yyyy"
        return converter.string(from: date)
    }

}

