import UIKit

enum LoadingState: String {
    case loading = "加载中..."
    case success = "加载完成"
    case failure = "加载失败"
}

protocol CellViewModelProtocol {

    var api: APIProtocol { get }

    var rowHeight: CGFloat { get }
    
    func currentCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    
    func loadData()

}

extension CellViewModelProtocol {
    
    var rowHeight: CGFloat {
        return 80
    }
    
}
