//
//  AddTripController.swift
//  TripPlanner
//
//  Created by KaL on 11/5/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit
import CoreData

class AddTripController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var tripNameTextField: UITextField!
    
    var tripNames = [NSManagedObject]()
    
    @IBAction func addNewTrip(sender: AnyObject) {
        addThoseTrips()
        print(self.tripNames)
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        addThoseTrips()
        return true
    }
    
    func addThoseTrips(){
        if let text = tripNameTextField.text {
            self.saveName(text) // optional binding, no longer an optional
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        print(self.tripNames)
    }
    
    func saveName(name: String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // pull the App Delegate
        let manageContext = appDelegate.managedObjectContext // reference the context
        
        // instantiate the entity with the manage object context
        let entity = NSEntityDescription.entityForName("PlanTrip", inManagedObjectContext: manageContext)
        
        // instantiate the manage object and insert in the mangae object context
        let tripName = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: manageContext)
        
        // set the value for the attribute of the manageobject
        tripName.setValue(name, forKey: "name")
        
        do {
            try manageContext.save()
            self.tripNames.append(tripName)
        } catch let error as NSError {
            print("Could not save \(error),\(error.userInfo)")
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
                

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.tripNameTextField.delegate = self // tell the tripNameTextField that its the delegate for the UItextField protocol
        self.tripNameTextField.becomeFirstResponder()
        self.cancelButton = UIBarButtonItem(title: "Yay", style: .Done, target: self, action: Selector("cancelButtonAction"))
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
