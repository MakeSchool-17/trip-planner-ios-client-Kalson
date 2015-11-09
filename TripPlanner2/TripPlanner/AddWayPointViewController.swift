//
//  AddWayPointViewController.swift
//  TripPlanner
//
//  Created by KaL on 11/8/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class AddWayPointViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var cancelButton: UIButton!
    @IBAction func cancelButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    
    let placesClient = GMSPlacesClient()
    var placeResults = [GMSAutocompletePrediction]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySearchBar.delegate = self
        myTableView.delegate = self
        myTableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        placesClient.autocompleteQuery(searchText, bounds: nil, filter: nil, callback: { (results, error: NSError?) -> Void in
                if let error = error {
                    print("Autocomplete error \(error)")
                }
            
                self.placeResults = [] // to clean the array
            
                for result in results! {
                    if let result = result as? GMSAutocompletePrediction {
                        print("Result \(result.attributedFullText) with placeID \(result.placeID)")
                        
                        self.placeResults.append(result)
                    }
                }
            
                self.myTableView.reloadData() // to update the table view based on change
            })
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "AutoCompleteCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = placeResults[indexPath.row].attributedFullText.string
        
        print("OOOOOOOO = \(cell)")
        
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
