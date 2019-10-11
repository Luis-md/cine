//
//  UINavChange.swift
//  cineApp
//
//  Created by Luis_md on 10/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func changeNavCont() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }

}
