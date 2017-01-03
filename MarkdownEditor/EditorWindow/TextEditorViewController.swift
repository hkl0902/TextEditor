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

    var textView : NSTextView?

    override func loadView() {
        self.view = TextEditorView()
        self.view.wantsLayer = true
        textView = NSTextView()
        textView?.backgroundColor = NSColor(calibratedRed: 0.522, green: 0.596, blue: 0.110, alpha: 1.00)
        textView?.translatesAutoresizingMaskIntoConstraints = false
        textView?.focusRingType = .none
        self.view.addSubview(textView!)
    }

    override func viewDidLoad() {
    }

    override func viewWillLayout() {
        addConstraints()
    }

    private func addConstraints() {
        guard let textView = textView else { return }

        let heightMultiplier = EditorLayoutConstants.MIN_TEXT_FIELD_HEIGHT_MULTIPLIER
        let widthMultiplier = EditorLayoutConstants.MIN_TEXT_FIELD_WIDTH_MULTIPLIER

        let textViewSizeConstraints = LayoutUtils.setSizeConstraint(item: textView,
                                                                     minWidth: self.view.frame.width * heightMultiplier,
                                                                     minHeight: self.view.frame.height * widthMultiplier)

        let textViewLocationConstraints = LayoutUtils.setDistanceConstraints(item: textView,
                                                                              toItem: self.view,
                                                                              top: self.view.frame.height*(1 - heightMultiplier)/2,
                                                                              right: self.view.frame.width*(1 - widthMultiplier)/2,
                                                                              bottom: self.view.frame.height*(1 - heightMultiplier)/2,
                                                                              left: self.view.frame.width*(1 - widthMultiplier)/2,
                                                                              relatedBy: .lessThanOrEqual)

        let textViewCenteringConstraints = LayoutUtils.center(item: textView, inItem: self.view)

        NSLayoutConstraint.activate([textViewSizeConstraints.heightConstraint, textViewSizeConstraints.widthConstraint,
                                     textViewLocationConstraints.bottomConstraint!, textViewLocationConstraints.leftConstraint!,
                                     textViewLocationConstraints.rightConstraint!, textViewLocationConstraints.topConstraint!,
                                     textViewCenteringConstraints.horizontalConstraint, textViewCenteringConstraints.verticalConstraint])
    }
}
