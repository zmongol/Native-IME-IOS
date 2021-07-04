//
//  SuggestionFile.swift
//  ZMongolIMEIOS
//
//  Created by Natalia Hudzeliak on 09.04.2021.
//

import Foundation

let DAGBR_COUNT = 52

class Alhorith {
var qArray = Array<String>()
var vArray = Array<String>()


var m_tein1 = Array<String>()
var m_tein2 = Array<String>()
var m_tein3 = Array<String>()
var m_tein4 = Array<String>()
var m_tein5 = Array<String>()
var m_tein6 = Array<String>()


var teinIlgal: [String: [String]] = [:]

var databases: [String: String] = [:]

var wordMap: [String: [String]] = [:]

var m_mapNumDagvr: [Int: [String]] = [:]

    var result = "-1"
    var resultFirst = ""
    var resultMid = ""
    var resultLast = ""
    
    var teinIlgalCands = [
        "ᡭᡧ",
        "ᡬᡬᡧ",
        "ᡳ",
        "ᡭᡳ",
        "ᡳᡪᢝ",
        "ᡬᡬᡪᢝ",
        "ᡳᡪᡧ",
        "ᡬᡬᡪᡧ",
        "ᢘᡳ",
        "ᢙᡳ",
        "ᡬᡫ",
        "ᡫ",
        "ᡥᢚᡧ",
        "ᢘᡪᡫ",
        "ᡭᡭᡧ",
        "ᢘᡪᡱᡱᡪᡧ",
        "ᢘᡪᢊᡪᡧ",
        "ᢙᡪᡱᡱᡪᡧ",
        "ᢙᡪᢊᡪᡧ",
    ]

let dagbrEx: [[String]] = [
        [ "ᡬᡬᡧ ", "1", "0", "0", "0", "0" ],//yin
        [ "ᡭᡧ ", "0", "1", "0", "0", "0" ],   //vn
        [ "ᡭᡧ ", "0", "1", "0", "0", "0" ],   //un
        [ "ᡳ ", "0", "0", "0", "1", "0" ],    //v
        [ "ᡳ ", "0", "0", "0", "1", "0" ],    //u
        [ "ᡳᡪᡧ ", "1", "0", "0", "0", "0" ],  //ban
        [ "ᡳᡪᡧ ", "1", "0", "0", "0", "0" ],  //ben
        [ "ᡬᡬᡪᡧ ", "0", "1", "0", "1", "0" ],  //iyan
        [ "ᡬᡬᡪᡧ ", "0", "1", "0", "1", "0" ],  //iyen
        [ "ᡳᡪᢝ ", "1", "0", "0", "0", "0" ],   //bar
        [ "ᡳᡪᢝ ", "1", "0", "0", "0", "0" ],   //ber
        [ "ᡬᡬᡪᢝ ", "0", "1", "0", "1", "0" ],  //iyar
        [ "ᡬᡬᡪᢝ ", "0", "1", "0", "1", "0" ],  //iyer
        [ "ᡬᡫ ", "1", "0", "0", "0", "0" ],    //yi
        [ "ᡫ ", "0", "1", "0", "1", "0" ],     //i
        [ "ᢘᡳ ", "0", "0", "0", "0", "1" ],    //tv
        [ "ᢘᡳ ", "0", "0", "0", "0", "1" ],    //tu
        [ "ᢙᡳ ", "1", "0", "1", "1", "0" ],    //dv
        [ "ᢙᡳ ", "1", "0", "1", "1", "0" ],    //du
        [ "ᢘᡭᢝ ", "0", "0", "0", "0", "1" ],   //tvr
        [ "ᢘᡭᢝ ", "0", "0", "0", "0", "1" ],   //tur
        [ "ᢙᡭᢝ ", "1", "0", "1", "1", "0" ],   //dvr
        [ "ᢙᡭᢝ ", "1", "0", "1", "1", "0" ],   //dur
        [ "ᢘᡪᢊᡬᡦ ", "0", "0", "0", "0", "1" ],  //tahi
        [ "ᢘᡪᢊᡬᡦ ", "0", "0", "0", "0", "1" ],  //tehi
        [ "ᢙᡪᢊᡬᡦ ", "1", "0", "1", "1", "0" ],  //dahi
        [ "ᢙᡪᢊᡬᡦ ", "1", "0", "1", "1", "0" ],  //dehi
        [ "ᢘᡭᡱᡫ ", "0", "0", "0", "0", "1" ],  //tvni
        [ "ᢘᡭᡱᡫ ", "0", "0", "0", "0", "1" ],  //tuni
        [ "ᢙᡭᡱᡫ ", "0", "0", "0", "0", "1" ],  //dvni
        [ "ᢙᡭᡱᡫ ", "0", "0", "0", "0", "1" ],  //duni
        [ "ᢘᡪᡫ ", "1", "1", "0", "1", "0" ],   //tai
        [ "ᢘᡪᡫ ", "1", "1", "0", "1", "0" ],   //tei
        [ "ᢏᡭᢉᡨ ", "1", "1", "0", "1", "0" ], //lvga
        [ "ᢏᡭᢊᡪᡨ ", "1", "1", "0", "1", "0" ],  //luge
        [ "ᡥᢚᡧ ", "1", "1", "0", "1", "0" ],   //aca
        [ "ᡥᢚᡧ ", "1", "1", "0", "1", "0" ],   //ece
        [ "ᢙᡪᡱᡱᡪᡧ ", "1", "0", "1", "1", "0" ],  //dagan
        [ "ᢙᡪᢊᡪᡧ ", "1", "0", "1", "1", "0" ],  //degen
        [ "ᢘᡪᡱᡱᡪᡧ ", "0", "0", "0", "0", "1" ], //tagan
        [ "ᢘᡪᢊᡪᡧ ", "0", "0", "0", "0", "1" ],  //tegen
        [ "ᡯᡭᡱᡱᡭᡭᡧ ", "1", "0", "0", "1", "0" ],  //nvgvd
        [ "ᡯᡭᢋᡭᡭᡧ ", "1", "0", "0", "1", "0" ], //nugud
        [ "ᡭᡭᡧ ", "0", "1", "0", "0", "0" ],     //vd
        [ "ᡭᡭᡧ ", "0", "1", "0", "0", "0" ],     //ud
        [ "ᡭᡳ ", "1", "0", "0", "0", "0" ],     //vv
        [ "ᡭᡳ ", "1", "0", "0", "0", "0" ],     //uu
        [ "ᡯᡪᢝ ", "1", "1", "0", "1", "0" ],    //nar
        [ "ᡯᡪᢝ ", "1", "1", "0", "1", "0" ],    //ner
        [ "ᢌᡬᡱᡫ ", "1", "1", "0", "1", "0" ],   //mini
        [ "ᢚᡬᡱᡫ ", "1", "1", "0", "1", "0" ],   //cini
        [ "ᡯᡫ ", "1", "1", "0", "1", "0" ]//,      //ni
]

let aArr = [ "ᡥᡧ", "", "", "ᡥᡪ", "ᡪᡪ", "", "ᡪ", "ᡪᡪ", "", "ᡧ", "ᡪᡨ", "ᡨ" ]
let eArr = [ "ᡥᡨ", "", "", "ᡥ", "ᡪᡪ", "", "ᡪ", "ᡪᡪ", "", "ᡪᡨ", "ᡧ", "ᡨ" ]
let iArr = [ "ᡫ", "", "", "ᡥᡬ", "", "", "ᡬ", "ᡬᡬ", "ᡪᡬ", "ᡫ", "ᡬᡦ", "" ]
let oArr = [ "ᡥᡭ", "ᡥᡭ", "", "ᡥᡭ", "", "", "ᡭ", "ᡪᡭ", "", "ᡳ", "ᡭ", "" ]
let uArr = [ "ᡥᡭᡦ", "", "", "ᡥᡭᡬ", "", "", "ᡭ", "ᡭᡬ", "ᡪᡭᡬ", "ᡳ", "ᡭ", "ᡭᡦ" ]
let nArr = [ "ᡯ", "", "", "ᡯ", "", "", "ᡪ", "ᡱ", "", "ᡧ", "ᡰ", "" ]
let bArr = [ "ᡳ", "", "", "ᡳ", "ᡴ", "", "ᡳ", "ᡴ", "", "ᡲ", "", "" ]
let pArr = [ "ᡶ", "", "", "ᡶ", "ᡷ", "", "ᡶ", "ᡷ", "", "ᡵ", "", "" ]
let hArr = [ "ᠬ", "", "", "ᡸ", "ᢊ", "ᢋ", "ᡪᡪ", "ᢊ", "ᢋ", "ᢇ", "ᢇ", "" ]
let gArr = [ "ᢈ", "", "ᡪᡪ", "ᢈ", "ᢊ", "ᢋ", "ᡱᡱ", "ᢊ", "ᢋ", "ᢇ", "ᢉ", "ᡬᡨ" ]
let mArr = [ "ᢌ", "", "", "ᢌ", "", "", "ᢎ", "", "", "ᢍ", "", "" ]
let lArr = [ "ᢏ", "", "", "ᢏ", "", "", "ᢑ", "", "", "ᢐ", "", "" ]
let sArr = [ "ᢔ", "", "", "ᢔ", "", "", "ᢔ", "", "", "ᢓ", "", "" ]
let xArr = [ "ᢗ", "", "", "ᢗ", "", "", "ᢗ", "", "", "ᢖ", "", "" ]
let tArr = [ "ᢘ", "", "", "ᢘ", "", "", "ᢙ", "ᢘ", "", "ᢘᡦ", "", "" ]
let dArr = [ "ᢙ", "", "", "ᢘ", "", "", "ᡭᡪ", "ᢙ", "", "ᡭᡧ", "ᢙᡦ", "" ]
let cArr = [ "ᢚ", "", "", "ᢚ", "", "", "ᢚ", "", "", "ᢚᡦ", "", "" ]
let jArr = [ "ᡬ", "", "", "ᡬ", "", "", "ᢛ", "", "", "ᢛᡦ", "", "" ]
let yArr = [ "ᢜ", "", "", "ᢜ", "", "", "ᢜ", "", "", "ᡫ", "", "" ]
let rArr = [ "ᢞ", "", "", "ᢞ", "", "", "ᢞ", "", "", "ᢝ", "", "" ]
let wArr = [ "ᢟ", "", "", "ᢟ", "", "", "ᢟ", "", "", "ᢟᡦ", "", "" ]
let fArr = [ "ᢡ", "", "", "ᢡ", "ᢢ", "", "ᢡ", "ᢢ", "", "ᢠ", "", "" ]
let kArr = [ "ᢤ", "", "", "ᢤ", "ᢥ", "", "ᢤ", "ᢥ", "", "ᢣ", "", "" ]
let qArr = [ "ᢚ", "", "", "ᢚ", "", "", "ᢚ", "", "", "ᢚᡦ", "", "" ]
let zArr = [ "ᢧ", "", "", "ᢧ", "", "", "ᢧ", "", "", "ᢧᡦ", "", "" ]
let vArr = [ "ᡥᡭ", "ᡥᡭ", "", "ᡥᡭ", "", "", "ᡭ", "ᡪᡭ", "", "ᡳ", "ᡭ", "" ]

let AArr = [ "ᡥᡧ", "", "", "ᡪᡪ", "", "", "ᡪᡪ", "", "", "ᡧ", "", "" ]
let EArr = [ "ᢟ", "", "", "ᢟ", "", "", "ᢟ", "", "", "ᢟᡦ", "", "" ]
let IArr = [ "ᡫ", "", "", "ᡥᡬ", "", "", "ᡬ", "ᡬᡬ", "ᡪᡬ", "ᡫ", "ᡬᡦ", "" ]
let OArr = [ "ᡥᡭ", "ᡥᡭ", "", "ᡥᡭ", "", "", "ᡭ", "ᡪᡭ", "", "ᡭ", "ᡭ", "" ]//2021.3.13
let UArr = [ "ᡥᡭᡦ", "", "", "ᡥᡭᡬ", "", "", "ᡭᡬ", "", "", "ᡭᡦ", "", "" ]//2021.3.9
let NArr = [ "ᡯ", "", "", "ᡯ", "", "", "ᡱ", "ᡪ", "", "ᡧ", "ᡰ", "" ]//2021.3.9
let BArr = [ "ᡳ", "", "", "ᡳ", "ᡴ", "", "ᡳ", "ᡴ", "", "ᡲ", "", "" ]
let PArr = [ "ᡶ", "", "", "ᡶ", "ᡷ", "", "ᡶ", "ᡷ", "", "ᡵ", "", "" ]
let HArr = [ "ᠬ", "", "", "ᡸ", "ᢊ", "ᢋ", "ᡪᡪ", "ᢊ", "ᢋ", "ᢇ", "ᢇ", "" ]
let GArr = [ "ᢈ", "", "ᡪᡪ", "ᢈ", "ᢊ", "ᢋ", "ᡱᡱ", "ᢊ", "ᢋ", "ᢇ", "ᢉ", "ᡬᡨ" ]
let MArr = [ "ᢌ", "", "", "ᢌ", "", "", "ᢎ", "", "", "ᢍ", "", "" ]
let LArr = [ "ᢏᢨ", "", "", "ᢏᢨ", "", "", "ᢑᢨ", "", "", "ᢑᢨᡦ", "", "" ]
let SArr = [ "ᢔ", "", "", "ᢔ", "", "", "ᢔ", "", "", "ᢓ", "", "" ]
let XArr = [ "ᢗ", "", "", "ᢗ", "", "", "ᢗ", "", "", "ᢖ", "", "" ]
let TArr = [ "ᢙ", "", "", "ᢙ", "", "", "ᢙ", "ᢘ", "", "ᢙᡦ", "", "" ]//2021.3.9
let DArr = [ "ᢘ", "", "", "ᢙ", "", "", "ᢘ", "", "", "ᢘᡦ", "", "" ]
let CArr = [ "ᢦ", "", "", "ᢦ", "", "", "ᢦ", "", "", "ᢦᡦ", "", "" ]
let JArr = [ "ᡬ", "", "", "ᡬ", "", "", "ᢛ", "", "", "ᢛᡦ", "", "" ]
let YArr = [ "ᢜ", "", "", "ᢜ", "", "", "ᢜ", "", "", "ᡫ", "", "" ]
let RArr = [ "ᢞ", "", "", "ᢞ", "", "", "ᢞ", "", "", "ᢝ", "", "" ]
let WArr = [ "ᢟ", "", "", "ᢟ", "", "", "ᢟ", "", "", "ᢟᡦ", "", "" ]
let FArr = [ "ᢡ", "", "", "ᢡ", "ᢢ", "", "ᢡ", "ᢢ", "", "ᢠ", "", "" ]
let KArr = [ "ᢤ", "", "", "ᢤ", "ᢥ", "", "ᢤ", "ᢥ", "", "ᢣ", "", "" ]
let QArr = [ "ᢦ", "", "", "ᢦ", "", "", "", "", "", "ᢦᡦ", "", "" ]
let ZArr = [ "ᢨ", "", "", "ᢨ", "", "", "ᢨ", "", "", "ᢨᡦ", "", "" ]
let VArr = ["ᡭ", "ᡭ", "", "ᡭ", "", "", "ᡭ", "ᡪᡭ", "", "ᡳ", "ᡭ", "" ]

init() {
    qArray.append("ᡳᡪᢝ")
    qArray.append("ᡳᡪᢝ")
    qArray.append("ᡬᡬᡪᢝ")
    qArray.append("ᢘᡪᡫ")
    qArray.append("ᡳᡪᡧ")
    qArray.append("ᡬᡬᡪᡧ")
    qArray.append("ᡭᡭᡧ")
    qArray.append("ᢘᡪᡱᡱᡪᡧ")
    qArray.append("ᢘᡪᢊᡪᡧ")
    qArray.append("ᢙᡪᡱᡱᡪᡧ")
    qArray.append("ᢙᡪᢊᡪᡧ")

    vArray.append("ᡬᡬᡧ")
    vArray.append("ᡭᡧ")
    vArray.append("ᡳ")
    vArray.append("ᢘᡳ")
    vArray.append("ᢙᡳ")
    vArray.append("ᡬᡫ")
    vArray.append("ᡫ")
    vArray.append("ᡥᢚᡧ")

    teinIlgal["q"] = qArray
    teinIlgal["v"] = vArray

    databases["aav"] = "ᡥᡪᡴᡭ"
    databases["america"] = "ᡥᡪᢎᢟᢞᡬᢤᡪᡨ"
    databases["ch"] = "ᡭᡭ"
    databases["chi"] = "ᡭᡭᡫ"
    databases["cihola"] = "ᢚᡬᡪᡪᡭᢑᡧ"
    databases["cino"] = "ᢚᡬᡱᡳᡨ"
    databases["do"] = "ᢙᡳ"
    databases["du"] = "ᢙᡳ"
    databases["eej"] = "ᡥᢛᡫ"
    databases["eyer"] = "ᡬᡬᡪᢝ"
    databases["europe"] = "ᡥᢟᡭᡬᢞᡭᡶᡪᡨ"
    databases["eyen"] = "ᡬᡬᡪᡧ"
    databases["gowa"] = "ᢈᡭᡳᡨ"
    databases["hebei"] = "ᡥᢨᢟᡳᢟᡫ"
    databases["in"] = "ᡬᡬᡧ"
    databases["kino"] = "ᢤᡬᡱᡭ"
    databases["kod"] = "ᢥᡭᢙᡦ"
    //            databases.insert(make_pair(L"lasa", L"ᢏᢨᡪᢔᡧ"));
    databases["mongol"] = "ᢌᡭᡪᢊᡱᡱᡭᢐ"
    databases["no"] = "ᡳ"
    databases["on"] = "ᡭᡧ"
    databases["oo"] = "ᡭᡳ"
    databases["radio"] = "ᢞᡪᢙᡬᡭ"
    databases["sh"] = "ᢗ"
    databases["shi"] = "ᢗᡫ"
    databases["su"] = "ᢔᡭᡦ"
    databases["tatar"] = "ᢘᡪᢘᡪᢝ"
    databases["yunikod"] = "ᢜᡭᡬᡱᡬᢥᡭᢙᡦ"
    databases["zh"] = "ᢨ"
    databases["zhi"] = "ᢨᡫ"
    databases["english"] = "ᡥᡪᡪᢊᢊᢑᡫ"
    databases["england"] = "ᡥᡪᡪᢊᢊᢑᡫ"
    databases["degen"] = "ᢙᡪᢊᡪᡧ"
    databases["deng"] = "ᢙᢟᡪᡬᡨ"
    databases["dan"] = "ᢙᡪᡧ"
    databases["den"] = "ᢙᡪᡧ"
    databases["din"] = "ᢙᡬᡧ"
    databases["o"] = "ᡥᡭ"
    databases["u"] = "ᡥᡭᡬ"
    databases["i"] = "ᡥᡫ"
    databases["naima"] = "ᡯᡪᡬᢎᡧ"
    databases["dung"] = "ᢙᡭᡬᡪᡬᡨ"
    databases["don"] = "ᢙᡭᡧ"
    databases["dungsigor"] = "ᢙᡭᡬᡪᢊᢔᡬᡱᡱᡭᢝ"
    databases["agola"] = "ᡥᡪᡱᡱᡭᢑᡧ"
    databases["sig"] = "ᢔᡬᢇ"
    databases["tig"] = "ᢘᡬᢇ"
    databases["tere"] = "ᢘᡪᢞᡧ"

    
    wordMap["a"] = aArr
    wordMap["e"] = eArr
    wordMap["i"] = iArr
    wordMap["o"] = oArr
    wordMap["u"] = uArr
    wordMap["n"] = nArr
    wordMap["b"] = bArr
    wordMap["p"] = pArr
    wordMap["h"] = hArr
    wordMap["g"] = gArr
    wordMap["m"] = mArr
    wordMap["l"] = lArr
    wordMap["s"] = sArr
    wordMap["x"] = xArr
    wordMap["t"] = tArr
    wordMap["d"] = dArr
    wordMap["c"] = cArr
    wordMap["j"] = jArr
    wordMap["y"] = yArr
    wordMap["r"] = rArr
    wordMap["w"] = wArr
    wordMap["f"] = fArr
    wordMap["k"] = kArr
    wordMap["q"] = qArr
    wordMap["z"] = zArr
    wordMap["v"] = vArr

    wordMap["A"] = AArr
    wordMap["E"] = eArr
    wordMap["I"] = iArr
    wordMap["O"] = OArr //2021.3.13
    wordMap["U"] = UArr
    wordMap["N"] = nArr
    wordMap["B"] = bArr
    wordMap["P"] = pArr
    wordMap["H"] = hArr
    wordMap["G"] = gArr
    wordMap["M"] = mArr
    wordMap["L"] = LArr
    wordMap["S"] = sArr
    wordMap["X"] = xArr
    wordMap["T"] = TArr
    wordMap["D"] = DArr
    wordMap["C"] = CArr
    wordMap["J"] = jArr
    wordMap["Y"] = yArr
    wordMap["R"] = rArr
    wordMap["W"] = wArr
    wordMap["F"] = fArr
    wordMap["K"] = kArr
    wordMap["Q"] = qArr
    wordMap["Z"] = ZArr
    wordMap["V"] = vArr

    m_tein1.append(dagbrEx[0][0]);
    m_tein1.append(dagbrEx[13][0]);
    m_tein1.append(dagbrEx[9][0]);
    m_tein1.append(dagbrEx[5][0]);
    m_tein1.append(dagbrEx[17][0]);
    m_tein1.append(dagbrEx[21][0]);
    m_tein1.append(dagbrEx[35][0]);
    m_tein1.append(dagbrEx[31][0]);
    m_tein1.append(dagbrEx[37][0]);
    m_tein1.append(dagbrEx[33][0]);

    m_tein2.append(dagbrEx[0][0]);
    m_tein2.append(dagbrEx[13][0]);
    m_tein2.append(dagbrEx[9][0]);
    m_tein2.append(dagbrEx[7][0]);
    m_tein2.append(dagbrEx[17][0]);
    m_tein2.append(dagbrEx[21][0]);
    m_tein2.append(dagbrEx[35][0]);
    m_tein2.append(dagbrEx[31][0]);
    m_tein2.append(dagbrEx[38][0]);
    m_tein2.append(dagbrEx[34][0]);

    m_tein3.append(dagbrEx[1][0]);
    m_tein3.append(dagbrEx[14][0]);
    m_tein3.append(dagbrEx[11][0]);
    m_tein3.append(dagbrEx[35][0]);
    m_tein3.append(dagbrEx[31][0]);

    m_tein4.append(dagbrEx[4][0]);
    m_tein4.append(dagbrEx[17][0]);
    m_tein4.append(dagbrEx[21][0]);
    m_tein4.append(dagbrEx[35][0]);
    m_tein4.append(dagbrEx[31][0]);

    m_tein5.append(dagbrEx[1][0]);
    m_tein5.append(dagbrEx[14][0]);
    m_tein5.append(dagbrEx[11][0]);
    m_tein5.append(dagbrEx[17][0]);
    m_tein5.append(dagbrEx[21][0]);
    m_tein5.append(dagbrEx[35][0]);
    m_tein5.append(dagbrEx[31][0]);

    m_tein6.append(dagbrEx[1][0]);
    m_tein6.append(dagbrEx[14][0]);
    m_tein6.append(dagbrEx[11][0]);
    m_tein6.append(dagbrEx[15][0]);
    m_tein6.append(dagbrEx[19][0]);
    m_tein6.append(dagbrEx[35][0]);
    m_tein6.append(dagbrEx[31][0]);
}

//2021.3.13
func Excute(latin: String) -> [String] {
    var result: [String] = []
    let wordLength = latin.count
    resultFirst = "";
    resultMid = "";
    var resultLast: [String] = []
    
    if ( wordLength == 1 && wordMap[latin] != nil) {
        let currentAry = wordMap[latin];
        resultFirst = currentAry?[0] ?? ""
    } else if (wordLength == 2) {
        FirstAndLast(str: latin, resultFirst: &resultFirst, resultLast: &resultLast);
    }
    else {
        FirstAndLast(str: latin, resultFirst: &resultFirst, resultLast: &resultLast);
        Middle(str: latin, resultMid: &resultMid);
    }

    if (resultLast.count > 0) {
        for i in 0 ..< resultLast.count {
            result.append(resultFirst + resultMid + resultLast[i]);
        }
    } else {
        result.append(resultFirst)
    }
    
    return result
}

//2021.3.9
func ExcuteEx(latin: String) -> [String] {
    var result: [String] = []
    let resWords: [String] = Excute(latin: latin)
    for i in 0 ..< resWords.count {
        if resWords[i].count > 0 {
            result.append(resWords[i]);

            //ne me le ye re wa
            var newWord: [String] = []
            _ = GetEndsClass(word: resWords[i], newWords: &newWord)
            if (newWord.count > 0) {
                result.append(contentsOf: newWord)
            }
        }
    }

    return result
}

func FirstAndLast(str: String, resultFirst: inout String, resultLast: inout [String]) {
    //solving first letter
    
    let index = str.index(str.startIndex, offsetBy: 1)
    let substring = String(str[..<index])
    
    let firstStr = str[0 ..< 1]
    let secondStr = str[1 ..< 2]
    let lastStr = str[str.length - 1 ..< str.length]
    _ = str[str.length - 2 ..< str.length - 1]

    if (wordMap[str[0 ..< 1]] != nil) {
    }
    
    resultFirst = wordMap[str[0 ..< 1]]?[3] ?? ""
    resultFirst = wordMap[firstStr]?[3] ?? ""
    var x = firstStr
    
    //2020.3.13
    // solving b,p,k,f  before o,u
    if (x == "b" || x == "p" || x == "k" || x == "f") {
        let y = secondStr
        if (y == "o" || y == "u" || y == "v" || y == "U") {
            resultFirst = wordMap[x]?[4] ?? ""
        }
    }
    // solving h,g before e,i,w
    if (x == "h" || x == "g") {
        let y = secondStr
        if (y == "e" || y == "i" || y == "w") {
            resultFirst = wordMap[x]?[4] ?? ""
        }
    }
    //2021.3.13
    // solving h,g before u
    if (x == "h" || x == "g") {
        let y = secondStr
        if (y == "u" || y == "U") {
            resultFirst = wordMap[x]?[5] ?? ""
        }
    }

    //solving last letter;
    if (wordMap[str[str.length - 1]] != nil)
    {
        let pTemp = wordMap[str[str.length - 1]]?[9] ?? ""
        if (pTemp.count > 0)
        {
            //resultLast = pTemp;
            resultLast.append(pTemp);
        }
    }
    x = str[str.count - 2]
    // solving a after b,p,k,f    test haha  baba
    if (x == "b" || x == "p" || x == "k" || x == "f") {
        let y = lastStr
        if (y == "a") {
            //resultLast = wordMap[y][10];
            if (resultLast.count > 0)
            {
                resultLast.removeAll()
            }
            resultLast.append(wordMap[y]?[10] ?? "");
        }
    }
    // solving e after h,g
    if (x == "h" || x == "g") {
        let y = lastStr
        if (y == "e") {
            //resultLast = wordMap[y][9];
            if (resultLast.count > 0)
            {
                resultLast.removeAll()
            }
            resultLast.append(wordMap[y]?[9] ?? "");
        }
    }
    // solving i after b,p,k,f,h,g
    if (x == "b" || x == "p"
        || x == "k" || x == "f"
        || x == "h" || x == "g") {
        let y = lastStr
        if (y == "i") {
            //resultLast = wordMap[y][10];
            if (resultLast.count > 0)
            {
                resultLast.removeAll()
            }
            resultLast.append(wordMap[y]?[10] ?? "");
        }
    }
    // solving o after b,p,k,f
    if (x == "b" || x == "p"
        || x == "k" || x == "f") {
        let y = lastStr
        if (y == "o" || y == "v") {
            //resultLast = wordMap[y][10];
            if (resultLast.count > 0)
            {
                resultLast.removeAll()
            }
            resultLast.append(wordMap[y]?[10] ?? "");
        }
    }
    // solving u after b,p,k,f,h,g
    if (x == "b" || x == "p"
        || x == "k" || x == "f"
        || x == "h" || x == "g") {
        let y = lastStr
        if (y == "u") {
            //resultLast = wordMap[y][10];
            if (resultLast.count > 0)
            {
                resultLast.removeAll()
            }
            resultLast.append(wordMap[y]?[10] ?? "");
        }
    }
    // solving g after i,e,u, U
    if (x == "i" || x == "e" || x == "u" || x == "U") {
        let y = lastStr
        if (y == "g") {
            
            if (x == "i") {
                var temp = "";
                for j in 1 ..< str.count - 2 {
                    let z = str[str.length - 2 - j ..<  str.length - 2 - j]
                    if (z == "a" || z == "o" || z == "v") {
                        //resultLast = wordMap[y][9];
                        temp = wordMap[y]?[9] ?? ""
                    }
                }
                if (resultLast.count > 0)
                {
                    resultLast.removeAll()
                }
                resultLast.append(wordMap[y]?[9] ?? "")
            }
            else
            {
                //resultLast = wordMap[y][11];
                if (resultLast.count > 0)
                {
                    resultLast.removeAll()
                }
                resultLast.append(wordMap[y]?[11] ?? "")
            }
        }
    }

    // solving g after n
    if (x == "n") {
        let y = lastStr
        if (y == "g") {
            //resultLast = wordMap[y][11];
            if (resultLast.count > 0)
            {
                resultLast.removeAll()
            }
            resultLast.append(wordMap[y]?[11] ?? "")
        }
    }
    // solving a, e after n, m, l, y, r
    if (x == "n" || x == "m" || x == "l" || x == "y" || x == "r") {
        let y = lastStr
        if (y == "a" || y == "e") {
            //resultLast = wordMap[y][11];
            if (resultLast.count > 0)
            {
                resultLast.removeAll();
            }
            resultLast.append(wordMap[y]?[11] ?? "")
        }
    }
    // solving e after c, v, z, q, d
    if (x == "c" || x == "v" || x == "z" || x == "q" || x == "d") {
        let y = lastStr
        if (y == "e") {
            //resultLast = wordMap[y][10];
            if (resultLast.count > 0)
            {
                resultLast.removeAll()
            }
            resultLast.append(wordMap[y]?[10] ?? "")
        }
    }
    // solving a, after h, g
    if (x == "h" || x == "g") {
        let y = lastStr
        if (y == "a") {
            //resultLast = wordMap[y][11];
            if (resultLast.count > 0)
            {
                resultLast.removeAll()
            }
            resultLast.append(wordMap[y]?[11] ?? "")
        }
    }
    // solving a, after n, m, h, g, for isolated na, ma, ha, ga
    if (x == "n" || x == "m" || x == "h" || x == "g") {
        let y = lastStr
        if (y == "a") {
            if (2 == str.count) {
                //resultLast = wordMap[y][9];
                if (resultLast.count > 0) {
                    resultLast.removeAll()
                }
                resultLast.append(wordMap[y]?[9] ?? "")
            }
        }
    }

}

func Middle(str: String, resultMid: inout String) {

    var m = "";
    for i in 1 ..< str.count {
        let x = str[i ..< i+1]
        if (wordMap[x] != nil)
        {
            m = wordMap[x]?[6] ?? ""


            //solving g after a or o
            let yy = str[i - 1 ..< i]
            if (yy == "a" || yy == "o" || yy == "v") {
                if (x == "g") {
                    m = wordMap[x]?[2] ?? ""
                }
            }
            //solving g not after a or o
            if (yy != "a" && yy != "o" && yy != "v") {
                if (x == "g") {
                    m = wordMap[x]?[7] ?? ""
                }
            }

            //solving g before a or o
            if (x == "g") {
                let y = str[i + 1 ..< i + 2]
                if (y == "a" || y == "o" || y == "v") {
                    m = wordMap[x]?[6] ?? ""
                }
            }

            //2021.3.9
            //solving n,d before egshig    a,e,i,o,u, U, A, E,
            if (x == "n" || x == "d") {
                let y = str[i + 1 ..< i + 2]
                if (y == "a" || y == "e" || y == "i" || y == "o" || y == "v" || y == "u" || y == "A" || y == "E" || y == "U") {
                    m = wordMap[x]?[7] ?? ""
                }
            }

            //2021.3.9
            //solving N,T before egshig    a,e,i,o,u, U, A, E,
            if (x == "N" || x == "T" || x == "D") {
                m = wordMap[x]?[7] ?? ""
            }

            //2021.3.13
            // solving b,p,k,f  before o,u
            if (x == "b" || x == "p" || x == "k" || x == "f") {
                let y = str[i + 1 ..< i + 2]
                if (y == "o" || y == "u" || y == "v" || y == "U") {
                    m = wordMap[x]?[7] ?? ""
                }
            }

            //solving h, g before e, i, w
            if (x == "h" || x == "g") {
                let y = str[i + 1 ..< i + 2]
                if (y == "e" || y == "i" || y == "w") {
                    m = wordMap[x]?[7] ?? ""
                }
            }

            //solving h, g before u
            if (x == "h" || x == "g") {
                let y = str[i + 1 ..< i + 2]
                if (y == "u") {
                    m = wordMap[x]?[8] ?? ""
                }
            }

            //solving u for second position,    test bumbur  bum
            if (x == "u" && i == 1) {
                m = wordMap[x]?[7] ?? ""
            }

            //solving i after a, e, o
            if (x == "i") {
                let y = str[i - 1 ..< i]
                if (y == "a" || y == "e" || y == "o" || y == "v") {
                    m = wordMap[x]?[7] ?? ""
                }
            }

            //solving g after Positive or Negative i traceback and  not before a,e,i, o, u      test yabogsan uggugsen jarlig jerlig baigal
            if (x == "g") {
                let y = str[i - 1 ..< i]
                let w = str[i + 1 ..< i + 2]
                if (y == "i") {
                    if (w != "a" && w != "e" && w != "i" && w != "o" && y != "v" && w != "u") {
                        for j in 1 ..< i {
                            let z = str[i + 1 - j ..< i + 2 - j]
                            if (z == "a" || z == "o" || z == "v" || z == "A") {
                                m = wordMap[x]?[2] ?? ""
                            }
                        }
                    }
                }
            }


            //h, g before a , for second last letter
            if (x == "h" || x == "g") {
                let y = str[i + 1 ..< i + 2]
                if (y == "a") {
                    if (i == str.length - 2) {
                        m = wordMap[x]?[10] ?? ""
                    }
                }
            }

            //n before a, e, for second last letter      test yabona
            if (x == "n") {
                let y = str[i + 1 ..< i + 2]
                if (y == "a" || y == "e") {
                    if (i == str.length - 2) {
                        m = wordMap[x]?[10] ?? ""
                    }
                }
            }

            //m, L, y, r before a, e
            if (x == "m" || x == "l" || x == "y" || x == "r") {
                let y = str[i + 1 ..< i + 2]
                if (y == "a" || y == "e") {
                    if (i == str.count - 2) {
                        m = wordMap[x]?[9] ?? ""
                    }
                }
            }


            resultMid = resultMid + m
        }
    }
}

//func GetWstring(t: Character) -> String
//{
//    wchar_t awc[2] = { 0 };
//    awc[0] = t;
//    return awc;
//}

func GetTeinClass(latin: String) -> Int {
    var iRet: Int = 0
    
    let word = latin

    while (true && word.count > 1) {
        let cLast = Character(word[word.count - 1])
        let cPreLast = Character(word[word.count - 2])

        if ((cPreLast >= "a" && cPreLast <= "z") || (cPreLast >= "A" && cPreLast <= "Z")) {
            if (cLast == "a" || cLast == "o" || cLast == "v") {
                iRet = 1;
                break;
            } else if (cLast == "e" || cLast == "i" || cLast == "u") {
                iRet = 2;
                break;
            }  else if (cLast == "p" || cLast == "h" || cLast == "x" ||
                            cLast == "t" || cLast == "c" || cLast == "j" ||
                            cLast == "y" || cLast == "w" || cLast == "f" ||
                            cLast == "k" || cLast == "q" || cLast == "z") {
                iRet = 3;
                break;
            }
            else if (cLast == "n") {
                iRet = 4;
                break;
            } else if (cLast == "n" && cPreLast == "g")
            {
                iRet = 5;
                break;
            }
            else if (cLast == "b" || cLast == "g" || cLast == "r" ||
                        cLast == "r" || cLast == "s" || cLast == "d") {
                iRet = 6;
                break;
            } else {
                break;
            }
        }

        break;
    }

    return iRet;
}

func ExeutePhrase(preWordLatin: String) -> [String]
{
    var ret: [String] = []
    var iTeinClass = GetTeinClass(latin: preWordLatin);
    switch (iTeinClass)
    {
    case 1:
        ret = m_tein1
    case 2:
        ret = m_tein2
    case 3:
        ret = m_tein3
    case 4:
        ret = m_tein4
    case 5:
        ret = m_tein5
    case 6:
        ret = m_tein6
    default:
        break
    }
    
    return ret
}

//2021.3.9
func GetEndsClass(word: String, newWords: inout [String]) -> Int {
    //0:Unknown   1:ne 2:me 3:le 4:ye 5:re 6:wa  7:o-3,u-3
    var iRet: Int = 0

    if (word == oArr[0]) {
        //o
        newWords.append(eArr[3] + uArr[9]);
        newWords.append(oArr[9]);
        newWords.append(oArr[6]);
    } else if (word == eArr[3] + uArr[11] ) {
        //u
        newWords.append(eArr[3] + uArr[9]);
        newWords.append(uArr[3]);
    }
    else if (word.count > 2){
        var cLast = word[word.count - 1];
        var cPreLast = word[word.count - 2]

        let scLast = word[word.length - 1 ..< word.length]
        let sPreLast = word[word.length - 2 ..< word.length - 1]
        var subWordPre = word[0 ..< word.count - 2];
        if (scLast == aArr[11])  {
            if (sPreLast == nArr[10])
            {
                //na
                subWordPre += nArr[7] + aArr[9];
                iRet = 1;
            }
            else if (sPreLast == mArr[9])
            {
                //ma
                subWordPre += mArr[6] + aArr[9];
                iRet = 2;
            }
            else if (sPreLast == lArr[9])
            {
                //la
                subWordPre += lArr[6] + aArr[9];
                iRet = 3;
            }
            else if (sPreLast == yArr[9])
            {
                //ya
                subWordPre += yArr[6] + aArr[9];
                iRet = 4;
            }
            else if (sPreLast == rArr[9])
            {
                //ra
                subWordPre += rArr[6] + aArr[9];
                iRet = 5;
            }
        }
        else if (sPreLast == wArr[6] && scLast == aArr[9])
        {
            //wa
            subWordPre += oArr[9] + aArr[11];
            iRet = 6;
        }
        
        if (iRet != 0)
        {
            newWords.append(subWordPre);
        }
    }

    return iRet;
}
}


extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}


