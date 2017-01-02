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

class NotesViewController: NSViewController, NSTableViewDelegate {

    override func loadView() {
        self.view = NotesTableView()
    }
}
