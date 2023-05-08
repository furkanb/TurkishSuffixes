import XCTest
@testable import TurkishSuffixes

final class TurkishSuffixesTests: XCTestCase {
    /// Compares with Wikipedia article examples
    /// https://tr.wikipedia.org/wiki/T%C3%BCrk%C3%A7ede_ismin_h%C3%A2lleri
    /// Scraped on 2023-May-09
    func testWikipediaExample() throws {
        let nouns = ["çiçek", "sokak", "kilit", "paket", "saat", "ağaç", "yüzük", "çorap", "rol", "işgal", "misal", "petrol", "yurt", "inan", "kalp", "borç", "şahıs", "zehir", "karın", "alın", "kristal", "Konak", "konak", "ağız", "akıl", "gömlek", "dikkat", "vakit", "uzak", "su", "ne", "ideal", "kol saati", "renk", "hayat", "hukuk", "bilet", "geçit", "gök", "cep", "isim", "normal", "mutluluk", "hayal", "sosyal", "oğlan", "oğul", "kültür", "Ege Denizi", "piyanist", "hava", "hava alanı", "bu", "ışık", "ben", "biz", "ahlak", "tank", "millet", "devlet", "pasaport", "taşıt", "umut", "ayakkabı", "burç"]
        let cases: [TurkishSuffixes.TurkishSuffix] = [.kelimeyi, .kelimeye, .kelimede, .kelimeden, .kelimenin]
        let wikiTable = ["çiçeği", "çiçeğe", "çiçekte", "çiçekten", "çiçeğin", "sokağı", "sokağa", "sokakta", "sokaktan", "sokağın", "kilidi", "kilide", "kilitte", "kilitten", "kilidin", "paketi", "pakete", "pakette", "paketten", "paketin", "saati", "saate", "saatte", "saatten", "saatin", "ağacı", "ağaca", "ağaçta", "ağaçtan", "ağacın", "yüzüğü", "yüzüğe", "yüzükte", "yüzükten", "yüzüğün", "çorabı", "çoraba", "çorapta", "çoraptan", "çorabın", "rolü", "role", "rolde", "rolden", "rolün", "işgali", "işgale", "işgalde", "işgalden", "işgalin", "misali", "misale", "misalde", "misalden", "misalin", "petrolü", "petrole", "petrolde", "petrolden", "petrolün", "yurdu", "yurda", "yurtta", "yurttan", "yurtun", "inanı", "inana", "inanda", "inandan", "inanın", "kalbi", "kalbe", "kalpte", "kalpten", "kalbin", "borcu", "borca", "borçta", "borçtan", "borcun", "şahsı", "şahsa", "şahısta", "şahıstan", "şahsın", "zehri", "zehire", "zehirde", "zehirden", "zehrin", "karını", "karına", "karında", "karından", "karının", "alnı", "alna", "alında", "alından", "alnın", "kristali", "kristale", "kristalde", "kristalden", "kristalin", "Konak’ı", "Konak’a", "Konak’ta", "Konak’tan", "Konak’ın", "konağı", "konağa", "konakta", "konakta", "konağın", "ağızı", "ağza", "ağızda", "ağızdan", "ağzın", "akılı", "akla", "akılda", "akıldan", "aklın", "gömleği", "gömleğe", "gömlekte", "gömlekten", "gömleğin", "dikkati", "dikkate", "dikkatte", "dikkatten", "dikkatin", "vakti", "vakte", "vakte", "vakitten", "vakitin", "uzağı", "uzağa", "uzakta", "uzaktan", "uzağın", "suyu", "suya", "suda", "sudan", "suyun", "neyi", "neye", "nede", "neden", "neyin", "ideali", "ideale", "idealde", "idealden", "idealin", "kol saatini", "kol saatine", "kol saatinde", "kol saatinden", "kol saatinin", "rengi", "renge", "renkte", "renkten", "rengin", "hayatı", "hayata", "hayatta", "hayattan", "hayatın", "hukuku", "hukuka", "hukukta", "hukuktan", "hukukun", "bileti", "bilete", "bilette", "biletten", "biletin", "geçidi", "geçide", "geçitte", "geçitten", "geçidin", "göğü", "göğe", "göğünde", "göğünden", "göğünün", "cebi", "cebe", "cepte", "cepten", "cebin", "isimi", "isme", "isimde", "isimden", "ismin", "normali", "normale", "normalde", "normalden", "normalin", "mutluluğu", "mutluluğa", "mutlulukta", "mutluluktan", "mutluluğun", "hayali", "hayale", "hayalde", "hayalden", "hayalin", "sosyali", "sosyale", "sosyalde", "sosyalden", "sosyalin", "oğlanı", "oğlana", "oğlanda", "oğlandan", "oğlanın", "oğlu", "oğla", "oğulda", "oğuldan", "oğlun", "kültürü", "kültüre", "kültürde", "kültürden", "kültürün", "Ege Denizi’ni", "Ege Denizi’ne", "Ege Denizi’nde", "Ege Denizi’nden", "Ege Denizi’nin", "piyanisti", "piyaniste", "piyanistte", "piyanistten", "piyanistin", "havası", "havaya", "havada", "havadan", "havanın", "hava alanını", "hava alana", "hava alanda", "hava alandan", "hava alanının", "bunu", "buna", "bunda", "bundan", "bunun", "ışığı", "ışığa", "ışıkta", "ışıktan", "ışığın", "beni", "bene", "bende", "benden", "benim", "bizi", "bize", "bizde", "bizden", "bizim", "ahlaki", "ahlaka", "ahlakta", "ahlaktan", "ahlakın", "tankı", "tanka", "tankta", "tanktan", "tankın", "milleti", "millete", "millette", "milletten", "milletin", "devleti", "devlete", "devlette", "devletten", "devletin", "pasaportu", "pasaporta", "pasaportta", "pasaportun", "pasaportun", "taşıtı", "taşıta", "taşıtta", "taşıttan", "taşıtın", "umudu", "umuda", "umutta", "umuttan", "umutun", "ayakkabıyı", "ayakkabıya", "ayakkabıda", "ayakkabıdan", "ayakkabının", "burcu", "burca", "burçta", "burçtan", "burcun"]
        
        XCTAssertEqual(wikiTable.count / cases.count, nouns.count, "input output count is wrong")
        nouns.enumerated().forEach { (nounIndex, noun) in
            cases.enumerated().forEach { (suffixIndex, suffix) in
                let moduleAssertion = TurkishSuffixes.init().addTurkishSuffix(noun, suffix, noun.first?.isUppercase ?? false, "’")
                let wikiTableEntryIndex = suffixIndex + (nounIndex * cases.count)
                XCTAssertEqual(moduleAssertion, wikiTable[wikiTableEntryIndex])
            }
        }

    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let testStrings = ["top","başak", "Paşa", "kedi", "kuzu", "kurt", "kağıt", "zaman", "cemiyet", "tank"]

        struct TurkishSuffixesTest {
            var suffix: TurkishSuffixes.TurkishSuffix
            let testStrings = ["top","başak", "Paşa", "kedi", "kuzu", "kurt", "kağıt", "zaman", "cemiyet", "tank"]
            var testAssertion: [String] {
                switch suffix {
                case .kelimenin:
                    return ["topun", "başağın", "Paşa'nın", "kedinin", "kuzunun", "kurdun", "kağıdın", "zamanın", "cemiyetin", "tankın"]
                case .kelimeye:
                    return ["topa", "başağa", "Paşa'ya", "kediye", "kuzuya", "kurda", "kağıda", "zamana", "cemiyete", "tanka"]
                case .kelimeyi:
                    return ["topu", "başağı", "Paşa'yı", "kediyi", "kuzuyu", "kurdu", "kağıdı", "zamanı", "cemiyeti", "tankı"]
                case .kelimede:
                    return ["topta", "başakta", "Paşa'da", "kedide", "kuzuda", "kurtta", "kağıtta", "zamanda", "cemiyette", "tankta"]
                case .kelimeden:
                    return ["toptan", "başaktan", "Paşa'dan", "kediden", "kuzudan", "kurttan", "kağıttan", "zamandan", "cemiyetten", "tanktan"]
                case .kelimeyle:
                    return ["topla", "başakla", "Paşa'yla", "kediyle", "kuzuyla", "kurtla", "kağıtla", "zamanla", "cemiyetle", "tankla"]
                }
            }
        }
        func sentenceEnding(_ suffix: TurkishSuffixes.TurkishSuffix) -> String {
            switch suffix {
            case .kelimeye:
                return "imrenmek"
            case .kelimeyi:
                return "düşünmek"
            case .kelimenin:
                return "farkı"
            case .kelimeyle:
                return "sevinmek"
            case .kelimede:
                return "karar kılmak"
            case .kelimeden:
                return "çekinmek"
            }
        }
        
        TurkishSuffixes.TurkishSuffix.allCases.enumerated().forEach { (index, suffix) in
            let testCheck = TurkishSuffixesTest(suffix: suffix)
            print("--")
            testStrings.enumerated().forEach { (strIndex, str) in
                let testCase = TurkishSuffixes.init().addTurkishSuffix(str, suffix, str.first?.isUppercase ?? false)
                XCTAssertEqual(testCase, testCheck.testAssertion[strIndex])
                print(testCase, sentenceEnding(suffix))
            }
        }

        print("| |",TurkishSuffixes.TurkishSuffix.allCases.map{$0.rawValue}.joined(separator: " | "),"|")
        print("| --- |",TurkishSuffixes.TurkishSuffix.allCases.map{_ in " --- "}.joined(separator: " | "),"|")
            testStrings.enumerated().forEach { (strIndex, str) in
                print("|",str,"|",TurkishSuffixes.TurkishSuffix.allCases.map {
                    let harmonized =  TurkishSuffixes.init().addTurkishSuffix(str,$0, str.first?.isUppercase ?? false)
                    return harmonized /* + " " + sentenceEnding($0)*/
                }.joined(separator: " | "),"|")
            }
    }
}
