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

    var textField: NSTextField?
    
    override func loadView() {
        self.view = TextEditorView()
        self.view.wantsLayer = true
        textField = NSTextField()
        textField?.backgroundColor = NSColor.black
        textField?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textField!)
    }
    
    override func viewDidLoad() {
    }
    
    override func viewWillLayout() {
        addConstraints()
    }
    
    private func addConstraints() {
        guard let textField = textField else { return }
        //TODO: Get rid of magic numbers
        let textFieldSizeConstraints = LayoutUtils.setSizeConstraint(item: textField, minWidth: self.view.frame.width/2, minHeight: self.view.frame.height * 0.8)
        
        let textFieldLocationConstraints = LayoutUtils.setDistanceConstraints(item: textField, toItem: self.view, top: self.view.frame.height*0.1, right: self.view.frame.width*0.25, bottom: self.view.frame.height*0.1, left: self.view.frame.width*0.25, relatedBy: .lessThanOrEqual)
        
        NSLayoutConstraint.activate([textFieldSizeConstraints.heightConstraint, textFieldSizeConstraints.widthConstraint,
                                     textFieldLocationConstraints.bottomConstraint!, textFieldLocationConstraints.leftConstraint!,
                                     textFieldLocationConstraints.rightConstraint!, textFieldLocationConstraints.topConstraint!])
    }
}
