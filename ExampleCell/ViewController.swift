//
//  ViewController.swift
//  ExampleCell
//
//  Created by 김종권 on 2021/08/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var dataSource: [Person] = [.init(name: "jake", age: 20, gender: .man),
                                .init(name: "park", age: 30, gender: .woman),
                                .init(name: "hap", age: 40, gender: .man),
                                .init(name: "kim", age: 40, gender: .man),
                                .init(name: "jack", age: 40, gender: .woman),]

    lazy var containerView: UIView = {
        let view = UIView()

        return view
    }()

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.backgroundColor = .white
        view.rowHeight = 72
        view.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.className)

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(containerView)
        containerView.addSubview(tableView)

        containerView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalTo(200)
        }

        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.selectRow(at: IndexPath(row: 0, section: 0),
                            animated: true,
                            scrollPosition: .top)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.className) as! MyTableViewCell
        cell.model = dataSource[indexPath.row]
        return cell
    }
}
