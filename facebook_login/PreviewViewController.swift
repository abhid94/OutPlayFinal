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
    
    var titleString: String!
    var imageFile: PFFile!
    
    
    override func viewDidLoad() {
        print("hello its me")
        super.viewDidLoad()
        
        self.title = self.titleString
        
        self.imageFile.getDataInBackgroundWithBlock { (imageData, error) -> Void in
            
            if error == nil {
                
                if let imageData = imageData {
                    
                    let image = UIImage(data: imageData)
                    self.imageView.image = image
                    
                }
                
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
