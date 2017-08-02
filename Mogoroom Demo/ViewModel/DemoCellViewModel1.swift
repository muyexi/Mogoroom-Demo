import UIKit

class DemoCellViewModel1: NSObject, CellViewModelProtocol {
 
    var api: APIProtocol = DemoCellAPI1()
    
    var successCell: DemoCell1!
    
    override init() {
        super.init()
        
        let id = String(describing: DemoCell1.self)
        successCell = Bundle.main.loadNibNamed(id, owner: self, options: nil)!.first as? DemoCell1
        successCell.titleLabel.text = LoadingState.loading.rawValue
        
        api.successHandler = { obj in
            if let model = obj as? DemoCellModel1 {
                self.successCell.textLabel?.text = model.title
            }
        }
        
        api.failureHandler = {
            self.successCell.textLabel?.text = LoadingState.failure.rawValue
        }
    }
    
    func currentCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let id = String(describing: DemoCell1.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as? DemoCell1
        
        return cell ?? successCell
    }
    
    func loadData() {
        self.api.request()
    }
    
}
