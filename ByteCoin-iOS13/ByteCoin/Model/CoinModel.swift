
import Foundation

struct CoinModel { // decoding된 값
    
    let base : String
    let quote : String
    let rate : Double
    
    var stringRate : String {
        return String(format:"%.2f", rate)
    }
    
}
