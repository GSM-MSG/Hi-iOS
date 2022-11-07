//
//  NameViewController.swift
//  Hi_MSG
//
//  Created by 박준서 on 2022/10/27.
//

import Foundation
import UIKit
import SnapKit
import Then

class NameViewController: UIViewController{
    let studentNameTextField = UITextField().then{
        $0.borderStyle = .line
        $0.borderStyle = .roundedRect
        $0.placeholder = "이름을 입력해주세요!"
    }
    let idTextField = UITextField().then{
        $0.borderStyle = .line
        $0.borderStyle = .roundedRect
        $0.placeholder = "이메일을 입력해주세요!"
    }
    let authCodeTextField = UITextField().then{
        $0.borderStyle = .line
        $0.borderStyle = .roundedRect
        $0.placeholder = "인증번호를 입력해주세요!"
    }
    let idCompleteButton = UIButton().then{
        $0.setTitle("이메일 인증하기", for: .normal) // 버튼 안에 들어갈 글자
        $0.setTitleColor(.white, for: .normal) //버튼 안에 들어갈 글자 색깔
        $0.backgroundColor = .systemYellow
        $0.addTarget(self, action: #selector(aftercomplete), for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        view.addSubViews(studentNameTextField, idTextField, authCodeTextField, idCompleteButton)
        
        
        studentNameTextField.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view.snp.top).offset(170)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }
        
        idTextField.snp.makeConstraints{
            $0.centerX.equalTo(studentNameTextField)
            $0.centerY.equalTo(studentNameTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }
        authCodeTextField.snp.makeConstraints{
            $0.centerX.equalTo(idTextField)
            $0.centerY.equalTo(idTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(70)
        }
        
        idCompleteButton.snp.makeConstraints{
            $0.centerX.equalTo(idTextField)
            $0.top.equalTo(idTextField.snp.bottom).offset(420)
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(85)
        }
    }
    @objc func aftercomplete(_ sender: UIButton){
        //        idValidEmail()
        if idValidEmail() == false {
            idAlertMessage()
        }
        
    }
    
    
    
    // 아이디 형식 검사
    func idValidEmail() -> Bool{
        
        var id = idTextField.text ?? "" //optional을 위해 string 뒤에 ?를 붙여준다.
        if id.count == 16{
            var firstIdIndex = id.index(id.startIndex, offsetBy: 6)
            var lastIdIndex = id.index(id.startIndex, offsetBy: 16)
            let mail = id[firstIdIndex..<lastIdIndex]
            if mail == "@gsm.hs.kr"{
                return true
            }
            return false
            
        }
        return false
    }
    
    func idAlertMessage(){
        //1. 경고창 내용 만들기
        let idAlertMessage = UIAlertController(title:"iD오류 ",
                                               message: "id를 형식에 맞게 썼는지 확인해주시기 바랍니다.",
                                               preferredStyle: UIAlertController.Style.alert)
        //2. 확인 버튼 만들기
        let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
        //3. 확인 버튼을 경고창에 추가하기
        idAlertMessage.addAction(cancle)
        //4. 경고창 보이기
        present(idAlertMessage,animated: true,completion: nil)
    }

}
