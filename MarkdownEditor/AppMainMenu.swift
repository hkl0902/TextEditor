//
//  AppMainMenu.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 12/31/16.
//  Copyright © 2016 Hyunkyu Lee. All rights reserved.
//

import Cocoa

class AppMainMenu: NSMenu {
    convenience init() {
        self.init(title: "Main Menu")
        let mainAppMenuItem = NSMenuItem(title: "", action: nil, keyEquivalent: "")
        let mainAppMenu = NSMenu(title: "Main Submenu")
        mainAppMenuItem.submenu = mainAppMenu
        mainAppMenu.addItem(withTitle: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        self.addItem(mainAppMenuItem)
    }
}
