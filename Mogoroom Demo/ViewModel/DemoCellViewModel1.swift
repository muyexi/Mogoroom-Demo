import UIKit

class DemoCellViewModel1: NSObject, CellViewModelProtocol {
 
    var api: APIProtocol = DemoCellAPI1()
    
    func loadData() {
        self.api.request()
    }
    
}
