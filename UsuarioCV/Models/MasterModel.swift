
import Foundation
import RealmSwift

class MasterModel {
    let realm = try! Realm()
    
    init() {
    }
    
    func getUsersCount() -> Int {
        let users = realm.objects(User.self)
        return users.count
    }
    
    func getNameAndSurname(_ id: Int) -> String {
        let users = realm.objects(User.self)
        return users[id].name + " " + users[id].surname
    }
    
    func getUser(_ id: Int) -> User {
        let user = realm.objects(User.self)
        return user[id]
    }
    
    func deleteUser(_ id: Int) {
        let curriculums = realm.objects(Curriculum.self)
        let users = realm.objects(User.self)
        
        let userTodelete = users[id]
        let curriculumTodelete = curriculums[userTodelete.cv]
        
        try! realm.write {
            realm.delete(curriculumTodelete)
            realm.delete(userTodelete)
        }
    }
    
}
