
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
    @objc dynamic var valoracion: Int = 0
}
