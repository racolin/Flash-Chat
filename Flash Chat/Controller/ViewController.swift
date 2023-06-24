//
//  ViewController.swift
//  Flash Chat
//
//  Created by Administrator on 18/06/2023.
//

import UIKit
import CLTypingLabel


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        animation()
    }
    
    func animation() {
        labelName.text = Constant.appName
//        let name = "FlashChat"
//        print(name)
//        var count = 0
//        for letter in name {
//            print(letter)
//            count += 1
//            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(count), repeats: false) {(timer) in self.labelName.text?.append(letter)}
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc func addText(_ text: String) {
        
    }
    
    @IBOutlet weak var labelName: CLTypingLabel!
    
    @IBAction func onRegister(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "toRegister", sender: self)
        
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "toLogin", sender: self)
        
    }
}

