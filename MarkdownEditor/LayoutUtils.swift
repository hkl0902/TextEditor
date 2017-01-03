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
    static var MAX_EDITOR_WINDOW_WIDTH: CGFloat = 1500
    static var MAX_EDITOR_WINDOW_HEIGHT: CGFloat = 1000


    // For now the height is the same as the editor height but this may change in the future
    static var MIN_TEXT_EDITOR_VIEW_WIDTH: CGFloat = 500
    static var MIN_TEXT_EDITOR_VIEW_HEIGHT: CGFloat = 1000

    // Percentage of the current field
    static var MIN_TEXT_FIELD_WIDTH_MULTIPLIER: CGFloat = 0.5
    static var MAX_TEXT_FIELD_WIDTH_MULTIPLIER: CGFloat = 0.8
    static var MIN_TEXT_FIELD_HEIGHT_MULTIPLIER: CGFloat = 0.5
    static var MAX_TEXT_FIELD_HEIGHT_MULTIPLIER: CGFloat = 0.8
    
    static var MIN_SIDE_FOLDER_VIEW_WIDTH: CGFloat = 500    // When visible
    static var MIN_SIDE_FOLDER_VIEW_HEIGHT: CGFloat = 1000  // When visible

    static var MIN_NOTES_VIEW_WIDTH: CGFloat = 500          // When visible
    static var MIN_NOTES_VIEW_HEIGHT: CGFloat = 1000        // When visible

    static var MAX_TEXT_EDITOR_VIEW_WIDTH: CGFloat = 500
    static var MAX_TEXT_EDITOR_VIEW_HEIGHT: CGFloat = 1000

    static var MAX_SIDE_FOLDER_VIEW_WIDTH: CGFloat = 500    // When visible
    static var MAX_SIDE_FOLDER_VIEW_HEIGHT: CGFloat = 1000  // When visible

    static var MAX_NOTES_VIEW_WIDTH: CGFloat = 500          // When visible
    static var MAX_NOTES_VIEW_HEIGHT: CGFloat = 1000        // When visible

    static var SPACE_BW_SIDE_FOLDER_VIEW_NOTES_VIEW: CGFloat = 0
    static var SPACE_BW_NOTES_VIEW_EDITOR_VIEW: CGFloat = 0
}

struct LayoutUtils {

    /**
     Returns a tuple of NSLayoutConstraints
     Specifies that the ITEM must be at least MINWIDTH wide and at least MINHEIGHT tall
     */
    static func setSizeConstraint(item: Any, minWidth: CGFloat, minHeight: CGFloat) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        return setSizeConstraint(item: item, width: minWidth, height: minHeight, relatedBy: .greaterThanOrEqual)
    }
    
    /**
     Returns the constraints setting the max size limit
     */
    static func setSizeConstraint(item: Any, maxWidth: CGFloat, maxHeight: CGFloat) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        return setSizeConstraint(item: item, width: maxWidth, height: maxHeight, relatedBy: .lessThanOrEqual)
    }
    
    /** Returns the proper size constraints based on RELATEDBY. */
    static func setSizeConstraint(item: Any, width: CGFloat, height: CGFloat, relatedBy: NSLayoutRelation) -> (widthConstraint: NSLayoutConstraint, heightConstraint: NSLayoutConstraint) {
        let widthConstraint = NSLayoutConstraint(item: item, attribute: .width, relatedBy: relatedBy, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: width)
        let heightConstraint = NSLayoutConstraint(item: item, attribute: .height, relatedBy: relatedBy, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: height)
        return (widthConstraint, heightConstraint)
    }

    /**
     Returns a tuple of NSLayoutConstraints
     Species that ITEM must be a certain distance to TOITEM in each direction based on RELATEDBY
     Assumes that ITEM is complete inside TOITEM
     If no distance is to be specified, nil should be passed. nil will be returned for that constraint
     */
    static func setDistanceConstraints(item: Any, toItem: Any, top: CGFloat?, right: CGFloat?, bottom: CGFloat?, left: CGFloat?, relatedBy: NSLayoutRelation)
        -> (topConstraint: NSLayoutConstraint?, rightConstraint: NSLayoutConstraint?, bottomConstraint: NSLayoutConstraint?, leftConstraint: NSLayoutConstraint?)
    {
        var topConstraint: NSLayoutConstraint?
        var bottomConstraint: NSLayoutConstraint?
        var rightConstraint: NSLayoutConstraint?
        var leftConstraint: NSLayoutConstraint?
        if let topDistance = top {
            topConstraint = NSLayoutConstraint(item: item, attribute: .top, relatedBy: relatedBy, toItem: toItem, attribute: .top, multiplier: 1, constant: topDistance)
        }
        if let bottomDistance = bottom {
            bottomConstraint = NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: relatedBy, toItem: toItem, attribute: .bottom, multiplier: 1, constant: bottomDistance)
        }
        if let rightDistance = right {
            rightConstraint = NSLayoutConstraint(item: item, attribute: .right, relatedBy: relatedBy, toItem: toItem, attribute: .right, multiplier: 1, constant: rightDistance)
        }
        if let leftDistance = left {
            leftConstraint = NSLayoutConstraint(item: item, attribute: .left, relatedBy: relatedBy, toItem: toItem, attribute: .left, multiplier: 1, constant: leftDistance)
        }

        return (topConstraint, rightConstraint, bottomConstraint, leftConstraint)
    }
    
    /** Sets the minDistance */
    static func setDistanceConstraints(item: Any, toItem: Any, minTop: CGFloat?, minRight: CGFloat?, minBottom: CGFloat?, minLeft: CGFloat?)
        -> (topConstraint: NSLayoutConstraint?, rightConstraint: NSLayoutConstraint?, bottomConstraint: NSLayoutConstraint?, leftConstraint: NSLayoutConstraint?) {
            return setDistanceConstraints(item: item, toItem: toItem, top: minTop, right: minRight, bottom: minBottom, left: minLeft, relatedBy: .greaterThanOrEqual)
    }
    
    static func setDistanceConstraints(item: Any, toItem: Any, maxTop: CGFloat?, maxRight: CGFloat?, maxBottom: CGFloat?, maxLeft: CGFloat?)
        -> (topConstraint: NSLayoutConstraint?, rightConstraint: NSLayoutConstraint?, bottomConstraint: NSLayoutConstraint?, leftConstraint: NSLayoutConstraint?) {
            return setDistanceConstraints(item: item, toItem: toItem, top: maxTop, right: maxRight, bottom: maxBottom, left: maxLeft, relatedBy: .lessThanOrEqual)
    }
}




































