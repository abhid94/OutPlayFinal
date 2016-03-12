//
//  BasicTableViewCell.swift
//  OutPlay
//
//  Created by Nirvan Gelda on 4/03/2016.
//  Copyright © 2016 Nirvan Gelda. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class BasicTableViewCell: PFQueryTableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellImageView: PFImageView

}
