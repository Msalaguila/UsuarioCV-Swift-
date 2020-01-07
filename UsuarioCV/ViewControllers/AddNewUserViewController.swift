
import UIKit
import RealmSwift

class AddNewUserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var cvTitleTextField: UITextField!
    @IBOutlet weak var cvDescriptionTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userValoracionTextField: UITextField!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImagePicker()
        // Do any additional setup after loading the view.
    }
    
    func setUpImagePicker() {
        imagePickerController.delegate = self
        imagePickerController.allowsEditing  = true
    }
    
    @IBAction func addImageTapped(_ sender: UIButton) {
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: Image picker methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Obtenemos la imagen editada
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            // Guardamos la imagen
            imageView.image = editedImage
        }
        else {
            // Obtenemos la imagen original
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            // Guardamos la imagen
            imageView.image = image
        }
        
        // Cerramos el picker
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "donePressed" {
            if nameTextField.text != nil ||
                surnameTextField.text != nil ||
                ageTextField.text != nil ||
                idTextField.text != nil ||
                jobTextField.text != nil ||
                cvTitleTextField.text != nil ||
                userValoracionTextField.text != nil ||
                cvDescriptionTextField.text != nil {
                let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let surname = surnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let age = ageTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let job = jobTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let cvTitle = cvTitleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let cvDescription = cvDescriptionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let userValoracion = userValoracionTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                let imageData = imageView.image?.pngData()
                let realm = try! Realm()
                
                try! realm.write {
                    let cv = Curriculum()
                    cv.title = cvTitle!
                    cv.cvDescription = cvDescription!
                    let users = realm.objects(User.self)
                    cv.id = UUID().uuidString
                    let user = User()
                    user.name = name!
                    user.surname = surname!
                    user.age = Int(age!)!
                    user.valoracion = Int(userValoracion!)!
                    user.job = job!
                    user.id = UUID().uuidString
                    user.imageData = imageData!
                    realm.add(cv)
                    realm.add(user)
                }
            }
        }
    }
}
