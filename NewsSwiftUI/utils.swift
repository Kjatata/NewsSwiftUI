//
//  utils.swift
//  NewsSwiftUI
//
//  Created by User on 24.01.21.
//

import SwiftUI

func getNews(url: String, completion: @escaping ([Article]) -> ()) {
    print("Hello")
    guard let url = URL(string: url) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, error ) in
        guard let data = data else { return }
        do {
            let jsonT = try JSONDecoder().decode(NewsArticles.self, from: data)
            let v: NewsArticles = jsonT
            DispatchQueue.main.async {
                completion(v.articles)
            }
            print(v.articles)
        } catch {
            print(error)
        }
    }.resume()
}

func transformDate(dateP: String) -> String {
    let SubstrDate = String(dateP.prefix(10))
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "MMM dd, yyyy"

    let date: NSDate? = dateFormatterGet.date(from: SubstrDate) as NSDate?
    if(date !== nil) {
        return dateFormatterPrint.string(from: date! as Date)
    }
    return "no"
}

let countries = [
    Country(fullName: "United Arab Emirates", shortName: "ae"),
    Country(fullName: "Argentina", shortName: "ar"),
    Country(fullName: "Austria", shortName: "at"),
    Country(fullName: "Australia", shortName: "au"),
    Country(fullName: "Belgium", shortName: "be"),
    Country(fullName: "Bulgaria", shortName: "bg"),
    Country(fullName: "Brasil", shortName: "br"),
    Country(fullName: "Canada", shortName: "ca"),
    Country(fullName: "Schweiz", shortName: "ch"),
    Country(fullName: "China", shortName: "cn"),
    Country(fullName: "Colombia", shortName: "co"),
    Country(fullName: "Cuba", shortName: "cu"),
    Country(fullName: "Czech Republic", shortName: "cz"),
    Country(fullName: "Germany", shortName: "de"),
    Country(fullName: "Egypt", shortName: "eg"),
    Country(fullName: "France", shortName: "fr"),
    Country(fullName: "United Kingdom", shortName: "gb"),
    Country(fullName: "Greece", shortName: "gr"),
    Country(fullName: "Hong Kong", shortName: "hk"),
    Country(fullName: "Hungary", shortName: "hu"),
    Country(fullName: "Indonesia", shortName: "id"),
    Country(fullName: "Ireland", shortName: "ie"),
    Country(fullName: "Israel", shortName: "il"),
    Country(fullName: "India", shortName: "in"),
    Country(fullName: "Italy", shortName: "it"),
    Country(fullName: "Japan", shortName: "jp"),
    Country(fullName: "South Korea", shortName: "kr"),
    Country(fullName: "Lithuania", shortName: "lt"),
    Country(fullName: "Latvia", shortName: "lv"),
    Country(fullName: "Morocco", shortName: "ma"),
    Country(fullName: "Mexico", shortName: "mx"),
    Country(fullName: "Malaysia", shortName: "my"),
    Country(fullName: "Nigeria", shortName: "ng"),
    Country(fullName: "Netherlands", shortName: "nl"),
    Country(fullName: "Norway", shortName: "no"),
    Country(fullName: "New Zealand", shortName: "nz"),
    Country(fullName: "Philippines", shortName: "ph"),
    Country(fullName: "Poland", shortName: "pl"),
    Country(fullName: "Portugal", shortName: "pt"),
    Country(fullName: "Romania", shortName: "ro"),
    Country(fullName: "Serbia", shortName: "rs"),
    Country(fullName: "Russia", shortName: "ru"),
    Country(fullName: "Saudi Arabia", shortName: "sa"),
    Country(fullName: "Sweden", shortName: "se"),
    Country(fullName: "Singapore", shortName: "sg"),
    Country(fullName: "Slovenia", shortName: "si"),
    Country(fullName: "Slovakia", shortName: "sk"),
    Country(fullName: "Thailand", shortName: "th"),
    Country(fullName: "Turkey", shortName: "tr"),
    Country(fullName: "Taiwan", shortName: "tw"),
    Country(fullName: "Ukraine", shortName: "ua"),
    Country(fullName: "United States", shortName: "us"),
    Country(fullName: "Venezuela", shortName: "ve"),
    Country(fullName: "South Africa", shortName: "za")
]

