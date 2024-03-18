//
//  ViewController.swift
//  Practice
//
//  Created by Dongik Song on 3/18/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUIlabel()
        setImageView()
        setUITextField()
        setUIButton()
        setUISwitch()
    }

    // MARK: - Making UILabel
    
    func setUIlabel () {
        let label = UILabel()
        label.text = "Hello World!" // Label에 보여주기
        label.font = UIFont.systemFont(ofSize: 15) // Font size 설정
        label.textColor = UIColor.red // Font color 설정
        label.textAlignment = .center // Text alignment 설정
        label.numberOfLines = 2 // Number of lines 최대 2줄까지 표시
                                // 0으로 하면 자동으로 줄을 바꾼다.
        label.lineBreakMode = .byTruncatingTail // Text가 너무 길면 ... 으로 표시
        
        label.frame = CGRect(x:150, y:150, width: 150, height: 50)
        // 생성될 label의 위치와 크기를 세팅
        label.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) // label 배경색을 설정.
        
        label.layer.borderWidth = 3 // label에 테두리 굵기를 설정한다.
        label.layer.borderColor = UIColor.red.cgColor // label 테두리 색을 설정
                                                                // 뒤에 cgColor가 오는걸 명심하자
        
        self.view.addSubview(label)
        // 실제로 해당 뷰를 띄우겠다. 이걸 작성하지 않으면 함수를 호출해도 보이지 않는다.
    }

    // MARK: - Making ImageView
    func setImageView () {
        let imageView = UIImageView()
        let image = UIImage(named: "test") // Image File 명으로 UIImage 오브젝트 생성
        imageView.image = image
        
        // 이미지 뷰의 프레임 설정
        imageView.frame = CGRect(x: 150, y: 200, width: 150, height: 150)
        
        // contentMode 설정
        imageView.contentMode = .scaleAspectFit // 이미지 비율 유지하면서 맞춘다.
        
        // 뷰를 화면에 표시
        self.view.addSubview(imageView)
    }
    
    // MARK: - Making UITextField
    func setUITextField() {
        let textField = UITextField()
        
        textField.placeholder = "여기에 입력해"
        textField.borderStyle = .roundedRect // TextField의 모양 (둥근 테두리)
        textField.keyboardType = .default // 일반 키보드
        textField.isSecureTextEntry = false // 비밀번호처럼 *** 이런식으로 가릴건지의 여부
        textField.returnKeyType = .done // Return키의 종류

        
        textField.frame = CGRect(x: 150, y: 400, width: 150, height: 40)
        
        self.view.addSubview(textField)
        
    }
        
    // MARK: - Making UIButton
    func setUIButton() {
        let uiButton = UIButton(type: .system)
        
        uiButton.setTitle("눌러봐", for: .normal) // 현재 버튼의 text
        uiButton.setTitleColor(UIColor.green, for: .normal) // 글자색
        uiButton.frame = CGRect(x: 150, y: 500, width: 150, height: 50)
        uiButton.backgroundColor = .blue // 배경색
        uiButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) // 버튼을 눌렀을때 실행할 함수를 지정해준다.
        
        self.view.addSubview(uiButton)
    }
    
    @objc func buttonTapped() {
        print("Button Pressed")
    }
    
    // MARK: - Making UISwitch
    func setUISwitch () {
        let uiSwitch = UISwitch()
        uiSwitch.isOn = true
        uiSwitch.onTintColor = .blue
        uiSwitch.thumbTintColor = .orange
        
        uiSwitch.addTarget(self, action: #selector(switchValueChanged(_ :)), for: .valueChanged) // valuechanged : 값이 변했을때 인지
        
        uiSwitch.frame = CGRect(x: 50, y: 70, width: 40, height: 40)
        
        self.view.addSubview(uiSwitch)
    }
    
    @objc func switchValueChanged (_ sender : UISwitch ) {
        if sender.isOn {
            print("switch on")
        } else {
            print("switch off")
        }
    }
}

#Preview {
    ViewController()
}
