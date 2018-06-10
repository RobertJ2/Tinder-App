//
//  UpdateViewController.swift
//  Tinder
//
//  Created by Robert Jackson Jr on 6/7/18.
//  Copyright © 2018 Robert Jackson Jr. All rights reserved.
//

import UIKit
import Parse

class UpdateViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    
    @IBOutlet var userGenderSwitch: UISwitch!
    
    @IBOutlet var interestedGenderSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel.isHidden = true
        
        if let isFemale = PFUser.current()?["isFemale"] as? Bool {
            userGenderSwitch.setOn(isFemale, animated: false)
        }
        
        if let isInterestedInWomen = PFUser.current()?["isInterestInWomen"] as? Bool {
            interestedGenderSwitch.setOn(isInterestedInWomen, animated: false)
        }
        
        if let photo = PFUser.current()?["photo"] as? PFFile {
            photo.getDataInBackground { (data, error) in
                if let imageData = data {
                    if let image = UIImage(data: imageData) {
                        self.profileImageView.image = image
                    }
                }
            }
        }
        
    }

    func createWomen() {
        let imageURLs = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW-X63ZDmi8zEDGMGEjOsawHyRHhCZ0TQZvOYcVBBfvVEY4U-jPA", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5B_c0JNe7114OhYpxauJEldeuru9Uta-BnV80XCd3leUf-CAH", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-fnV_meAj_t-I-lqLYn5GeVQ1x7B2_D0jw2sc0ngE3pnHNgBB", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh6OPZlS423mUQiHvL8VcCK4p30gIozJVCycFfhkLlhAoDifn-zw", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR34a91avZwcVmo9BUhO4H6xCCsc7Y-OG7fiHEpJamyYDsmSpUK", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCUSpIPATV1rm76IBFykPQDC9wfJ1uLUThrjOZrGk4IRT1gQnh", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl3srtdnVSr5SV_CZL0s6uThbdNvYvPaOMUeE5IF-YSWYOOy6_uA", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz9eDcS_BBcbx499JF5H_H4DzLI0oadX7MXvNyjakQSybfgx6olQ", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnxQyECOwaFL6r_VMdFwjjduS-FDARKW0-ECZObZw4mAg2gYTrfA", "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFcAAADgCAMAAABB2QqTAAABj1BMVEX57r369RV7sdMPcH6hNyj+88H/+hX//xYPc4H/+cb//BX/9sOkOCl9tNd/t9r//MjV0gAAAAD///9zb1cAY3MJaXapOSk1AAArRFChngDDupl6eACysADLwp/y57m5twCCeF11p8dzcQCSjwA4UWGFhAB4cmXv6hE8OwNuo8kBLTRWfJQAPU28t5IARlcAAAgAUFtpaAA0NABpmLWEHxVjlbqak3ytpwBbWgDW1tktAAAAVmYgOUK2rpAAPUbh1qpcWRNjAABoZVRxEwsAP1iknHxEQC0mIyYQDgORh2ctKgDIxRJSTzJWTT6qpI1GPjcdHQAlQT4XKSkAKThYXyNISxwvOB4AACVPS0sAHyApJTdpY1wAGTaJhHNJZHkAFz4AJ0kAGikAADM7Qh1KSgheXDU6NzshIRU0KhwwOjIAChuCfyNuazyNjZVPNSlkFg5SCxZrDx03Hwq0tLRENAU9Eg1fYGxREghCQlH899pQJRsjAA1AKwt4Lhm7XzCVRidjLRg2Hxs2XH+cShnXcDQ73cZBAAAPTElEQVR4nO2c/1vaVhfACXCTkABGQRSB8E0aFLFSqLIqhqLYaqR2Ulf7trq60r5zW1vd5ty7tm/Xbn/4e2++kEtAckP97d15ntYHhE9Ozjn33HPPvdHl+kf+EUcCVLlmqM8nykUoss8H0CV4H//ll+Bd8vanPy4u3769vPgUSojwEs3UdkJ2fREbjCUaUxWvPxLxw3/et+Nbe2cbG5XKxmUjVYTXHFF8cmuqEvF7dfG//eBFV/CrF7k7lZJ9o3GXLyr+LhWBe19U3jRdI1iDT93tAfWJP7LRcq7y2PLdyDCqSvZeNh1aGcjvzDvWZRD57rZDUzQqGifirZyfTU2dnZ9X/JF+dORuasyRulOqFfyVqV9LcUWQhGS0+usZjLk+jc+KDjT2bavq+s93khLD0TRF0wwjKZl3531Gj1wUyZ3Hv1F1OS9RNGUKzUixqT6V/RcyqcYgcRlRsTSORWQ6emEF+ystYm4TmsHv7VD9wij3+8B3m4SWAC30+SmBHgDmlIs+332SybDyJVS3EmMGYKHG0TOrwhvLRMODX4ZmiJwlJaGXKAiCRHMU1emLtndkFm6haLrTyeezuM+S+Xy+U1+hmNh5v4UJFAbFDThqKyUBhmyvBaAIsSqjWA3h9TYItB1DY/jDRiY5yG00LVH0Oys2QuI5cQrmmDvnudIgv9HwTebXvoi4TNhaGHrN+yFSGa+Or1gUlaAllCpDMZ0+7kbR1sDiXsR74Y1Mvf7ldce0BCeUXr7sZJWOJGTofm5l225ojDWh17wXl68nfvnqdZQztBWe/TIx8dXrH6LRW8IAO1QaNukSyH/40Uxw5yvInah29d35CmLvTUzcjEID9/nN623ZcH1aQvdf/vb777/9tiUZ6v42MfGfCch+nY3Wc/1x5n8z3L4gtKF+x3+WFWhOihnc5Pj4w3z+4cPl17eyVKYygCsOw/LNt/o8UWVoFAPd/CvAaKAkKbkTZ6T3A2bU4VzfJ00T/5miAZm4JXw5mHesw9jeDr4p7WORX9WUQ0u5KtUnP/dra+c3g+uta97qSTx6IK/0e83rrTSGxu9Yq6LdVh45jIOpp1/d/ABt/ZXhGRgU9fn9LAlHBBevCn3qJgep679rkx9AUyufKvcZ9Z4zkpVb7w8yFO52+UyPNP95lNbcb4kH5eaHDwPKntbQMNPAqsaahftFiuUv+8IXph37+YKvncH8ELkzcDamGOH9ADO8s1UX2bj4puKNvOtzmYpNvu+3b+QtWbnKy9t3zmKwIuOsBubi7/rrKP9Uk7Tg4ceeSlKuExWUuBHCakCvjMNiFQP7YRl7t5UgL/yA3Ml/+O/H939+fB9laFhNKhkORUP94gwWwt1Ke+PyolUUnZTWwFULvfnzLyh3Mkoymrl/H2UiOGsq0Vj+0x9TUFpb282ia8zp2gUAuAxMFFOXH/78+PFnyQg7mmOiyy4RirrAdQjtsnmx9dfff3/MYYmCydlP6gTCN0ONox9xboysfLQF82AshI0SLnM9XCRixuTSpevjgpaZLphr1BccKV2Fr8lvGreW7XqOVm5cIzeDRcS/SNIXGffBipmBuMz1GWILS/O00hi5WdIrvqMVPGFy1etR2Pcg0zPh01JoxB4MLgDUYtZpIxpylB0HUceKrY6lPGHinc294hf1uvjE4aZlaqal+md3MH28lxidzDfXyp/jPZMcJ+zcDrrd7mC5HRq11eVKfQ66e5f1nPCtinW7A8FCm3jGxAWIW4VgsNAbYsK9uYBbl6B7NuS8h8bL3yPNpns8JtxLd7GIXNh1CgbyGkLMbWHBwCnf9WBVsNNksYduOHAbGxKMct+CRWBnY8S3XUDuwblMcrMPC8HHTjpdLvFQ+9rcC51LU9FNdz/W7U5vOcCC4rEWTe5NrZJi4GgIDMIihcnTm69V1iCB8n4UjjchdlIIDqIi2SN33dhJWr/pQPrzi2r1tJDuwfYE2ya5hcVNd3DW+F5wbi7Ya4JAoYy9UbZbdXcFyLPB9OyVNw6viXPdbdJWIkjMWr5q4U6n8VcFgvWFxq3NFoao6w6upXtebhF6DiTGZ6/WFtp32mIWwhKIb04Pw1q5gQJho11+NcQIA7jlEFFEjIVuD1XXjEFd0ock+gJ5uBVQPFivQ7QybF49Zg1O2vKapFIBofQVPJODBXcg6C68IqqAWjZYGAAFY/IMpG9/Psi9JPKbPbc8nQ4imStsnsQUiiLigpSdHdzuwuzNmzd/yMeiAsPQlPSSKB5SQ1KDLsHgdFFsJBlOXR9IL8k6Bcc28eBGIevyLRu9Z+4RARbK4VBDlJGFCykfqBk1C1cnSjx8rT0k9x4XUAFwnABgJqtzmR/JEhoIXWWJQPB4Wi0AXokunEuW2WGeLLixuSetT8UwWme11DCXAvBTMdrgEq4MxGrs20LXyOnp2TKK1nRhdrqs3kiwgEpJscuNkXGBHGOk++ZgDZRn12Zn16aP08ZNTCODyiWDS7gGhXfIMadpPAeky+V0oGv09CEaYKJRG3PRGhl3BnIzvUkYr3b0CWIEbpbjVgpXjjoUZehzdafcWpajhc9XBjHUV61Obznk8stRjhKmrx4caa0U2TFKWMI4428oHCXtX80NlFsunFsi5Qow+Z0Oq0wKaOvG1JewMDlEtekQO6CpHpa9eZ0rPSLlMhStXO03xE3fc5lcorwOA/MeQzHZ4UVEsLzbjV9hl6xSlXch98WcTXFyvK1vb9AC2aIIJOoMJU0PpSJ5bnCVFBl3JsbQcdvJKHDb4CbJdpDV4RazqdGgzOltQDpOxh07hBPijq0Z3HN6/uWiZMPC1xBoac1WXZObJZwuDiQSbsDgErYsgVyHny/ddgeHoeG0dDuncztk3Bm42Kajj6fhYjAY6F+9wreCsIY8XmsbXLJmAVhGLZ1S2LM0Pz9bKKfT7qApgTSckSDzyXqY9ZT0tEPWsQQ30GbmvsfDspPhpfW1tWkos1DQz+m1tfX1pdVJlmU9YWM78ZAEC+tU1M36lvUgYZFMIgmr/6uvtV95PHrekZ4ShYNcpSkuvml82RDrayj7enog6gir5RGTWxzAsV7pmaQN4yOS4eY7ikN962FbrId9ru4TcHEybgNNQi/s1fWwm2ovkHA2Rlxa2CfhLqobMXSSzL4h9NE+tw2S8CN1YDDVGZLlW0OiuBUCt0GFX0j6/EbA5aEdmAyB2yB3QdvgYaLL9mDfUZJm8mTcRX2FIe0S2CGRo5mTSRKuJ6yfmqFzJBbeorjviLCeycc6Vxi+868pfCNJPSNxGxoZCkecKoHcUZ6TcT1hfepkDghSO2hUFwi57L5EXlECeXyJlLuJTt7QHKfsEXSu+e1VQi7MlWgSuCUxiv2hAidcdhEprHQoJt6wP3yVIhoWGvixIOxI8RJM2baDzhF3YUdK5qWVKsXlr5W7tHeLUfKUshPftUvvzvRNJB4KQl4R7tmfBnHCXWyOFbdysft1++Ka33bE5XlxppkgGHB8kzx+2VW0ViY7Ou+cSyaOuIvkXFBcMIula+WOt5fCHju2WrqtPnawQQRA7X61dPD1wupqeFKr/brXMF6EV1c3508bqaKznbI6zUmCEM8+2m+324uLS+gKYU84jHCbm+32yTexlZWGCHzONr9FtSeEDmwznLRyo1gsbm9vp1KtajYbjccVCf2CSZIeVca4Mezoh/LAB3gowDeThNfhaO3kNU26DjIFJKLmfimTNWZxMBPFz2NVHZ9Y4JfxkwklucvN4tynTrFwZODnf+vd25Ax89DCkfNd3mWMKx103dNj9uiDEbhxnNttW4glnEvW3erlYn6j6t3vi9Uv5D7AHMRkulWdWMe4K2TtAVxAAjtixJn9BXHLvItR/OYSb5kAfOF3iL9NuM7sERxAHxgDADzFT1nsOD/JA46wM1x0pjswbuBvd5xz+QdYQHArhudhXGNvZ0mqdIu+CewkgblSBb2Xcx4QMKIw+ypGmY9aYNjbIxzkGds1PWQ29ICMne+Hqwrn+qrL5D59ewYc2XrQIjAlmmfOsE4AZh6KGoHrkqtdrhkPLnAgfSFXfGXqa044uNnhMnOUR9XMIUCXugPAFzJP8JL2Zy3cmhmqeZxrujN5NMpJJuzUpJlgfDfMo4lc1OkDcJrChutpyWyI4BMUcb/Twm3oLuKwvjE+4Gjn87yKWDYeP8Dzi3xgDriD0bjGvihTwrYZRSwxvxoFC3OBcT63jpnRd9TNlIT9wz4Rf9K4wi4WTqCWM3Z3Cdv1/Qr/pBJo5SkepqLRRR2lLlGFfylp2aGnT8gbhz+ZmPPpQhVfSuNme8Kff6qPOK5E/GihhauNWUsvxDwES7Z7Tsw1Zj7pYDRsl9vpvV/xpREmTh42HcC19Jp0d9IC2W7T1VxLb0x/m3RXaAjXoq9WG3PREcOsy71l4T5QFy+km/1Xcy3bNHCtpL498kF2vYRgMr3LP1DTuKMevAcz+mLi4X5PoPFHce1yo9kBiNp2CpdbnOw5e2mkjRGWF6o0JDWchGcsu4BnCLmujgsu/nSU+IVeV79Od8IedhUrFID+Cy46Pooh9DqViaEdh0mscOT39Nbsi/BN5wkNHKmdaE55jnoZYfOhaDgha4t55Tm8DccjTqxyqnH31RZJGNP3laRxS9A+a05DjU+pD/ZI/w6zam+oZnDhglGzLmqVs4uODv8idV+iB5GovNbvYtfNzKPXk8idHo+D3pkqYCbHUIzwEGJRi4htd9dvN+LaeeCcuoHkkMuLLVhLRueREdbXWRgO3fs4UOcgTmir97HgxA7A19xf3K9+s4m2HufX51lPONVdvqlzGy09VBuj7LyTCE60FiAxjKjs/KoHcY2/m8DvomDgpB3N7pPEz+S7gKvVDndbcEtLLDuPtTZhaqCh3XUsu0o8E/G1E7PlyS6NLyyG59nwiX67QL6Xk6jsM/XCYZa8NQma8+Z+LhtuiYlm6/TrRjdxfb+68M2LhUlkoaUnLLnbQGvSxHqeyOgPoYhy9yG30Koadepvn8xDLqnbQGpB7XN6JifDi6eWrOLbNjcn2dV1J1yXCO97HsrJaasp9xqPL7bNti27vjrvwL7omcUxXgS8C/6w3Ip8grd+20vQn49HWg9ZuI2e3vj3W6fwlr6YCif3ecwK7EJNFEX+Gp57As2u09jJ1R9S1/QolYtvtrUt2snwwpPQiAX1IAG1VGtv/7TVSDVFx09tDgWjk5josc3rMsE/8v8j/wN4UClVwkpL7gAAAABJRU5ErkJggg==", "data:image/jpeg;base64,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"]
        
        var counter = 0
        
        
        for imageURL in imageURLs {
            counter += 1
            if let url = URL(string: imageURL){
                if let data = try? Data(contentsOf: url) {
                    let imageFile = PFFile(name: "photo.png", data: data)
                    
                    let user = PFUser()
                    user["photo"] = imageFile
                    user.username = String(counter)
                    user.password = "abc123"
                    user["isFemale"] = true
                    user["isInterestedInWomen"] = false
                    
                    user.signUpInBackground(block: { (success, error) in
                        if success {
                            print("Women User created!")
                        }
                    })
                }
            }
        }
    }
    
    
    @IBAction func updateImageTapped(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImageView.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateTapped(_ sender: Any) {
        
        PFUser.current()?["isFemale"] = userGenderSwitch.isOn
        PFUser.current()?["isInterestedInWomen"] = interestedGenderSwitch.isOn
        
        if let image = profileImageView.image {
            if let imageData = UIImagePNGRepresentation(image) {
                PFUser.current()?["photo"] = PFFile(name: "profile.png", data: imageData)
                PFUser.current()?.saveInBackground(block: { (success, error) in
                    if error != nil {
                        var errorMessage = "Update Failed - Try Again"
                        if let newError = error as NSError? {
                            if let detailError = newError.userInfo["error"] as? String {
                                errorMessage = detailError
                            }
                        }
                        
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = errorMessage
                        
                    } else {
                        print("Update Successful")
                        
                        self.performSegue(withIdentifier: "updateToSwipeSegue", sender: nil)
                    }
                })
            }
        }
        
    }
    
    

}
