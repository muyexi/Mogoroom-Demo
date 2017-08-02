import UIKit

class DemoCellViewModel1: NSObject, CellViewModelProtocol {
 
    var api: APIProtocol = DemoCellAPI1()
    
    var successCell: DemoCell1!
    
    override init() {
        super.init()
        
        let id = String(describing: DemoCell1.self)
        successCell = Bundle.main.loadNibNamed(id, owner: self, options: nil)!.first as? DemoCell1
        successCell.titleLabel.text = LoadingState.loading.rawValue
        
        api.state.signal.observeValues { (state) in
            if state == .success {
                if self.api.model != nil {
                    self.successCell.setup(obj: self.api.model!)
                }
            } else if state == .failure {
                self.successCell.titleLabel?.text = LoadingState.failure.rawValue
            }
        }
    }
    
    func currentCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let id = String(describing: DemoCell1.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as? DemoCell1
        
        return cell ?? successCell
    }
    
    func loadData() {
        successCell.titleLabel.text = LoadingState.loading.rawValue
        self.api.request()
    }
    
}
