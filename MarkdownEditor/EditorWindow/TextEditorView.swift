//
//  TextEditorView.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Cocoa

class TextEditorView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor(calibratedRed: 0.514, green: 0.580, blue: 0.588, alpha: 1.00).setFill()
        NSRectFill(dirtyRect)
    }
    
}
