

import Foundation
import RealmSwift

class Curriculum: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var title: String = ""
    @objc dynamic var cvDescription: String = ""
}
