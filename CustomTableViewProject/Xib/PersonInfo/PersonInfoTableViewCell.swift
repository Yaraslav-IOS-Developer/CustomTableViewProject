//
//  PersonInfoTableViewCell.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 04.03.2021.
//

import UIKit

class PersonInfoTableViewCell: UITableViewCell  {
    
    var activeTextField : UITextField? = nil
    
    @IBOutlet weak var infoForUserLabel: UILabel!
    @IBOutlet weak var infoUserTextFild: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        infoUserTextFild.delegate = self
        infoUserTextFild.tag = 0

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
}

extension PersonInfoTableViewCell: UITextFieldDelegate {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        var shouldMoveViewUp = false
        
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.superview).maxY;
            let topOfKeyboard = (self.superview?.frame.height)! - keyboardSize.height
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        
        if(shouldMoveViewUp) {
            self.superview?.frame.origin.y = 0 - keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.superview?.frame.origin.y = 0
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        textField.resignFirstResponder()

        return false
        
    }
}
