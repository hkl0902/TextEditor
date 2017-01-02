//
//  TextEditorViewController.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

/**
 Manages the TextEditorView
 The TextEditorView will be where the user types (generally) and where the file will be displayed
 */

import Cocoa

class TextEditorViewController: NSViewController {

    override func loadView() {
        self.view = TextEditorView()
        self.view.wantsLayer = true
    }
}
