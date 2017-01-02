//
//  SideFolderViewController.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

/**
 Manages the SideFolderView
 The SideFolderView shows the notes hierarchy (if one exists)
 */

import Cocoa

class SideFolderViewController: NSViewController {

    override func loadView() {
        self.view = SideFolderView()
    }
    
}
