//
//  MyTableViewCell.swift
//  ExampleCell
//
//  Created by 김종권 on 2021/08/05.
//

import UIKit
import SnapKit

class MyTableViewCell: BaseTableViewCell<Person> {

    private lazy var genderView: UIView = {
        let view = UIView(frame: .init(x: 0, y: 0, width: 16, height: 16))
        view.layer.cornerRadius = 8

        return view
    }()

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8

        return view
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label

        return label
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .secondaryLabel

        return label
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            contentView.layer.borderWidth = 2
            contentView.layer.borderColor = UIColor.blue.cgColor
        } else {
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
    }

    override func configure() {
        super.configure()

        backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(genderView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ageLabel)
    }

    private func makeConstraints() {
        genderView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(16)
            maker.centerY.equalToSuperview()
            maker.width.height.equalTo(16)
        }

        stackView.snp.makeConstraints { maker in
            maker.leading.equalTo(genderView.snp.trailing).offset(4)
            maker.centerY.equalToSuperview()
            maker.trailing.greaterThanOrEqualToSuperview().inset(8)
        }

        nameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        ageLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    override func bind(_ model: Person) {
        super.bind(model)

        nameLabel.text = model.name
        ageLabel.text = "age: " + String(describing: model.age)
        genderView.backgroundColor = model.gender == .man ? .blue : .red
    }
}
