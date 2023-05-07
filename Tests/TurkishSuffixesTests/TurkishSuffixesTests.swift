import XCTest
@testable import TurkishSuffixes

final class TurkishSuffixesTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let testStrings = ["başak", "Paşa", "kedi", "kuzu", "kurt", "kağıt", "zaman", "cemiyet"]

        struct TurkishSuffixesTest {
            var suffix: TurkishSuffixes.TurkishSuffix
            let testStrings = ["başak", "Paşa", "kedi", "kuzu", "kurt", "kağıt", "zaman", "cemiyet"]
            var testAssertion: [String] {
                switch suffix {
                case .kelimenin:
                    return ["başağın", "Paşa'nın", "kedinin", "kuzunun", "kurdun", "kağıdın", "zamanın", "cemiyetin"]
                case .kelimeye:
                    return ["başağa", "Paşa'ya", "kediye", "kuzuya", "kurda", "kağıda", "zamana", "cemiyete"]
                case .kelimeyi:
                    return ["başağı", "Paşa'yı", "kediyi", "kuzuyu", "kurdu", "kağıdı", "zamanı", "cemiyeti"]
                case .kelimede:
                    return ["başakta", "Paşa'da", "kedide", "kuzuda", "kurtta", "kağıtta", "zamanda", "cemiyette"]
                case .kelimeden:
                    return ["başaktan", "Paşa'dan", "kediden", "kuzudan", "kurttan", "kağıttan", "zamandan", "cemiyetten"]
                case .kelimeyle:
                    return ["başakla", "Paşa'yla", "kediyle", "kuzuyla", "kurtla", "kağıtla", "zamanla", "cemiyetle"]
                }
            }
        }
        let sentences = ["özelliği", "imrenmek", "hatırlamak", "karar kılmak", "çekinmek", "yol almak"]
        
        
        TurkishSuffixes.TurkishSuffix.allCases.enumerated().forEach { (index, suffix) in
            let testCheck = TurkishSuffixesTest(suffix: suffix)
            testStrings.enumerated().forEach { (strIndex, str) in
                print("--")
                let testCase = TurkishSuffixes.init().addTurkishSuffix(str, suffix, str.first?.isUppercase ?? false)
                XCTAssertEqual(testCase, testCheck.testAssertion[strIndex])
                print(testCase, sentences[index])
            }
            print("\n")
        }

        print("|",TurkishSuffixes.TurkishSuffix.allCases.map{$0.rawValue}.joined(separator: " | "),"|")
        print("|",TurkishSuffixes.TurkishSuffix.allCases.map{_ in " --- "}.joined(separator: " | "),"|")
            testStrings.enumerated().forEach { (strIndex, str) in
                print("|",TurkishSuffixes.TurkishSuffix.allCases.map { TurkishSuffixes.init().addTurkishSuffix(str,$0, str.first?.isUppercase ?? false)}.joined(separator: " | "),"|")
            }
    }
}
