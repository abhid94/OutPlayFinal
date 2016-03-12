//
//  displayUsersViewController.swift
//  OutPlay
//
//  Created by Nirvan Gelda on 4/03/2016.
//  Copyright © 2016 Nirvan Gelda. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class displayUsersViewController: PFQueryTableViewController {
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "_User")
        query.cachePolicy = .CacheElseNetwork
        query.orderByDescending("createdAt")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BaseTableViewCell
        
        cell.titleLabel.text = object?.objectForKey("first_name") as? String
        
        let imageFile = object?.objectForKey("profile_picture") as? PFFile
        
        
        //cell.cellImageView.image = UIImage(named: "placeholder")
        
        cell.cellImageView.file = imageFile
        cell.cellImageView.loadInBackground()
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row + 1 > self.objects?.count {
            
            return 44
            
        }
        
        let height = super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        return height
    }
    
    override func   tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if indexPath.row + 1 > self.objects?.count {
            
            self.loadNextPage()
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        } else {
            
            self.performSegueWithIdentifier("showDetail", sender: self)
            
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            
            let indexPath = self.tableView.indexPathForSelectedRow
            let detailVC = segue.destinationViewController as! PreviewViewController
            
            let object = self.objectAtIndexPath(indexPath)
            
            detailVC.titleString = object?.objectForKey("first_name") as! String
            detailVC.imageFile  = object?.objectForKey("profile_picture") as! PFFile
            
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: true)
            
        }
        
    }
    
    
    
    

}
