//
//  ViewController.swift
//  72YearChallenge
//
//  Created by Mia on 2019/4/15.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import AVFoundation   //因為有放音樂

class ViewController: UIViewController {

   @IBOutlet weak var pictureView: UIImageView!
   @IBOutlet weak var dateSlider: UISlider!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormatter = DateFormatter()
    var dateString:String = ""
    var timer:Timer?
    var num=0
    var num1=0
    let img=["20190101","20220202","20250303","20280404","20310505","20340606","20370707","20400808","20430909","20461010","20491111","20521212","20550101","20580202","20610303","20640404","20670505","20700606","20730707","20760808","20790909","20821010","20851111","20881212","20910101"]
    //放音樂
    let player = AVPlayer(url: URL(string: "https://bit.ly/2Xs2oBF")!)
    //原youtube  https://www.youtube.com/watch?v=rU1ouAKoPeI
    
    override func viewDidLoad() {
        super.viewDidLoad()
    player.play()
        time()
        datePicker.locale=Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateSlider.isContinuous=false
        datePicker.isEnabled=false
    }
    func ticker(){
        if num>=img.count{
           num=0
            switchtime(num2: num)
            pictureView.image=UIImage(named: img[num])
    }else{
           switchtime(num2: num)
           pictureView.image=UIImage(named: img[num])
       }
        num+=1
    }
    
    //將圖片命名為0 giel 1-13，加入imgList這個“字串“    //imgList.append(String(year) + "girl" + String(month))//切換 Autoplay 開關或開啟，與 Autoplay 相關的元件isEnable設為true ，提供給使用者操作
    
    //點選自動就能自動播放照片
    
    
    @IBAction func changeSwitch(_ sender: UISwitch) {
   if sender.isOn {
            time()
            num=num1
            dateSlider.isEnabled=false
        }else{
            dateSlider.isEnabled=true
            timer?.invalidate()
        }
    
    }
    @IBAction func dateSlider(_ sender: UISlider) {
    sender.value.round()
        num1=Int(sender.value)
        pictureView.image = UIImage(named: img[num1])
        print(num1)
        switchtime(num2: num1)
}
    
    func time(){
        timer=Timer.scheduledTimer(withTimeInterval: 2, repeats: true){(timer) in self.ticker()}
    }
    func switchtime(num2:Int) {
        switch num2 {
        case 0:
            dateString = "2019/01/01"
        case 1:
            dateString = "2022/02/02"
        case 2:
            dateString = "2025/03/03"
        case 3:
            dateString = "2028/04/04"
        case 4:
            dateString = "2031/05/05"
        case 5:
            dateString = "2034/06/06"
        case 6:
            dateString = "2037/07/07"
        case 7:
            dateString = "2040/08/08"
        case 8:
            dateString = "2043/09/09"
        case 9:
            dateString = "2046/10/10"
        case 10:
            dateString = "2049/11/11"
        case 11:
            dateString = "2052/12/12"
        case 12:
            dateString = "2055/01/01"
        case 13:
            dateString = "2058/02/02"
        case 14:
            dateString = "2061/03/03"
        case 15:
            dateString = "2064/04/04"
        case 16:
            dateString = "2067/05/05"
        case 17:
            dateString = "2070/06/06"
        case 18:
            dateString = "2073/07/07"
        case 19:
            dateString = "2076/08/08"
        case 20:
            dateString = "2079/09/09"
        case 21:
            dateString = "2082/10/10"
        case 22:
            dateString = "2085/11/11"
        case 23:
            dateString = "2088/12/12"
        default:
            dateString = "2091/07/07"
        }
        let date = dateFormatter.date(from: dateString)
        datePicker.date=date!
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

}


