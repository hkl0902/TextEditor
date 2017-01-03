//
//  SideFolderView.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Cocoa

class SideFolderView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor(calibratedRed: 0.788, green: 0.298, blue: 0.133, alpha: 1.00).setFill()
        NSRectFill(dirtyRect)
    }
    
}
