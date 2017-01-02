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
    var notesViewController: NSViewController!
    var textEditorViewController: NSViewController!
    
    override func loadView() {
        sideFolderViewController = SideFolderViewController()
        notesViewController = NotesViewController()
        textEditorViewController = TextEditorViewController()
        
        let stackView = NSStackView(views: [sideFolderViewController.view, notesViewController.view, textEditorViewController.view])
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
        let notesViewConstraints = LayoutUtils.setSizeConstraint(item: self.notesViewController.view,
                                                                 minWidth: EditorLayoutConstants.MIN_NOTES_VIEW_WIDTH,
                                                                 minHeight: EditorLayoutConstants.MIN_NOTES_VIEW_HEIGHT)
        // Text Editor View
        let textEditorViewConstraints = LayoutUtils.setSizeConstraint(item: self.textEditorViewController.view,
                                                                      minWidth: EditorLayoutConstants.MIN_TEXT_EDITOR_VIEW_WIDTH,
                                                                      minHeight: EditorLayoutConstants.MIN_TEXT_EDITOR_VIEW_HEIGHT)
        // sets max size for sidefolderview
        let testConstraint = NSLayoutConstraint(item: sideFolderViewController.view, attribute: .width, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: 600)
        
        
        NSLayoutConstraint.activate([sideFolderViewConstraints.heightConstraint, sideFolderViewConstraints.widthConstraint, testConstraint,
                                     notesViewConstraints.heightConstraint, notesViewConstraints.widthConstraint, 
                                     textEditorViewConstraints.heightConstraint, textEditorViewConstraints.widthConstraint])
    }
}
