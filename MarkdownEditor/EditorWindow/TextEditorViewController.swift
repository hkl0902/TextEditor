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

        let heightMultiplier = EditorLayoutConstants.MIN_TEXT_FIELD_HEIGHT_MULTIPLIER
        let widthMultiplier = EditorLayoutConstants.MIN_TEXT_FIELD_WIDTH_MULTIPLIER

        let textFieldSizeConstraints = LayoutUtils.setSizeConstraint(item: textField,
                                                                     minWidth: self.view.frame.width * heightMultiplier,
                                                                     minHeight: self.view.frame.height * widthMultiplier)

        let textFieldLocationConstraints = LayoutUtils.setDistanceConstraints(item: textField,
                                                                              toItem: self.view,
                                                                              top: self.view.frame.height*(1 - heightMultiplier)/2,
                                                                              right: self.view.frame.width*(1 - widthMultiplier)/2,
                                                                              bottom: self.view.frame.height*(1 - heightMultiplier)/2,
                                                                              left: self.view.frame.width*(1 - widthMultiplier)/2,
                                                                              relatedBy: .lessThanOrEqual)

        let textFieldCenteringConstraints = LayoutUtils.center(item: textField, inItem: self.view)
        
        NSLayoutConstraint.activate([textFieldSizeConstraints.heightConstraint, textFieldSizeConstraints.widthConstraint,
                                     textFieldLocationConstraints.bottomConstraint!, textFieldLocationConstraints.leftConstraint!,
                                     textFieldLocationConstraints.rightConstraint!, textFieldLocationConstraints.topConstraint!,
                                     textFieldCenteringConstraints.horizontalConstraint, textFieldCenteringConstraints.verticalConstraint])
    }
}
