import Foundation

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
    
    var refreshTableViewRow: ((Int) -> ())?
    
    func loadData() {
        for (row, viewModel) in cellViewModels.enumerated() {
            viewModel.loadData()
            
            viewModel.api.state.bind({ (state) in
                self.refreshTableViewRow!(row)
            })
        }
    }
    
}
