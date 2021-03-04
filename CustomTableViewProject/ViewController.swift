//
//  ViewController.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 03.03.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    let userSettingArray = [
        UserSettingModel(header: nil, row: [nil]),
        UserSettingModel(header: "YOUR INFO", row:["FIRST NAME", "SECOND NAME", "MOBILE NAME", "EMAIL ADDRESS"]),
        UserSettingModel(header: "CHANGE PASSWORD", row:["NEW PASWORD", "RETYPE NEW PASWWORD"])
    ]
        let imagePicker = UIImagePickerController()
        var checkImage = false
        
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        imagePicker.delegate = self

    }
    
    // MARK: - IB Action
    @IBAction func actionUpdateProfilePictureButton() {
        //alertController()
        checkImage = true
    }
    @IBAction func actionLongPressBackgroundImage(_ sender: UILongPressGestureRecognizer) {
        //alertController()
        checkImage = false
    }
    
    
}
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        userSettingArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        userSettingArray[section].header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userSettingArray[section].row.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserImageTableViewCell else { return UITableViewCell() }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UserInfoTableViewCell else { return UITableViewCell() }
        
        cell.infoUserTextFild.tag = indexPath.row 
        cell.infoUserTextFild.delegate = self
        cell.infoForUserLabel.text = userSettingArray[indexPath.section].row[indexPath.row]
         let textPlaceholder = userSettingArray[indexPath.section].row[indexPath.row]
        cell.infoUserTextFild.placeholder =  "Enter" + " " + textPlaceholder!.capitalized
        return cell
    }
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.tag)
        
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
       // textField.resignFirstResponder()
        
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
                    nextField.becomeFirstResponder()
                } else {
                    textField.resignFirstResponder()
                }
                return false
    }
    
}
    
    
    

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if section == 0 {
            view.tintColor = .clear
        } else {
            view.tintColor = #colorLiteral(red: 0.5362802744, green: 0.6920174956, blue: 0.8061967492, alpha: 1)
            let header = view as! UITableViewHeaderFooterView
            header.textLabel?.textColor = .white
            header.textLabel?.font = UIFont(name: "Helvetica Neue", size: 14)
        }
        
    }
    
     func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        let view = UIView()

        let insets = tableView.separatorInset
        let width = tableView.bounds.width - insets.left - insets.right
        let separatorFrame = CGRect(x: insets.left, y: -0.5, width: width, height: 0.5)

        // create layer with separator, setting color
        let separator = CALayer()
        separator.frame = separatorFrame
        separator.backgroundColor = #colorLiteral(red: 0.9352450371, green: 0.9353671074, blue: 0.9388414025, alpha: 1)
        view.layer.addSublayer(separator)

        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return .leastNonzeroMagnitude
        } else {
            return 40
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return .leastNonzeroMagnitude
        } else {
            return  40
        }
    }
    
}
// MARK: -  Work with image

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
       
        if let image = info[.originalImage] as? UIImage {
            
            
            
           // if  checkImage  {
//                userImage.image = image
//                userImage.contentMode = .scaleAspectFill
//                userImage.clipsToBounds = true
//                dismiss(animated: true)
//                print(userImage.tag)
//            } else  {
//                backroundImage.image = image
//                backroundImage.contentMode = .scaleAspectFill
//                backroundImage.clipsToBounds = true
//                dismiss(animated: true)
//                print(backroundImage.tag)
//            }
            
       // }
        
    }
}
}
