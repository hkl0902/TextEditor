//
//  EditorViewController.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Cocoa

class EditorViewController: NSViewController, NSStackViewDelegate {

    var sideFolderViewController: NSViewController!
    //var notesViewController: NSViewController!
    var textEditorViewController: NSViewController!
    
    override func loadView() {
        sideFolderViewController = SideFolderViewController()
        //notesViewController = NotesViewController()
        textEditorViewController = TextEditorViewController()
        
        let stackView = NSStackView(views: [sideFolderViewController.view, textEditorViewController.view])
        stackView.spacing = 0
        stackView.distribution = .fill
        self.view = stackView
        addConstraints()
    }
    
    private func addConstraints() {
        // Side Folder View
        let sideFolderViewConstraints = LayoutUtils.setSizeConstraint(item: self.sideFolderViewController.view,
                                                                  minWidth: EditorLayoutConstants.MIN_SIDE_FOLDER_VIEW_WIDTH,
                                                                  minHeight: EditorLayoutConstants.MIN_SIDE_FOLDER_VIEW_HEIGHT)
        // Notes View
        //let notesViewConstraints = LayoutUtils.setSizeConstraint(item: self.notesViewController.view,
        //                                                         minWidth: EditorLayoutConstants.MIN_NOTES_VIEW_WIDTH,
        //                                                         minHeight: EditorLayoutConstants.MIN_NOTES_VIEW_HEIGHT)
        // Text Editor View
        let textEditorViewConstraints = LayoutUtils.setSizeConstraint(item: self.textEditorViewController.view,
                                                                      minWidth: EditorLayoutConstants.MIN_TEXT_EDITOR_VIEW_WIDTH,
                                                                      minHeight: EditorLayoutConstants.MIN_TEXT_EDITOR_VIEW_HEIGHT)

        
        NSLayoutConstraint.activate([sideFolderViewConstraints.heightConstraint, sideFolderViewConstraints.widthConstraint,
                                     //notesViewConstraints.heightConstraint, notesViewConstraints.widthConstraint,
                                     textEditorViewConstraints.heightConstraint, textEditorViewConstraints.widthConstraint])
    }
    
    /* Opens a file the user chooses out of the NSOpenPanel
     */
    @objc public func openFile() {
        let panel = NSOpenPanel()
        panel.allowedFileTypes = ["txt"]
        panel.directoryURL = URL(fileURLWithPath: "/Users/hyunkyu/Pictures")
        panel.begin() { [unowned self] in
            if $0 == NSFileHandlingPanelOKButton {
                let theDoc = panel.urls[0]
                if let tevc = self.textEditorViewController as? TextEditorViewController {
                    let mutableString = tevc.textView?.textStorage?.mutableString
                    mutableString?.replaceCharacters(in: NSRange(location: 0, length: mutableString!.length), with: theDoc.absoluteString)
                }
            }
        }
    }
}
