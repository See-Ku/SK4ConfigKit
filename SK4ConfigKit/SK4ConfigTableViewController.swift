//
//  SK4ConfigTableViewController.swift
//  SK4Toolkit
//
//  Created by See.Ku on 2016/03/30.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4Toolkit

/// ユーザー設定用テーブル表示ViewControllerクラス
public class SK4ConfigTableViewController: SK4TableViewController {

	// /////////////////////////////////////////////////////////////
	// MARK: - プロパティ＆初期化

	/// ユーザー設定管理クラス
	public var configAdmin: SK4ConfigAdmin?

	/// 初期化
	public func setup(configAdmin configAdmin: SK4ConfigAdmin) {
		let tv = makeDefaultTableView()
		sk4LimitWidthConstraints(self, view: tv, maxWidth: SK4ToolkitConst.tableViewMaxWidth)

		setup(tableView: tv, configAdmin: configAdmin)
	}

	/// 初期化
	public func setup(tableView tableView: UITableView, configAdmin: SK4ConfigAdmin) {
		self.tableView = tableView
		self.configAdmin = configAdmin
		self.tableAdmin = SK4ConfigTableViewAdmin(tableView: tableView, parent: self, configAdmin: configAdmin)
	}

	// /////////////////////////////////////////////////////////////
	// MARK: - for UIViewController

	override public func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		if let configAdmin = configAdmin {
			navigationItem.title = configAdmin.title
		}
	}

}

// eof
