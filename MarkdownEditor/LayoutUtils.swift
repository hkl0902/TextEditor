//
//  LayoutConstants.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/2/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Foundation
import Cocoa

struct EditorLayoutConstants {
    static var MIN_EDITOR_WINDOW_WIDTH: CGFloat = 1500
    static var MIN_EDITOR_WINDOW_HEIGHT: CGFloat = 1000


    // For now the height is the same as the editor height but this may change in the future
    static var MIN_TEXT_EDITOR_VIEW_WIDTH: CGFloat = 500
    static var MIN_TEXT_EDITOR_VIEW_HEIGHT: CGFloat = 1000

    static var MIN_SIDE_FOLDER_VIEW_WIDTH: CGFloat = 500    // When visible
    static var MIN_SIDE_FOLDER_VIEW_HEIGHT: CGFloat = 1000  // When visible

    static var MIN_NOTES_VIEW_WIDTH: CGFloat = 500          // When visible
    static var MIN_NOTES_VIEW_HEIGHT: CGFloat = 1000        // When visible

    static var SPACE_BW_SIDE_FOLDER_VIEW_NOTES_VIEW: CGFloat = 0
    static var SPACE_BW_NOTES_VIEW_EDITOR_VIEW: CGFloat = 0
}

struct LayoutUtils {

    /**
     Returns a tuple of NSLayoutConstraints
     Specifies that the ITEM must be at least MINWIDTH wide and at least MINHEIGHT tall
     */
    static func setSizeConstraint(item: Any, minWidth: CGFloat, minHeight: CGFloat) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        let widthConstraint = NSLayoutConstraint(item: item, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: minWidth)
        let heightConstraint = NSLayoutConstraint(item: item, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: minHeight)
        return (widthConstraint, heightConstraint)
    }
}
