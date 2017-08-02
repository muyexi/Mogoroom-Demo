import UIKit

class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        viewModel.loadData()
        viewModel.updatedRow.signal.observeValues { (row) in
            self.tableView.reloadData()
        }
    }
    
    func refresh() {
        viewModel.loadData()
        refreshControl?.endRefreshing()
    }
}

// MARK: UITableViewDataSource
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellViewModels[indexPath.row].currentCell(tableView, indexPath:indexPath)
    }
    
}

// MARK: UITableViewDelegate
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellViewModels[indexPath.row].rowHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
