//
//  EditorWindowController.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

/**
 The EditorWindowController will control the main interface.
 The window for EditorWindowController will be EditorWindow
 The window's view will be managed by the EditorViewController
 Within the EditorViewController will be three separate subviews (from right to left)
    + SideFolderView
    + NotesView
    + TextEditorView
 Refer to each to know the function each serves.
 */

import Cocoa

class EditorWindowController: NSWindowController {

    convenience init() {
        let editorWindow = EditorWindow(contentViewController: EditorViewController())
        self.init(window: editorWindow)        
    }

}
