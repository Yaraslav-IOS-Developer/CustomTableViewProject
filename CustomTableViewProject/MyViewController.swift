//
//  MyViewController.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 04.03.2021.
//

import UIKit

class MyViewController: UIViewController, PersonImageTableViewCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let userSettingArray = [
        UserSettingModel(header: nil, row: [nil]),
        UserSettingModel(header: "YOUR INFO", row:["FIRST NAME", "SECOND NAME", "MOBILE NUMBER", "EMAIL ADDRESS", ""]),
        UserSettingModel(header: "CHANGE PASSWORD", row:["NEW PASWORD", "RETYPE NEW PASWWORD", "" ])
    ]
    
    
    var checkImage = false
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.register(PersonImageTableViewCell.self)
        tableView.register(PersonInfoTableViewCell.self)
        tableView.register(SaveButtonTableViewCell.self)
        
    }
    
    func buttonPressed() {
        alertController()
        checkImage = true
    }
    func longButtonPressed() {
        alertController()
        checkImage = false
    }
    
}

// MARK: - Data sourse
extension MyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        userSettingArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return userSettingArray[section].header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userSettingArray[section].row.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.create(PersonImageTableViewCell.self, indexPath)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.create(PersonInfoTableViewCell.self, indexPath)
            cell.infoForUserLabel.text = userSettingArray[indexPath.section].row[indexPath.row]
            let textPlaceholder = userSettingArray[indexPath.section].row[indexPath.row]
            cell.infoUserTextFild.placeholder =  "Enter" + " " + textPlaceholder!.capitalized

            if indexPath.row == 4 {
                
                cell.infoUserTextFild.isHidden = true
                cell.infoForUserLabel.isHidden = true
                
            }
            
            if indexPath.section == 2 && indexPath.row == 2  {
                let cell = tableView.create(SaveButtonTableViewCell.self, indexPath)
                return cell
            }
            
            return cell
        }  
    }
}

// MARK: - Table view delegate
extension MyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = #colorLiteral(red: 0.5362802744, green: 0.6920174956, blue: 0.8061967492, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font = UIFont(name: "Helvetica Neue", size: 14)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return .leastNonzeroMagnitude
        } else {
            return 40
        }
    }
}
// MARK: -  Work with image
extension MyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! PersonImageTableViewCell
        if let image = info[.originalImage] as? UIImage {
            
            
            if checkImage {
                cell.userImage.image = image
                cell.userImage.contentMode = .scaleAspectFill
                cell.userImage.clipsToBounds = true
                dismiss(animated: true)
                
            } else {
                cell.backroundImage.image = image
                cell.backroundImage.contentMode = .scaleAspectFill
                cell.backroundImage.clipsToBounds = true
                dismiss(animated: true)
                
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}


