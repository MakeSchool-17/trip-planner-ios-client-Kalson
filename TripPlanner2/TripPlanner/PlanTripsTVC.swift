//
//  PlanTripsTVC.swift
//  TripPlanner
//
//  Created by KaL on 11/5/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit
import CoreData

class PlanTripsTVC: UITableViewController {
    
    var addTripC = AddTripController()
    var tripNames = [PlanTrip]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {

        tripNames = CoreDataHelper.allTrips()
        tableView.reloadData()
        print(tripNames)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tripNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let tripName = tripNames[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = tripName.name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectedTrip = tripNames[indexPath.row]
        let stuff = selectedTrip.valueForKey("name")
        print("Selected Trip = \(stuff!)")
        self.performSegueWithIdentifier("noWayPoint", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//        if segue.identifier == "addTrips"{
//            let navController = segue.destinationViewController as! UINavigationController
//            let destinationController = navController.topViewController as! AddTripController
////            destinationController.tripNames = self.tripNames
//            
//        }
        
    }
    
//    func returnWays(name: "String") -> [Waypoint]{
//    let fetchRequest = NSFetchRequest(entityName: "Waypoint")
//    fetchRequest.predicate =  NSPredicate(format: "trip = %@", trip)
//    fetchRequest.returnsObjectsAsFaults = false
//    
//    let ways = try! managedObjectContext.executeFetchRequest(fetchRequest) as! [Waypoint]
//    
//    return ways
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
