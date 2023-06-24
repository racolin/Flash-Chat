//
//  ChatController.swift
//  Flash Chat
//
//  Created by Administrator on 18/06/2023.
//

import UIKit
import Firebase

class ChatController : UIViewController {
    
    let db = Firestore.firestore()
    
    var messages : [MessageModel] = []
    
    @IBAction func onLogOut(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print(error)
        }
    }
    
    @IBAction func onSend(_ sender: UIButton) {
        if let content = inputChat.text, let sender = Auth.auth().currentUser?.email {
            let message = MessageModel(sender: sender, content: content, sendedTime: Date())
            db.collection(Constant.colectionMessages).addDocument(data: message.toDocument())
            inputChat.text = ""
            inputChat.resignFirstResponder()
        }
    }
    @IBOutlet weak var tableChat: UITableView!
    
    @IBOutlet weak var inputChat: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        tableChat.dataSource = self
        
        tableChat.register(UINib(nibName: Constant.xibLeftMessage, bundle: nil), forCellReuseIdentifier: Constant.leftMessage)
        
        tableChat.register(UINib(nibName: Constant.xibRightMessage, bundle: nil), forCellReuseIdentifier: Constant.rightMessage)
        
        db.collection(Constant.colectionMessages)
            .order(by: MessageModel.sendedTimeField)
            .addSnapshotListener() {querySnapshot, error in
                if let err = error {
                    print("Có lỗi xảy ra: \(err)")
                } else {
                    if let snapshot = querySnapshot {
                        self.messages = snapshot.documents.map {document in
                            return MessageModel(document: document.data())
                        }
                        self.uploadData()
                    } else {
                        print("Không có dữ liệu")
                    }
                }
            }
    }
    
    func uploadData() {
        
        DispatchQueue.main.async {
            self.tableChat.reloadData()
            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
            self.tableChat.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
}

//MARK: - Implement of UITableViewDataSource

extension ChatController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if messages[indexPath.row].sender == Auth.auth().currentUser?.email {
            let cell  = tableView.dequeueReusableCell(withIdentifier: Constant.rightMessage, for: indexPath) as! RightMessageCell
            
            cell.labelMessage?.text = messages[indexPath.row].content
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.leftMessage, for: indexPath) as! LeftMessageCell
            
            cell.labelMessage?.text = messages[indexPath.row].content
            return cell
        }
    }
}
