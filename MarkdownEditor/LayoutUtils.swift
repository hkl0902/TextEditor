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

    /**
     Returns a tuple of NSLayoutConstraints
     Species that ITEM must be a certain distance to TOITEM in each direction
     Assumes that ITEM is complete inside TOITEM
     If no distance is to be specified, nil should be passed. nil will be returned for that constraint
     */
    static func setDistanceConstraints(item: Any, toItem: Any, top: CGFloat?, right: CGFloat?, bottom: CGFloat?, left: CGFloat?)
        -> (topConstraint: NSLayoutConstraint?, rightConstraint: NSLayoutConstraint?, bottomConstraint: NSLayoutConstraint?, leftConstraint: NSLayoutConstraint?)
    {
        var topConstraint: NSLayoutConstraint?
        var bottomConstraint: NSLayoutConstraint?
        var rightConstraint: NSLayoutConstraint?
        var leftConstraint: NSLayoutConstraint?
        if let topDistance = top {
            topConstraint = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: toItem, attribute: .top, multiplier: 1, constant: topDistance)
        }
        if let bottomDistance = bottom {
            bottomConstraint = NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: toItem, attribute: .bottom, multiplier: 1, constant: bottomDistance)
        }
        if let rightDistance = right {
            rightConstraint = NSLayoutConstraint(item: item, attribute: .right, relatedBy: .equal, toItem: toItem, attribute: .right, multiplier: 1, constant: rightDistance)
        }
        if let leftDistance = left {
            leftConstraint = NSLayoutConstraint(item: item, attribute: .left, relatedBy: .equal, toItem: toItem, attribute: .left, multiplier: 1, constant: leftDistance)
        }

        return (topConstraint, rightConstraint, bottomConstraint, leftConstraint)
    }
}
