import UIKit

protocol HomeCellProtocol {
    var viewModel: CellViewModelProtocol { get }
    
    func setup(obj: Any)
    
    var height: CGFloat { get }
    
}

class DemoCell1: UITableViewCell, HomeCellProtocol {

    var height: CGFloat = 80
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: CellViewModelProtocol = DemoCellViewModel1()

    override func awakeFromNib() {
        viewModel.api.state.signal.observeValues { (state) in
            self.update(state: state)
        }
    }
    
    func setup(obj: Any) {
        if let model = obj as? DemoCellModel1 {
            titleLabel?.text = model.title
        }
    }
    
    func update(state: LoadingState) {
        switch state {
        case .loading:
            titleLabel.text = LoadingState.loading.rawValue
        case .success:
            setup(obj: viewModel.api.model!)
        case .failure:
            titleLabel?.text = LoadingState.failure.rawValue
        }
    }
    
}
