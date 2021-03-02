//
//  ProfileSettingsTableViewController(extension).swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 02.03.2021.
//

import UIKit


extension ProfileSettingsTableViewController {
    
    func alertController() {
        
            
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true)
                
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true)
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
    }
    
}



