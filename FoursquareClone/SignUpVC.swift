//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Zehra Öner on 29.07.2024.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signinButton(_ sender: Any) {
        if usernameTextField.text != "" && passwordTextField.text != "" {
            PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!){ (user,error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else{
                    print ("welcome")
                    print (user?.username)
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else{
            makeAlert(titleInput: "Error", messageInput: "Username/Password?")
        }
    }
    @IBAction func signupButton(_ sender: Any) {
        if usernameTextField.text != "" && passwordTextField.text != "" {
            let user = PFUser()
            user.username=usernameTextField.text!
            user.password=passwordTextField.text!
            
            user.signUpInBackground{ (success, error) in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }
        else{
                makeAlert(titleInput: "Error", messageInput: "Usernama/Password?")
        }
    }
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
                                  
}
}