let sources = [
    Source(id: Optional("abc-news"), name: Optional("ABC News")),
    Source(id: Optional("abc-news-au"), name: Optional("ABC News (AU)")),
    Source(id: Optional("aftenposten"), name: Optional("Aftenposten")),
    Source(id: Optional("al-jazeera-english"), name: Optional("Al Jazeera English")),
    Source(id: Optional("ansa"), name: Optional("ANSA.it")),
    Source(id: Optional("argaam"), name: Optional("Argaam")),
    Source(id: Optional("ars-technica"), name: Optional("Ars Technica")),
    Source(id: Optional("ary-news"), name: Optional("Ary News")),
    Source(id: Optional("associated-press"), name: Optional("Associated Press")),
    Source(id: Optional("australian-financial-review"), name: Optional("Australian Financial Review")),
    Source(id: Optional("axios"), name: Optional("Axios")),
    Source(id: Optional("bbc-news"), name: Optional("BBC News")),
    Source(id: Optional("bbc-sport"), name: Optional("BBC Sport")),
    Source(id: Optional("bild"), name: Optional("Bild")),
    Source(id: Optional("blasting-news-br"), name: Optional("Blasting News (BR)")),
    Source(id: Optional("bleacher-report"), name: Optional("Bleacher Report")),
    Source(id: Optional("bloomberg"), name: Optional("Bloomberg")),
    Source(id: Optional("breitbart-news"), name: Optional("Breitbart News")),
    Source(id: Optional("business-insider"), name: Optional("Business Insider")),
    Source(id: Optional("business-insider-uk"), name: Optional("Business Insider (UK)")),
    Source(id: Optional("buzzfeed"), name: Optional("Buzzfeed")),
    Source(id: Optional("cbc-news"), name: Optional("CBC News")),
    Source(id: Optional("cbs-news"), name: Optional("CBS News")),
    Source(id: Optional("cnn"), name: Optional("CNN")),
    Source(id: Optional("cnn-es"), name: Optional("CNN Spanish")),
    Source(id: Optional("crypto-coins-news"), name: Optional("Crypto Coins News")),
    Source(id: Optional("der-tagesspiegel"), name: Optional("Der Tagesspiegel")),
    Source(id: Optional("die-zeit"), name: Optional("Die Zeit")),
    Source(id: Optional("el-mundo"), name: Optional("El Mundo")),
    Source(id: Optional("engadget"), name: Optional("Engadget")),
    Source(id: Optional("entertainment-weekly"), name: Optional("Entertainment Weekly")),
    Source(id: Optional("espn"), name: Optional("ESPN")),
    Source(id: Optional("espn-cric-info"), name: Optional("ESPN Cric Info")),
    Source(id: Optional("financial-post"), name: Optional("Financial Post")),
    Source(id: Optional("focus"), name: Optional("Focus")),
    Source(id: Optional("football-italia"), name: Optional("Football Italia")),
    Source(id: Optional("fortune"), name: Optional("Fortune")),
    Source(id: Optional("four-four-two"), name: Optional("FourFourTwo")),
    Source(id: Optional("fox-news"), name: Optional("Fox News")),
    Source(id: Optional("fox-sports"), name: Optional("Fox Sports")),
    Source(id: Optional("globo"), name: Optional("Globo")),
    Source(id: Optional("google-news"), name: Optional("Google News")),
    Source(id: Optional("google-news-ar"), name: Optional("Google News (Argentina)")),
    Source(id: Optional("google-news-au"), name: Optional("Google News (Australia)")),
    Source(id: Optional("google-news-br"), name: Optional("Google News (Brasil)")),
    Source(id: Optional("google-news-ca"), name: Optional("Google News (Canada)")),
    Source(id: Optional("google-news-fr"), name: Optional("Google News (France)")),
    Source(id: Optional("google-news-in"), name: Optional("Google News (India)")),
    Source(id: Optional("google-news-is"), name: Optional("Google News (Israel)")),
    Source(id: Optional("google-news-it"), name: Optional("Google News (Italy)")),
    Source(id: Optional("google-news-ru"), name: Optional("Google News (Russia)")),
    Source(id: Optional("google-news-sa"), name: Optional("Google News (Saudi Arabia)")),
    Source(id: Optional("google-news-uk"), name: Optional("Google News (UK)")),
    Source(id: Optional("goteborgs-posten"), name: Optional("Göteborgs-Posten")),
    Source(id: Optional("gruenderszene"), name: Optional("Gruenderszene")),
    Source(id: Optional("hacker-news"), name: Optional("Hacker News")),
    Source(id: Optional("handelsblatt"), name: Optional("Handelsblatt")),
    Source(id: Optional("ign"), name: Optional("IGN")),
    Source(id: Optional("il-sole-24-ore"), name: Optional("Il Sole 24 Ore")),
    Source(id: Optional("independent"), name: Optional("Independent")),
    Source(id: Optional("infobae"), name: Optional("Infobae")),
    Source(id: Optional("info-money"), name: Optional("InfoMoney")),
    Source(id: Optional("la-gaceta"), name: Optional("La Gaceta")),
    Source(id: Optional("la-nacion"), name: Optional("La Nacion")),
    Source(id: Optional("la-repubblica"), name: Optional("La Repubblica")),
    Source(id: Optional("le-monde"), name: Optional("Le Monde")),
    Source(id: Optional("lenta"), name: Optional("Lenta")),
    Source(id: Optional("lequipe"), name: Optional("L\'equipe")),
    Source(id: Optional("les-echos"), name: Optional("Les Echos")),
    Source(id: Optional("liberation"), name: Optional("Libération")),
    Source(id: Optional("marca"), name: Optional("Marca")),
    Source(id: Optional("mashable"), name: Optional("Mashable")),
    Source(id: Optional("medical-news-today"), name: Optional("Medical News Today")),
    Source(id: Optional("msnbc"), name: Optional("MSNBC")),
    Source(id: Optional("mtv-news"), name: Optional("MTV News")),
    Source(id: Optional("mtv-news-uk"), name: Optional("MTV News (UK)")),
    Source(id: Optional("national-geographic"), name: Optional("National Geographic")),
    Source(id: Optional("national-review"), name: Optional("National Review")),
    Source(id: Optional("nbc-news"), name: Optional("NBC News")),
    Source(id: Optional("news24"), name: Optional("News24")),
    Source(id: Optional("new-scientist"), name: Optional("New Scientist")),
    Source(id: Optional("news-com-au"), name: Optional("News.com.au")),
    Source(id: Optional("newsweek"), name: Optional("Newsweek")),
    Source(id: Optional("new-york-magazine"), name: Optional("New York Magazine")),
    Source(id: Optional("next-big-future"), name: Optional("Next Big Future")),
    Source(id: Optional("nfl-news"), name: Optional("NFL News")),
    Source(id: Optional("nhl-news"), name: Optional("NHL News")),
    Source(id: Optional("nrk"), name: Optional("NRK")),
    Source(id: Optional("politico"), name: Optional("Politico")),
    Source(id: Optional("polygon"), name: Optional("Polygon")),
    Source(id: Optional("rbc"), name: Optional("RBC")),
    Source(id: Optional("recode"), name: Optional("Recode")),
    Source(id: Optional("reddit-r-all"), name: Optional("Reddit /r/all")),
    Source(id: Optional("reuters"), name: Optional("Reuters")),
    Source(id: Optional("rt"), name: Optional("RT")),
    Source(id: Optional("rte"), name: Optional("RTE")),
    Source(id: Optional("rtl-nieuws"), name: Optional("RTL Nieuws")),
    Source(id: Optional("sabq"), name: Optional("SABQ")),
    Source(id: Optional("spiegel-online"), name: Optional("Spiegel Online")),
    Source(id: Optional("svenska-dagbladet"), name: Optional("Svenska Dagbladet")),
    Source(id: Optional("t3n"), name: Optional("T3n")),
    Source(id: Optional("talksport"), name: Optional("TalkSport")),
    Source(id: Optional("techcrunch"), name: Optional("TechCrunch")),
    Source(id: Optional("techcrunch-cn"), name: Optional("TechCrunch (CN)")),
    Source(id: Optional("techradar"), name: Optional("TechRadar")),
    Source(id: Optional("the-american-conservative"), name: Optional("The American Conservative")),
    Source(id: Optional("the-globe-and-mail"), name: Optional("The Globe And Mail")),
    Source(id: Optional("the-hill"), name: Optional("The Hill")),
    Source(id: Optional("the-hindu"), name: Optional("The Hindu")),
    Source(id: Optional("the-huffington-post"), name: Optional("The Huffington Post")),
    Source(id: Optional("the-irish-times"), name: Optional("The Irish Times")),
    Source(id: Optional("the-jerusalem-post"), name: Optional("The Jerusalem Post")),
    Source(id: Optional("the-lad-bible"), name: Optional("The Lad Bible")),
    Source(id: Optional("the-next-web"), name: Optional("The Next Web")),
    Source(id: Optional("the-sport-bible"), name: Optional("The Sport Bible")),
    Source(id: Optional("the-times-of-india"), name: Optional("The Times of India")),
    Source(id: Optional("the-verge"), name: Optional("The Verge")),
    Source(id: Optional("the-wall-street-journal"), name: Optional("The Wall Street Journal")),
    Source(id: Optional("the-washington-post"), name: Optional("The Washington Post")),
    Source(id: Optional("the-washington-times"), name: Optional("The Washington Times")),
    Source(id: Optional("time"), name: Optional("Time")),
    Source(id: Optional("usa-today"), name: Optional("USA Today")),
    Source(id: Optional("vice-news"), name: Optional("Vice News")),
    Source(id: Optional("wired"), name: Optional("Wired")),
    Source(id: Optional("wired-de"), name: Optional("Wired.de")),
    Source(id: Optional("wirtschafts-woche"), name: Optional("Wirtschafts Woche")),
    Source(id: Optional("xinhua-net"), name: Optional("Xinhua Net")),
    Source(id: Optional("ynet"), name: Optional("Ynet"))
]

let categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
]
