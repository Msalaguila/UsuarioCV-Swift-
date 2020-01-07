//
//  User.swift
//  UsuarioCV
//
//  Created by Alexander Moreno Guillén on 8/12/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var surname: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var job: String = ""
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var cv: Int = 0
    @objc dynamic var imageData: Data = Data()
}
