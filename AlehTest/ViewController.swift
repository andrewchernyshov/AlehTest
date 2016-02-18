//
//  ViewController.swift
//  AlehTest
//
//  Created by Andrew Chernyhov on 16.02.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let tableviewDataStack = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topGuideLine-[tableview]-|", options: [], metrics: ["topGuideLine":self.topLayoutGuide], views: ["tableview": self.tableView])
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("|[tableview]|", options: [], metrics: [:], views: ["tableview":self.tableView])
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints(verticalConstraints + horizontalConstraints)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableviewDataStack.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

