//
//  ViewController.swift
//  WhatFlower
//
//  Created by Dongik Song on 4/18/24.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    let imagePicker = UIImagePickerController()
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true)

    }
    
    func requestInfo(flowerName: String) {

          let parameters : [String:String] = [
          "format" : "json",
          "action" : "query",
          "prop" : "extracts|pageimages",
          "exintro" : "",
          "explaintext" : "",
          "titles" : flowerName,
          "indexpageids" : "",
          "redirects" : "1",
          "pithumbsize" : "500"
          ]
        
        Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                print("Got")
                print(response)
                
                let flowerJSON: JSON = JSON(response.result.value!)
                
                let pageid = flowerJSON["query"]["pageids"][0].stringValue
                let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue
                let flowerImageURL = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
                
                self.imageView.sd_setImage(with: URL(string: flowerImageURL))
                
                self.label.text = flowerDescription
            }
        }
        
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            
            guard let ciImage = CIImage(image: userPickedImage) else {
                    fatalError("Cannot convert to CIImage")
            }
            
            detect(image: ciImage)
            
            //imageView.image = userPickedImage
            
            
        }
        
        imagePicker.dismiss(animated: true)
    }
    
    func detect (image: CIImage) {
            
        guard let coremlModel = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Import model failed")
        }
        let request = VNCoreMLRequest(model: coremlModel) { (request, error) in
            guard let result = request.results?.first as? VNClassificationObservation else {
                fatalError("Could not classify image")
            }
            
            self.navigationItem.title = result.identifier.capitalized
            self.requestInfo(flowerName: result.identifier)
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    
}
