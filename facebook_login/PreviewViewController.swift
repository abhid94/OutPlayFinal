//
//  PreviewViewController.swift
//  OutPlay
//
//  Created by Nirvan Gelda on 4/03/2016.
//  Copyright © 2016 Nirvan Gelda. All rights reserved.
//

import UIKit
import Parse

class PreviewViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var eventPic: UIImageView!
    @IBOutlet weak var organiserPic: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var titleString: String!
    var locationString: String!
    var date: String!
    var organiser_pic: PFFile!
   // var imageFile: PFFile!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.titleString
        self.locationLabel.text = self.locationString
        self.dateLabel.text = self.date
        self.organiser_pic.getDataInBackgroundWithBlock{(organiser_pic, error) -> Void in
        
        if error == nil {
            let image = UIImage(data: organiser_pic!)
            self.organiserPic.image = image
        }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return self.imageView
    
    }

}
