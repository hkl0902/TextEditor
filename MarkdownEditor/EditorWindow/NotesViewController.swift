//
//  NotesViewController.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

/**
 Manages the NotesView
 The NotesView gives a preview of the notes within the currently selected hierarchy
 Here is where the user will decide which note to view/edit
 */

import Cocoa

class NotesViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    var tableView: NotesTableView!
    
    override func loadView() {
        tableView = NotesTableView()
        tableView.delegate = self
        tableView.dataSource = self
        self.view = tableView
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 13
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        print("Hello")
        return view
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let view = NSTableRowView()
        view.addSubview(NSButton(title: "\(row)", target: nil, action: nil))
        return view
    }
}


