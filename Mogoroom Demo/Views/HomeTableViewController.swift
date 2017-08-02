import UIKit

class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData()
        
        viewModel.refreshTableViewRow = { (row) in
            self.tableView.reloadData()
        }
    }
}

extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellViewModels[indexPath.row].currentCell(tableView, indexPath:indexPath)
    }
    
}

extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellViewModels[indexPath.row].rowHeight
    }
    
}
