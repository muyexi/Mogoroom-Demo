import Foundation
import ReactiveSwift

protocol HomeViewModelProtocol {
    var cellViewModels: [CellViewModelProtocol] { get }
    func loadData()
}

class HomeViewModel: NSObject, HomeViewModelProtocol {
    
    var cellViewModels: [CellViewModelProtocol] = [
        DemoCellViewModel1(),
        DemoCellViewModel1(),
        DemoCellViewModel1(),
        DemoCellViewModel1(),
        DemoCellViewModel1()
    ]
    
    var updatedRow: MutableProperty<Int> = MutableProperty(0)
    
    override init() {
        super.init()
        
        for (row, viewModel) in cellViewModels.enumerated() {
            viewModel.api.state.signal.observeValues({ (state) in
                self.updatedRow.value = row
            })
        }
    }
    
    func loadData() {
        for viewModel in cellViewModels {
            viewModel.loadData()
        }
    }
    
}
