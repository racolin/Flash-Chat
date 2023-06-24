//
//  RegisterController.swift
//  Flash Chat
//
//  Created by Administrator on 18/06/2023.
//

import UIKit
import Firebase

class RegisterController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func onRegister(_ sender: UIButton) {
        if let em = email.text, let pa = password.text {
            Auth.auth().createUser(withEmail: em, password: pa) {result, error in
                if let err = error {
                    print(err)
                } else {
                    self.performSegue(withIdentifier: Constant.routeRegister, sender: self)
                }
            }
        }
    }
}
