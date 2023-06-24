//
//  LoginController.swift
//  Flash Chat
//
//  Created by Administrator on 18/06/2023.
//

import UIKit
import Firebase

class LoginController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func onLogin(_ sender: UIButton) {
        if let em = email.text, let pa = password.text {
            Auth.auth().signIn(withEmail: em, password: pa) {result, error in
                if let err = error {
                    print(err)
                } else {
                    self.performSegue(withIdentifier: Constant.routeLogin, sender: self)
                }
            }
        }
    }
}
