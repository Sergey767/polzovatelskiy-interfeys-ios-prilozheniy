//
//  LaunchControllerVk.swift
//  Vkontakte
//
//  Created by Серёжа on 16/06/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class LaunchControllerVk: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vkontakteLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Actions
    
    @IBAction func unwindSegue(unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func EntranceButtonPressed(_ sender: UIButton) {
        checkTextFields()
    }
    
    func checkTextFields() {
        if loginTextField.text == "",
            passwordTextField.text == "" {
            print("Успешная авторизация")
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Введены не верные данные пользователя", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.passwordTextField.text = ""
            }
            
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Keyboard
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    //MARK: - Segues
    
}
