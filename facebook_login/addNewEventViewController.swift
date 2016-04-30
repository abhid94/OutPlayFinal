//
//  addNewEventViewController.swift
//  OutPlay
//
//  Created by Nirvan Gelda on 30/04/2016.
//  Copyright © 2016 Nirvan Gelda. All rights reserved.
//

import UIKit
import Parse

class addNewEventViewController: UIViewController {
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var sportName: UITextField!
    
    @IBOutlet weak var time: UITextField!
    
    @IBOutlet weak var location: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneButton(sender: AnyObject) {
        let Event = PFObject(className:"Event")
        
        Event["Sport"] = sportName.text
        
        Event["Date"] = date.date
        
        Event["Time"] = time.text
        
        Event["Location"] = location.text
        
        Event["Organiser"] = PFUser.currentUser()?.username
        
        Event.saveInBackgroundWithBlock{
            (success: Bool, error: NSError?) -> Void in
            
        }
    }
    /*
    func getDate(date:UIDatePicker){
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        var strDate = dateFormatter.stringFromDate(date.date)
        print(strDate);
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
