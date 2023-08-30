//
//  AddSubViews+Extensions.swift
//  MVVM Academy
//
//  Created by Kerem Demir on 30.08.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
