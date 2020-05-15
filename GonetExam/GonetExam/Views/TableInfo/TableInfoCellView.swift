//
//  TableInfoCellView.swift
//  GonetExam
//
//  Created by Juan Arcos on 14/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class TableInfoCellView: UITableViewCell
{
    
    
    @IBOutlet var imageLogo: UIImageView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    
    
    func setContents(title: String, description: String, image: UIImage) {
        imageLogo.image = image
        titleLbl.text = title
        descriptionLbl.text = description
    }
    
}
