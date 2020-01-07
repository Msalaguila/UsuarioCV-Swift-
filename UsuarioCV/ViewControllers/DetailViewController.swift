//
//  DetailViewController.swift
//  UsuarioCV
//
//  Created by Alexander Moreno Guillén on 8/12/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var user: User?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var cvTitleLabel: UILabel!
    @IBOutlet weak var cvDescriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fillView()
    }
    
    func fillView() {
        nameLabel.text = "Name: " + user!.name
        surnameLabel.text = "Surname: " + user!.surname
        ageLabel.text = "Age: \(user!.age)"
        jobLabel.text = "Job: " + user!.job
        guard let userID = user?.id else { return }
        idLabel.text = "ID: \(userID)"
        let detailModel = DetailModel()
        cvTitleLabel.text = detailModel.getCurriculum(id: user!.cv).title
        cvDescriptionLabel.text = detailModel.getCurriculum(id: user!.cv).cvDescription
        let image = UIImage(data: user!.imageData)
        imageView.image = image
    }
    
}
