//
//  Curriculum.swift
//  UsuarioCV
//
//  Created by Alexander Moreno Guillén on 8/12/19.
//  Copyright © 2019 Alexander Moreno Guillén. All rights reserved.
//

import Foundation
import RealmSwift

class Curriculum: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var cvDescription: String = ""
}
