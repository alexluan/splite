//
//  MasterViewController.swift
//  splite
//
//  Created by 栾有数 on 15/10/18.
//  Copyright © 2015年 栾有数. All rights reserved.
//

import UIKit


class ColorPalette:NSObject {
    var name:String!=nil
    var children:[ColorPalette]!=[]
    var hasColors:Bool!=false
}
class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects:[ColorPalette] = []
    //NSMutableArray()//[AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        objects = dataSources()
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func insertNewObject(sender: AnyObject) {
//        objects.insert(NSDate(), atIndex: 0)
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object:ColorPalette = objects[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

//        let object = objects[indexPath.row] as! NSDate
        let colorPanlette = objects[indexPath.row] 
        cell.textLabel?.text = colorPanlette.name
        
//        cell.textLabel!.text = object.description
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    func dataSources()->[ColorPalette]{
        //1
        var vibrant:[ColorPalette]! = []
        //2
//        let vibrant=ColorPalette()
//        vibrant.name = "Vibrant"
        //3
        let logis4 = ColorPalette()
        logis4.name = "Logis 4"
//        vibrant.children = [logis4]
        vibrant.append(logis4)
        logis4.hasColors = true
        //4
        var color1 = ColorPalette()
        color1.name = "#ff590d"
        var color2 = ColorPalette()
        color2.name = "#ff990d"
        var color3 = ColorPalette()
        color3.name = "#f2db00"
        var color4 = ColorPalette()
        color4.name = "#99cc00"
        var color5 = ColorPalette()
        color5.name = "#07938c"
        logis4.children = [color1,color2,color3,color4,color5]
        //5
        let candyCoated = ColorPalette()
        candyCoated.name = "Candy coated"
//        vibrant.children.append(candyCoated)
        vibrant.append(candyCoated)
        candyCoated.hasColors = true
        //6
        color1 = ColorPalette()
        color1.name = "#f1cd54"
        color2 = ColorPalette()
        color2.name = "#ff9f00"
        color3 = ColorPalette()
        color3.name = "#fdb506"
        color4 = ColorPalette()
        color4.name = "#99cc00"
        color5 = ColorPalette()
        color5.name = "#a8bf12"
        candyCoated.children=[color1,color2,color3,color4,color5]
        
        return vibrant
    }

}

