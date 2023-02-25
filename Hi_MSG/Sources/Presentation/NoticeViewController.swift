import Foundation
import UIKit
import SnapKit
import Then
import Alamofire

final class NoticeViewController: BaseViewController {
    
    private let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    var delete_mode : Bool = false
    
    private let delete_image = UIImage(systemName: "minus.circle.fill")
    
    private let title_notice = UILabel().then {
        $0.font = .hi_MSG(size: 24, family: .extraBold)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.text = "공지사항"
    }
    
    private let notice1 = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToContents), for: .touchUpInside)
        $0.addTarget(self, action: #selector(goToDelete), for: .touchDragOutside)
    }
    
    lazy var delete_notice1 = UIButton().then {
        $0.setImage(delete_image, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(delete222), for: .touchUpInside)
    }
    
    private let title_contents1 = UILabel().then {
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.text = "12/20(화) 홈베이스 이용 공지"
    }
    
    private let time_that_moment_contents1 = UILabel().then {
        $0.text = "2022.12.20 11:00"
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let from_contents1 = UILabel().then {
        $0.text = "이명규T"
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let notice2 = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToDelete), for: .touchDragOutside)
    }
    
    lazy var delete_notice2 = UIButton().then {
        $0.setImage(delete_image, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(delete222), for: .touchUpInside)
    }
    
    private let notice3 = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToDelete), for: .touchDragOutside)
    }
    
    lazy var delete_notice3 = UIButton().then {
        $0.setImage(delete_image, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(delete222), for: .touchUpInside)
    }
    
    private let notice4 = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToDelete), for: .touchDragOutside)
    }
    
    lazy var delete_notice4 = UIButton().then {
        $0.setImage(delete_image, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(delete222), for: .touchUpInside)
    }
    
    private let notice5 = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToDelete), for: .touchDragOutside)
    }
    
    lazy var delete_notice5 = UIButton().then {
        $0.setImage(delete_image, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(delete222), for: .touchUpInside)
    }
    
    private let allDelete = UIButton().then {
        $0.isHidden = true
        $0.setTitle("전부 삭제", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x4D4D4D), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 17, family: .medium)
        $0.addTarget(self, action: #selector(allDeleteNotice), for: .touchUpInside)
    }
    
    private let cancel = UIButton().then {
        $0.isHidden = true
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x4D4D4D), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 17, family: .medium)
        $0.addTarget(self, action: #selector(cancelNotice), for: .touchUpInside)
    }
    
    private let not_notice = UILabel().then {
        $0.text = "- 글이 없어요 -"
        $0.font = .hi_MSG(size: 20, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
        $0.isHidden = true
    }
    
    lazy var update_notice = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0x212121)
        $0.layer.cornerRadius = 0.5 * 64
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(resisterNotice), for: .touchUpInside)
    }
    
    private let plus = UIImageView().then {
        $0.tintColor = UIColor(rgb: 0xFFC033)
        $0.image = UIImage(systemName: "plus.circle.fill")
        $0.layer.cornerRadius = 0.5 * 64
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0x000000)
        
        view.backgroundColor = UIColor(rgb: 0xF2F2F2)
        let HI_LOGO_2 = UIImage(named: "HI_LOGO_2")
        let leftButtonItem = UIBarButtonItem(image: HI_LOGO_2, style: .plain, target: self, action: nil)
        leftButtonItem.tintColor = UIColor(rgb: 0xFFC033)
        navigationItem.leftBarButtonItem = leftButtonItem
        
        
        let largeFont = UIFont.systemFont(ofSize: 100)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        
        let person_circle = UIImage(systemName: "person.circle.fill", withConfiguration: configuration)
        
        let rightButtonItem = UIBarButtonItem(image: person_circle, style: .plain, target: self, action: nil)
        //        rightButtonItem.width = 16
        rightButtonItem.tintColor = UIColor(rgb: 0xD9D9D9)
        
        let largeFont1 = UIFont.systemFont(ofSize: 15)
        let configuration1 = UIImage.SymbolConfiguration(font: largeFont1)
        
        let bell_badge = UIImage(systemName: "bell.badge.fill", withConfiguration: configuration1)
        
        let rightButtonItem2 = UIBarButtonItem(image: bell_badge, style: .plain, target: self, action: nil)
        //        rightButtonItem2.width = 16
        rightButtonItem2.tintColor = UIColor(rgb: 0x4D4D4D)
        //        rightButtonItem2.tintColor = UIColor(rgb: 0xFFB001)
        
        navigationItem.rightBarButtonItems = [rightButtonItem2, rightButtonItem]
        
        changeStatusBarBgColor(bgColor: UIColor.white)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0xFFFFFF)
    }
    
    override func addView() {
        view.addSubviews(
            title_notice,
            notice1,
            delete_notice1,
            title_contents1,
            time_that_moment_contents1,
            from_contents1,
            notice2,
            delete_notice2,
            notice3,
            delete_notice3,
            notice4,
            delete_notice4,
            notice5,
            delete_notice5,
            allDelete,
            cancel,
            not_notice,
            update_notice,
            plus
        )
    }
    
    override func setLayout() {
        self.title_notice.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            $0.leading.equalTo(self.view).offset(20)
        }
        self.notice1.snp.makeConstraints {
            $0.top.equalTo(self.title_notice.snp.bottom).offset(40)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.delete_notice1.snp.makeConstraints {
            $0.centerY.equalTo(self.notice1.snp.centerY)
            $0.leading.equalTo(self.notice1.snp.leading).inset(16)
        }
        self.title_contents1.snp.makeConstraints {
            $0.top.equalTo(self.notice1.snp.top).inset(8)
            $0.leading.equalTo(self.notice1.snp.leading).inset(16)
        }
        self.time_that_moment_contents1.snp.makeConstraints {
            $0.top.equalTo(self.title_contents1.snp.bottom).offset(4)
            $0.leading.equalTo(self.notice1.snp.leading).inset(16)
        }
        self.from_contents1.snp.makeConstraints {
            $0.bottom.equalTo(self.notice1.snp.bottom).inset(6)
            $0.trailing.equalTo(self.notice1.snp.trailing).inset(16)
        }
        self.notice2.snp.makeConstraints {
            $0.top.equalTo(self.notice1.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.delete_notice2.snp.makeConstraints {
            $0.centerY.equalTo(self.notice2.snp.centerY)
            $0.leading.equalTo(self.notice2.snp.leading).inset(16)
        }
        self.notice3.snp.makeConstraints {
            $0.top.equalTo(self.notice2.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.delete_notice3.snp.makeConstraints {
            $0.centerY.equalTo(self.notice3.snp.centerY)
            $0.leading.equalTo(self.notice3.snp.leading).inset(16)
        }
        self.notice4.snp.makeConstraints {
            $0.top.equalTo(self.notice3.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.delete_notice4.snp.makeConstraints {
            $0.centerY.equalTo(self.notice4.snp.centerY)
            $0.leading.equalTo(self.notice4.snp.leading).inset(16)
        }
        self.notice5.snp.makeConstraints {
            $0.top.equalTo(self.notice4.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.delete_notice5.snp.makeConstraints {
            $0.centerY.equalTo(self.notice5.snp.centerY)
            $0.leading.equalTo(self.notice5.snp.leading).inset(16)
        }
        self.allDelete.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(43)
            $0.trailing.equalTo(self.view).inset(74)
        }
        self.cancel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(43)
            $0.trailing.equalTo(self.view).inset(20)
        }
        self.not_notice.snp.makeConstraints {
            $0.centerX.equalTo(self.view.snp.centerX)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(85)
        }
        self.update_notice.snp.makeConstraints {
            $0.top.equalTo(self.notice5.snp.top).offset(50)
            $0.trailing.equalTo(self.view).inset(28)
            $0.width.equalTo(64)
            $0.height.equalTo(64)
        }
        self.plus.snp.makeConstraints {
            $0.top.equalTo(self.notice5.snp.top).offset(50)
            $0.trailing.equalTo(self.view).inset(28)
            $0.width.equalTo(64)
            $0.height.equalTo(64)
        }
    }
    
    func deleteCancel() {
        delete_mode = false
        delete_notice1.isHidden = true
        delete_notice2.isHidden = true
        delete_notice3.isHidden = true
        delete_notice4.isHidden = true
        delete_notice5.isHidden = true
        allDelete.isHidden = true
        cancel.isHidden = true
    }
    
    @objc private func goToContents(_ sender: UIButton) {
        if delete_mode == false {
            let vc = NoticeContentsViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc private func goToDelete(_ sender: UIButton) {
        delete_mode = true
        allDelete.isHidden = false
        cancel.isHidden = false
        delete_notice1.isHidden = false
        delete_notice2.isHidden = false
        delete_notice3.isHidden = false
        delete_notice4.isHidden = false
        delete_notice5.isHidden = false
        self.title_contents1.snp.makeConstraints {
            $0.top.equalTo(self.notice1.snp.top).inset(8)
            $0.leading.equalTo(self.notice1.snp.leading).inset(60)
        }
        self.view.layoutIfNeeded()
    }
    
    @objc private func allDeleteNotice(_ sender: UIButton) {
        notice1.isHidden = true
        notice2.isHidden = true
        notice3.isHidden = true
        notice4.isHidden = true
        notice5.isHidden = true
        title_contents1.isHidden = true
        time_that_moment_contents1.isHidden = true
        from_contents1.isHidden = true
        delete_mode = false
        delete_notice1.isHidden = true
        delete_notice2.isHidden = true
        delete_notice3.isHidden = true
        delete_notice4.isHidden = true
        delete_notice5.isHidden = true
        allDelete.isHidden = true
        cancel.isHidden = true
        not_notice.isHidden = false
    }
    
    @objc private func cancelNotice(_ sender: UIButton) {
        deleteCancel()
    }
    
    @objc private func resisterNotice(_ sender: UIButton) {
        let vc = ResisterNoticeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func delete222(_ sender: UIButton){
        let completed = UIAlertController(title: "공지글 삭제", message: "글을 삭제하면 복구할 수 없어요!\n 정말 삭제하실 건가요?", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "취소", style: .default){_ in
        })
        completed.addAction(UIAlertAction(title: "삭제", style: .default){_ in
            print("삭제 하기")
            self.deleteCancel()
        })
        present(completed, animated: true, completion: nil)
    }
}
