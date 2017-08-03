import Foundation
import ReactiveSwift

protocol APIProtocol {
    var state: MutableProperty<LoadingState> { get }
    
    var model: Any? { get set }
    
    func request()
}

class DemoCellAPI1: APIProtocol {
    let state: MutableProperty<LoadingState> = MutableProperty(.loading)
    
    var model: Any?
    
    func request() {
        state.value = .loading
        
        delay(3) {
            let state = self.randomState()
            
            if state == .success {
                self.model = DemoCellModel1(title: LoadingState.success.rawValue)
            }
            
            self.state.value = state
        }
    }
    
    func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: closure)
    }
    
    func randomState() -> LoadingState {
        let random = Int(arc4random_uniform(2))
        let states: [LoadingState] = [.success, .failure]
        
        return states[random]
    }

}
