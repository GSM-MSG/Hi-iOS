import Foundation
import UIKit
import SnapKit
import Then
import Alamofire

class ResisterNoticeViewController: BaseViewController {

    lazy var rightBarButtonItem = UIBarButtonItem(title: "등록", style: .plain, target: self, action: #selector(updateNotice))

    private let updateView = UIView().then {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
    }
    
    private let titleTextField = UITextField().then {
        $0.borderStyle = .none
        $0.placeholder = "제목"
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let underView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0x999999)
    }
    
    let textViewPlaceHolder = "내용을 입력하세요."
    
    lazy var contentTextView = UITextView().then {
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
        $0.text = self.textViewPlaceHolder
        $0.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0xF2F2F2)
        
        rightBarButtonItem.tintColor = UIColor(rgb: 0xFFC033)
        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0xF2F2F2)
    }
    
    override func addView() {
        view.addSubviews(
            updateView,
            titleTextField,
            underView,
            contentTextView
        )
    }
    
    override func setLayout() {
        self.updateView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(self.view.safeAreaLayoutGuide).inset(24)
        }
        self.titleTextField.snp.makeConstraints {
            $0.top.equalTo(self.updateView.snp.top).inset(34)
            $0.leading.trailing.equalTo(self.updateView).inset(16)
            $0.height.equalTo(26)
        }
        self.underView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(self.titleTextField.snp.bottom).offset(5)
            $0.leading.trailing.equalTo(self.titleTextField)
        }
        self.contentTextView.snp.makeConstraints {
            $0.top.equalTo(self.underView.snp.bottom).offset(25)
            $0.leading.trailing.equalTo(self.updateView).inset(16)
            $0.bottom.equalTo(self.updateView.snp.bottom).inset(25)
        }
    }
    
    @objc private func updateNotice(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension ResisterNoticeViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        let characterCount = newString.count
        guard characterCount <= 700 else { return false }

        return true
    }
}
