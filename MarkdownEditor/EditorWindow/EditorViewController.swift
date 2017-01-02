//
//  EditorViewController.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Cocoa

class EditorViewController: NSViewController {

    var sideFolderViewController: NSViewController!
    var notesViewController: NSViewController!
    var textEditorViewController: NSViewController!
    
    override func loadView() {
        sideFolderViewController = SideFolderViewController()
        notesViewController = NotesViewController()
        textEditorViewController = TextEditorViewController()
        
        self.view = NSStackView(views: [sideFolderViewController.view, notesViewController.view, textEditorViewController.view])
        
        addConstraints()
    }
}
