//
//  BaseTableViewCell.swift
//  PFQueryTableViewController Xcode 7
//
//  Created by PJ Vea on 11/9/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class BaseTableViewCell: PFTableViewCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellImageView: PFImageView!
}
