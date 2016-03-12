//
//  ViewController.swift
//  facebook_login
//
//  Created by Nirvan Gelda on 18/02/2016.
//  Copyright © 2016 Nirvan Gelda. All rights reserved.
//

import UIKit
import ParseFacebookUtilsV4
import Foundation



class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login_button(sender: AnyObject) {
        
        facebookLogin()
        
    }

    
    //logs in user through Facebook and stores details in Parse
    func facebookLogin() {
        
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile","email"]) {
            (user: PFUser?, error: NSError?) -> Void in
            print(user)
            
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in through Facebook!")
                } else {
                    print("User logged in through Facebook!")
//                    self.performSegueWithIdentifier("displayUsers", sender: self )
                    
                }
            } else {
                print("Uh oh. The user cancelled the Facebook login.")
            }
            
            
            // Create request for user's Facebook data
            let request = FBSDKGraphRequest(graphPath:"me", parameters:["fields":"id,email,name,first_name,last_name"])
            
            // Send request to Facebook
            request.startWithCompletionHandler {
                
                (connection, result, error) in
                
                if error != nil {
                    // Some error checking here
                    
                }
                else if(result != nil) {
                    let userFirstName:String? = result["first_name"] as? String
                    let userLastName:String? = result["last_name"] as? String
                    let userEmail:String? = result["email"] as? String
                    let userId:String = result["id"] as! String
                    let myUser:PFUser = PFUser.currentUser()!
                    myUser.setObject(userFirstName!, forKey: "first_name")
                    myUser.setObject(userLastName!, forKey: "last_name")
                    myUser.setObject(userEmail!, forKey: "email")
                    myUser.saveInBackgroundWithBlock({ (success:Bool, error:NSError?) -> Void in
                        
                    })
                    
                    // get profile pictures  (THINKING ABOUT PUTTING THIS INTO A FUNCTION)
                    
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                        
                        // Get Facebook profile picture
                        let userProfile = "https://graph.facebook.com/" + userId + "/picture?type=large"
                        let profilePictureUrl = NSURL(string: userProfile)
                        let profilePictureData = NSData(contentsOfURL: profilePictureUrl!)
                        if(profilePictureData != nil)
                        {
                            let profileFileObject = PFFile(data:profilePictureData!)
                            myUser.setObject(profileFileObject!, forKey: "profile_picture")
                        }
                        myUser.saveInBackgroundWithBlock({ (success:Bool, error:NSError?) -> Void in
                            if(success)
                            {
                                print("User details are now updated")
                            }
                        })
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

