//
//  AddMovieVC.swift
//  fav-movie-core-data
//
//  Created by Vyacheslav Horbach on 24/03/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieImdb: UITextField!
    @IBOutlet weak var movieOpinion: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func addMovieImgBtnPressed(sender: UIButton!) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
    @IBAction func createMovie(sender: AnyObject!) {
        if let title = movieTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            
            movie.setMovieImage(movieImg.image!)
            movie.title = movieTitle.text
            movie.desc = movieDesc.text
            movie.comment = movieOpinion.text
            movie.imdb = movieImdb.text
            
            context.insertObject(movie)
            
            do {
                try context.save()
            } catch {
                print("Could not save the movie")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }
    }
}
