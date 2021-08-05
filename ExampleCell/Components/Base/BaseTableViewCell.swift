//
//  BaseTableViewCell.swift
//  ExampleCell
//
//  Created by 김종권 on 2021/08/05.
//

import UIKit

class BaseTableViewCell<T>: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        selectionStyle = .none
    }

    var model: T? {
        didSet { if let model = model { bind(model) } }
    }

    func bind(_ model: T) {}
}
