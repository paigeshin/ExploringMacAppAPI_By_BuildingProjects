//
//  DetailViewController.swift
//  StormViewer
//
//  Created by paige shin on 2023/02/19.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func imageSelected(name: String) {
        self.imageView.image = NSImage(named: name)
    }
    
}
