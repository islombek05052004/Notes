//
//  PasswordController.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 14/05/23.
//

import UIKit
import SnapKit


class PasswordController: UIViewController {
    
    let mg:CGFloat = 20
    var passArr = [Int]()
    let viewForButtons = UIView()
    let viewcircle1 = UIView()
    let viewcircle2 = UIView()
    let viewcircle3 = UIView()
    let viewcircle4 = UIView()
    let ContenerCircleViews = UIView()
    lazy var viewCircleArr = [viewcircle1, viewcircle2, viewcircle3, viewcircle4]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        designviewForButtons()
        navigationController?.setNavigationBarHidden(true, animated: false)
        var tag = 1
        for i in 0...3 {
            for j in 0...2 {
                let btn = modelForUIElements().Btn(.systemGray5, "\(tag)", .black)
                btn.frame = CGRect(x: 0.2 * wd - mg + CGFloat(j)*(0.2*wd + mg),
                                   y: 2 * mg + CGFloat(i)*(0.2*wd + mg),
                                   width: 0.2 * wd,
                                   height: 0.2 * wd)
                btn.tag = tag
                btn.titleLabel?.font = .systemFont(ofSize: 0.1*wd, weight: .semibold)
                btn.clipsToBounds = true
                btn.layer.cornerRadius = 0.1 * wd
                btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
                if tag == 10 {
                    btn.isHidden = true
                } else if tag == 11 {
                    btn.backgroundColor = .systemGray5
                    btn.setTitle("0", for: .normal)
                } else if tag == 12 {
                    btn.backgroundColor = .white
                    btn.setTitle("Back", for: .normal)
                    btn.setTitleColor(.gray, for: .normal)
                    btn.titleLabel?.font = .systemFont(ofSize: 0.07*wd, weight: .medium)
                }
                viewForButtons.addSubview(btn)
                tag += 1
            }
        }
        designContener()
        for item in 0...3 {
            let circleView = viewCircleArr[item]
            circleView.backgroundColor = .systemGray3
            circleView.layer.cornerRadius = 0.04*wd
            ContenerCircleViews.addSubview(circleView)
            circleView.snp.makeConstraints { make in
                make.left.equalTo(0 + CGFloat(item)*0.1*wd)
                make.centerY.equalTo(ContenerCircleViews.snp.centerY)
                make.height.width.equalTo(0.08*wd)
            }
        }
    }
    @objc func btnClick(_ sender: UIButton) {
        let senderNum = sender.tag
        var passCount = passArr.count
        if passCount < 4 {
            if senderNum > 0 && senderNum < 10 || senderNum == 11 {
                senderNum == 11 ? passArr.append(0) : passArr.append(senderNum)
            }
            if senderNum == 12 && passCount > 0 {
                    passArr.removeLast()
            }
            chooseColorViewCircle(passArr.count)
            passCount = passArr.count
        }
        if passCount == 4 {
            let appPass = pass_func().getPass()
            var senderPass = ""
            for item in 0..<passCount {
                senderPass += "\(passArr[item])"
            }
            appPass == senderPass ? colorCircleBeforePass(true) : colorCircleBeforePass(false)
        }
    }
}

extension PasswordController {
    func designviewForButtons() {
        viewForButtons.backgroundColor = .white
        viewForButtons.frame = CGRect(x: 0, y: 0.4*hg, width: wd, height: 0.7*hg)
        viewForButtons.layer.cornerRadius = 0.05*hg
        view.addSubview(viewForButtons)
    }
    func chooseColorViewCircle(_ passCount: Int) {
        for item in 0..<passCount {
            let viewCircle = viewCircleArr[item]
            viewCircle.backgroundColor = .systemBlue
        }
        for item in passCount..<4 {
            let viewCircle = viewCircleArr[item]
            viewCircle.backgroundColor = .systemGray3
        }
    }
    func colorCircleBeforePass (_ answer: Bool) {
        for item in viewCircleArr {
            item.backgroundColor = answer == true ? .systemGray3 : .red
            }
        let vs = HomeController()
        answer == true ? navigationController?.pushViewController(vs, animated: true) : errorPassAnimation()
    }
    func designContener() {
        ContenerCircleViews.backgroundColor = .clear
        ContenerCircleViews.frame = CGRect(x: 0.3*wd, y: 0.3*hg, width: 0.4*wd, height: 0.1*wd)
        view.addSubview(ContenerCircleViews)
    }
    func errorPassAnimation() {
        UIView.animate(withDuration: 0.1) {
            self.ContenerCircleViews.frame = CGRect(x: 0.2 * wd,
                                                    y: 0.3 * hg,
                                                    width: 0.4 * wd,
                                                    height: 0.1 * wd)
        } completion: { _ in
            self.ContenerCircleViews.frame = CGRect(x: 0.3 * wd,
                                                    y: 0.3 * hg,
                                                    width: 0.4 * wd,
                                                    height: 0.1 * wd)
            self.chooseColorViewCircle(0)
        }
        passArr.removeAll()
    }
}
