
import Foundation

struct CoinData : Codable { // 실제로 api로부터 가져오는 데이터
    
    let asset_id_base : String
    let asset_id_quote : String
    let rate : Double
    
}
