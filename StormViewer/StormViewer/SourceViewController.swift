//
//  SourceViewController.swift
//  StormViewer
//
//  Created by paige shin on 2023/02/19.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var tableView: NSTableView!
    
    var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// get a list of all files in our bundles resource path
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            self.pictures.append(item)
        }
        
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        vw.textField?.stringValue = self.pictures[row]
        return vw
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.pictures.count
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard self.tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        if let detail = splitVC.children[1] as? DetailViewController {
            detail.imageSelected(name: self.pictures[self.tableView.selectedRow])
        }
    }
    
}
