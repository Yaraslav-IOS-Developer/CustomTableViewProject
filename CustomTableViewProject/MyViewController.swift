//
//  MyViewController.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 04.03.2021.
//

import UIKit

class MyViewController: UIViewController, PersonImageTableViewCellDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var checkImage = false
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.register(PersonImageTableViewCell.self)
        tableView.register(PersonInfoTableViewCell.self)
    }
    
    func didButtonPressed() {
        alertController()
        checkImage = true
    }
}

// MARK: - Data sourse
extension MyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section  {
        case 0: return nil
        case 1: return "YOUR INFO"
        case 2: return "CHANGE PASSWORD"
        default:
            return nil
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.create(PersonImageTableViewCell.self, indexPath)
            cell.delegate = self
            return cell
        }
            
            let cell = tableView.create(PersonInfoTableViewCell.self, indexPath)
            
       return cell
 
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

