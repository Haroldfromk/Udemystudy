

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    

    @IBOutlet weak var displayView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func uploadImagePicker(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    @IBAction func uploadImage(_ sender: UIButton) {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 2
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self

        self.present(picker, animated: true)
    }
    
}


extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.displayView.image = selectedImage
        }

        picker.dismiss(animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true)
    }
    
}

extension ViewController : PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        self.dismiss(animated: true)
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { (image,error) in
                if let selectedImage = image as? UIImage {
                    DispatchQueue.main.async {
                        self.displayView.image = selectedImage
                    }
                }
            }
        }
        
//        results.forEach { result in
//            result.itemProvider.loadObject(ofClass: UIImage.self) { (image,error) in
//                if let selectedImage = image as? UIImage {
//                    DispatchQueue.main.async {
//                        self.displayView.image = selectedImage
//                    }
//                }
//            }
//        }
    }
    
    
}
