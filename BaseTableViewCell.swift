//
//  BaseTableViewCell.swift
//  OutPlay
//
//  Created by Nirvan Gelda on 4/03/2016.
//  Copyright © 2016 Nirvan Gelda. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class BaseTableViewCell: PFTableViewCell {

    @IBOutlet weak var cellImageView: PFImageView!
    
    @IBOutlet weak var Sport: UILabel!
    
    @IBOutlet weak var Location: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var cellBackground: UIImageView!
    
}
