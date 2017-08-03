import UIKit

class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    lazy var cells: [HomeCellProtocol] = {
        var cells: [HomeCellProtocol] = []
        
        for _ in 0..<5 {
            let id = String(describing: DemoCell1.self)
            let cell = Bundle.main.loadNibNamed(id, owner: self, options: nil)!.first as! DemoCell1
            
            cell.viewModel.api.state.signal.observeValues({ (state) in
                self.tableView.reloadData()
            })
            
            cells.append(cell)
        }
        
        return cells
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        loadData()
    }
    
    func loadData() {
        for cell in cells {
            cell.viewModel.loadData()
        }
    }
    
    func refresh() {
        loadData()
        refreshControl?.endRefreshing()
    }
}

// MARK: UITableViewDataSource
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row] as! UITableViewCell
    }
    
}

// MARK: UITableViewDelegate
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cells[indexPath.row].height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
