//
//  UIApplication.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 2/4/22.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
