

import Foundation
import RealmSwift

class DetailModel {
    let realm = try! Realm()
    
    func getCurriculum(id: Int) -> Curriculum {
        let curriculums = realm.objects(Curriculum.self)
        return curriculums[id]
    }
}
