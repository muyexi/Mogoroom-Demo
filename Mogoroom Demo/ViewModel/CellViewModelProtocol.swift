import UIKit

enum LoadingState: String {
    case loading = "加载中..."
    case success = "加载完成"
    case failure = "加载失败"
}

protocol CellViewModelProtocol {

    var api: APIProtocol { get }
    
    func loadData()

}
