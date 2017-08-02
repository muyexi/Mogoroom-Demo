import UIKit

protocol HomeCellProtocol {
    func setup(obj: Any)
}

class DemoCell1: UITableViewCell, HomeCellProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(obj: Any) {
        if let model = obj as? DemoCellModel1 {
            textLabel?.text = model.title
        }
    }
    
}
