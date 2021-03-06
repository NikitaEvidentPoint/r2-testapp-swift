//
//  SpineItemTableViewController.swift
//  r2-navigator
//
//  Created by Alexandre Camilleri on 6/28/17.
//  Copyright © 2017 European Digital Reading Lab. All rights reserved.
//

import UIKit
import R2Shared

class SpineItemsTableViewController: UITableViewController {
    var spine: [Link]
    var callBack: (Int)->()

    init(for spine: [Link], callWhenDismissed: @escaping (Int)->()) {
        self.spine = spine
        callBack = callWhenDismissed
        super.init(nibName: nil, bundle: nil)
        title = "Spine Items"
        tableView.delegate = self
        tableView.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        callBack(indexPath.row)
        self.navigationController?.popViewController(animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "SpineItemCell")

        cell.textLabel?.text = spine[indexPath.row].href
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spine.count
    }

    open override var prefersStatusBarHidden: Bool {
        return true
    }
}
