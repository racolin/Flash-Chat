//
//  MessageModel.swift
//  Flash Chat
//
//  Created by Administrator on 22/06/2023.
//

import Foundation

struct MessageModel {
    
    static let senderField = "sender"
    static let contentField = "content"
    static let sendedTimeField = "sendedTime"
    
    let sender : String
    let content : String
    let sendedTime : Date
    
    init(sender: String, content: String, sendedTime: Date) {
        self.sender = sender
        self.content = content
        self.sendedTime = sendedTime
    }
    
    init(document: [String: Any]) {
        sender = document[MessageModel.senderField] as! String
        content = document[MessageModel.contentField] as! String
        sendedTime = Date(timeIntervalSince1970: document[MessageModel.sendedTimeField] as! Double)
    }
    
    func toDocument() -> [String: Any] {
        return [MessageModel.senderField : sender, MessageModel.contentField : content, MessageModel.sendedTimeField : sendedTime.timeIntervalSince1970]
    }
}
