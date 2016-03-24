//
//  Movie.swift
//  fav-movie-core-data
//
//  Created by Vyacheslav Horbach on 24/03/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
