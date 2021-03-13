//
//  UIView(extension).swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 03.03.2021.
//

import UIKit


extension UIView {
    
    
    class var identifier: String {
        return String(describing: self)
    }
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

