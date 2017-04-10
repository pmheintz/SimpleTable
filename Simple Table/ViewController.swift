//
//  ViewController.swift
//  Simple Table
//
//  Created by Paul Heintz on 4/9/17.
//  Copyright © 2017 PaulHeintz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let dwarves = ["Sleepy", "Sneezy", "Bashful", "Happy", "Doc", "Grumpy", "Dopey", "Thorin", "Dorin", "Nori", "Ori", "Balin", "Dwalin", "Fili", "Kili", "Oin", "Gloin", "Bifur", "Bofur", "Bombur"]
    let simpleTableIdentifier = "SimpleTableIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: -
    // MARK: Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dwarves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "simpleTableIdentifier")
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: simpleTableIdentifier)
        }
        
        
        let image = UIImage(named: "star")
        cell?.imageView?.image = image
        let highlightedImage = UIImage(named: "star2")
        cell?.imageView?.highlightedImage = highlightedImage
        
        if indexPath.row < 7 {
            cell?.detailTextLabel?.text = "Disney"
        } else {
            cell?.detailTextLabel?.text = "Tolkien"
        }
        
        cell?.textLabel?.text = dwarves[indexPath.row]
        //cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 50) // Changes font face and size
        return cell!
    }
    /*// Method to change cell size, cell 0 = 120pts all others 70pts
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 120 : 70
    }*/
    
    // MARK: -
    // MARK: Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return indexPath.row % 4
    }
    
    /*// Method to disallow a cell to be selected
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }*/
    
    /*// Method that disallows cell 0 and changes selected cell to the next one, but doesn't seem to work
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            return nil
        } else if (indexPath.row % 2 == 0) {
            return NSIndexPath(row: indexPath.row + 1, section: indexPath.section) as IndexPath
        } else {
            return indexPath
        }
    }*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes I did", style: .default, handler: nil)
        
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
}

