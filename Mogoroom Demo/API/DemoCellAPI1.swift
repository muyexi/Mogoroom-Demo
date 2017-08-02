import Foundation

public typealias SuccessHandler = ((Any) -> ())
public typealias FailureHandler = (() -> ())

protocol APIProtocol {
    var state: Dynamic<LoadingState> { get }
    
    var failureHandler: FailureHandler? { get set }
    var successHandler: SuccessHandler? { get set }
    
    func request()
}

class DemoCellAPI1: APIProtocol {
    var state: Dynamic<LoadingState> = Dynamic(.loading)
    
    var failureHandler: FailureHandler?
    
    var successHandler: SuccessHandler?
    
    func request() {
        delay(3) {
            self.state.value = self.randomState()
            
            if self.state.value == .success {
                let model = DemoCellModel1(title: LoadingState.success.rawValue)
                
                self.successHandler?(model)
            } else {
                self.failureHandler?()
            }
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
