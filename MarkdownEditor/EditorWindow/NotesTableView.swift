//
//  NotesView.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/1/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Cocoa

class NotesTableView: NSTableView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor(calibratedRed: 0.016, green: 0.176, blue: 0.220, alpha: 1.00).setFill()
        NSRectFill(dirtyRect)
    }
}
