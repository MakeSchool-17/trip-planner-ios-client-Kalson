//
//  AddTripController.swift
//  TripPlanner
//
//  Created by KaL on 11/5/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit

class AddTripController: UIViewController {


    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBAction func cancelButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.cancelButton = UIBarButtonItem(title: "Yay", style: .Done, target: self, action: Selector("cancelButtonAction"))
    }
    
//    @objc func cancelButtonAction(){
//        print("cancel button was pressed")
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    func sayHello(sender: UIBarButtonItem) {
//        print("Hello")
//    }


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
