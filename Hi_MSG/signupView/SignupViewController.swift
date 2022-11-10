
//  ViewController.swift
//  Test
//
//  Created by 박준서 on 2022/10/17.
//
import UIKit
import SnapKit

class SignupViewController: UIViewController {
    let logoImageView = UIImageView()
    let idTextField = UITextField()
    let psTextField = UITextField()
    let psCorrectTextField = UITextField()
    let completeButton = UIButton() // 완료버튼
    let wrongIdAlert = UIAlertController() // 틀렸을때 뜨는 안내문
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubViews(logoImageView, idTextField, psTextField, psCorrectTextField, completeButton)
        
        logoImageView.image = UIImage(named: "HI_LOGO")
        logoImageView.layer.cornerRadius = 50 //사진 겉에 둥글게
        logoImageView.clipsToBounds = true // 잘리는거
        
        idTextField.borderStyle = .line //모서리 둥글게
        idTextField.borderStyle = .roundedRect
        idTextField.placeholder = "설정할 아이디를 입력해주세요!"
        
        psTextField.borderStyle = .line
        psTextField.borderStyle = .roundedRect
        psTextField.placeholder = "설정할 비밀번호를 입력해주세요!"
        
        psCorrectTextField.borderStyle = .line
        psCorrectTextField.borderStyle = .roundedRect
        psCorrectTextField.placeholder = "비밀번호를 다시 입력해주세요!"
        
        completeButton.setTitle("완료!", for: .normal) // 버튼 안에 들어갈 글자
        completeButton.setTitleColor(.white, for: .normal) //버튼 안에 들어갈 글자 색깔
        completeButton.backgroundColor = .systemYellow // 버튼 색깔
        completeButton.layer.cornerRadius = 13 // 버튼 곡률 크기
        completeButton.addTarget(self, action: #selector(gotoLogin), for: .touchUpInside)
        
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view).offset(-140)
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalTo(logoImageView) //뷰에서의 X좌표의 가운데
            $0.top.equalTo(logoImageView.snp.bottom).offset(35)
            $0.width.equalTo(300) //너비 = 60
            $0.height.equalTo(50) // 높이 = 10
            
        }
        psTextField.snp.makeConstraints {
            $0.centerX.equalTo(logoImageView)
            $0.top.equalTo(idTextField.snp.bottom).offset(15)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        psCorrectTextField.snp.makeConstraints {
            $0.centerX.equalTo(logoImageView)
            $0.top.equalTo(psTextField.snp.bottom).offset(15)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        completeButton.snp.makeConstraints{
            $0.centerX.equalTo(logoImageView)
            $0.top.equalTo(psCorrectTextField.snp.bottom).offset(40)
            $0.width.equalTo(120)
            $0.height.equalTo(50)
        }
    }
    
    
    @objc func aftercomplete(_ sender: UIButton){
        //        idValidEmail()
        if idValidEmail() == false {
            idAlertMessage()
        }
        //        validPassword()
        if validPassword() == false{
            psAlertMessage()
        }
        //        samePassword()
        if samePassword() == false{
            psCorrectAlertMessage()
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
    
    // 비밀번호 형식 검사
    func validPassword() -> Bool{
        
        var ps = psTextField.text ?? "" //optional을 위해 string 뒤에 ?를 붙여준다.
        if ps.count > 8{
            return true
        }
        return false
    }
    func samePassword() -> Bool{
        
        var ps = psTextField.text ?? ""
        var samePs = psCorrectTextField.text ?? "" //optional을 위해 string 뒤에 ?를 붙여준다.
        if samePs == ps{
            return true
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
    
    func psAlertMessage(){
        //1. 경고창 내용 만들기
        let psAlertMessage = UIAlertController(title:"비밀번호 오류 ",
                                               message: "비밀번호를 8자 이상으로 써주세요.",
                                               preferredStyle: UIAlertController.Style.alert)
        let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        psAlertMessage.addAction(cancle)
        
        present(psAlertMessage,animated: true,completion: nil)
    }
    
    func psCorrectAlertMessage(){
        //1. 경고창 내용 만들기
        let psCorrectAlertMessage = UIAlertController(title:"비밀번호 불일치",
                                                      message: "설정한 비밀번호를 다시 입력해주세요.",
                                                      preferredStyle: UIAlertController.Style.alert)
        let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        psCorrectAlertMessage.addAction(cancle)
        
        present(psCorrectAlertMessage,animated: true,completion: nil)
    }
    
    //버튼을 누르고 나서 -> id를 형식에 맞게 썼는지 확인(학교이메일) -> 비밀번호가 8자 이상인지 확인
    // -> 설정한 비밀번호와 다시 쓴 비밀번호가 일치하는지 확인 ->
    
}

