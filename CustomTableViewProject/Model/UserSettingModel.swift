//
//  UserSettingModel.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 03.03.2021.
//

import UIKit


struct UserSettingModel {
    
    let header: String?
    let row: [String?]
    
    
    
    init(header:String?, row: [String?]) {
        self.header = header
        self.row = row
        
    }
    
}

