

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var lists : [ArrayModel] = []
    
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func activateAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Table View 추가해보기", message: "내용을 입력해주세요", preferredStyle: .alert)
        alert.addTextField { (textField: UITextField!) in
            textField.placeholder = "여기에 입력해주세요"
            textField.autocorrectionType = .no
            textField.spellCheckingType = .no
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
            lists.append(ArrayModel(id: id, title: alert.textFields?[0].text ?? ""))
            id += 1
            tableView.reloadData()
            }
        ))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func checkListBtn(_ sender: UIButton) {
        print(lists)
    }
}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath)
        cell.textLabel?.text = lists[indexPath.row].title
        
        return cell
    }
    
    
}
