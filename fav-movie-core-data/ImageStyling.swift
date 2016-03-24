//
//  ImageStyling.swift
//  fav-movie-core-data
//
//  Created by Vyacheslav Horbach on 24/03/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class ImageStyling: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }

}
