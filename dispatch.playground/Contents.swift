import UIKit

// main vs background

DispatchQueue.main.async {
    foo()
}

DispatchQueue.global(qos: .background).async {
    foo()
}

func foo() {
    
}

