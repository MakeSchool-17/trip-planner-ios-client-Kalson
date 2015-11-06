//
//  AddTripController.swift
//  TripPlanner
//
//  Created by KaL on 11/5/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit

class AddTripController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBOutlet weak var tripNameTextField: UITextField!
    
    var tripName: [[String:String]] = []
    
    @IBAction func addNewTrip(sender: AnyObject) {
        addThoseTrips()
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
            self.tripName.append(["name": text]) // optional binding, no longer an optional
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        print(tripName)
        for name in tripName{
            print("the trips = \(name)")
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.tripNameTextField.delegate = self // tell the tripNameTextField that its the delegate for the UItextField protocol
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
