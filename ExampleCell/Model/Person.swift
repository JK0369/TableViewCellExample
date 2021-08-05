//
//  Person.swift
//  ExampleCell
//
//  Created by 김종권 on 2021/08/05.
//

import Foundation

struct Person {

    enum GenderType {
        case man
        case woman
    }

    let name: String
    let age: Int
    let gender: GenderType
}
