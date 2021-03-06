//
//  EventsCollectionViewCell.swift
//  json-parsing
//
//  Created by Jbara Omar on 16/12/2017.
//  Copyright © 2017 Brogrammers. All rights reserved.
//

import UIKit

@IBDesignable
class EventsCollectionViewCell: UICollectionViewCell {

    var eventId: Int?

    @IBOutlet weak var imageView: DesignableImageView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var labelTitle: DesignableLabel!
    @IBOutlet weak var labelDate: DesignableLabel!
    
}
