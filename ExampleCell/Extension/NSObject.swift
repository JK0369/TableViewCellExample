//
//  NSObject.swift
//  ExampleCell
//
//  Created by 김종권 on 2021/08/05.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
