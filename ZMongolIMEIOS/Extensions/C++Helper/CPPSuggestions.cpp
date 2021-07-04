//
//  CPPSuggestions.cpp
//  ZMongolIMEIOS
//
//  Created by Nataliia Hudzeliak on 11.04.2021.
//

#include "CPPSuggestions.hpp"
#include <algorithm>
#include <regex>

#define DAGBR_COUNT 52

std::wstring dagbrEx[DAGBR_COUNT][6] = {
        { L"ᡬᡬᡧ ", L"1", L"0", L"0", L"0", L"0" },//yin
        { L"ᡭᡧ ", L"0", L"1", L"0", L"0", L"0" },   //vn
        { L"ᡭᡧ ", L"0", L"1", L"0", L"0", L"0" },   //un
        { L"ᡳ ", L"0", L"0", L"0", L"1", L"0" },    //v
        { L"ᡳ ", L"0", L"0", L"0", L"1", L"0" },    //u
        { L"ᡳᡪᡧ ", L"1", L"0", L"0", L"0", L"0" },  //ban
        { L"ᡳᡪᡧ ", L"1", L"0", L"0", L"0", L"0" },  //ben
        { L"ᡬᡬᡪᡧ ", L"0", L"1", L"0", L"1", L"0" },  //iyan
        { L"ᡬᡬᡪᡧ ", L"0", L"1", L"0", L"1", L"0" },  //iyen
        { L"ᡳᡪᢝ ", L"1", L"0", L"0", L"0", L"0" },   //bar
        { L"ᡳᡪᢝ ", L"1", L"0", L"0", L"0", L"0" },   //ber
        { L"ᡬᡬᡪᢝ ", L"0", L"1", L"0", L"1", L"0" },  //iyar
        { L"ᡬᡬᡪᢝ ", L"0", L"1", L"0", L"1", L"0" },  //iyer
        { L"ᡬᡫ ", L"1", L"0", L"0", L"0", L"0" },    //yi
        { L"ᡫ ", L"0", L"1", L"0", L"1", L"0" },     //i
        { L"ᢘᡳ ", L"0", L"0", L"0", L"0", L"1" },    //tv
        { L"ᢘᡳ ", L"0", L"0", L"0", L"0", L"1" },    //tu
        { L"ᢙᡳ ", L"1", L"0", L"1", L"1", L"0" },    //dv
        { L"ᢙᡳ ", L"1", L"0", L"1", L"1", L"0" },    //du
        { L"ᢘᡭᢝ ", L"0", L"0", L"0", L"0", L"1" },   //tvr
        { L"ᢘᡭᢝ ", L"0", L"0", L"0", L"0", L"1" },   //tur
        { L"ᢙᡭᢝ ", L"1", L"0", L"1", L"1", L"0" },   //dvr
        { L"ᢙᡭᢝ ", L"1", L"0", L"1", L"1", L"0" },   //dur
        { L"ᢘᡪᢊᡬᡦ ", L"0", L"0", L"0", L"0", L"1" },  //tahi
        { L"ᢘᡪᢊᡬᡦ ", L"0", L"0", L"0", L"0", L"1" },  //tehi
        { L"ᢙᡪᢊᡬᡦ ", L"1", L"0", L"1", L"1", L"0" },  //dahi
        { L"ᢙᡪᢊᡬᡦ ", L"1", L"0", L"1", L"1", L"0" },  //dehi
        { L"ᢘᡭᡱᡫ ", L"0", L"0", L"0", L"0", L"1" },  //tvni
        { L"ᢘᡭᡱᡫ ", L"0", L"0", L"0", L"0", L"1" },  //tuni
        { L"ᢙᡭᡱᡫ ", L"0", L"0", L"0", L"0", L"1" },  //dvni
        { L"ᢙᡭᡱᡫ ", L"0", L"0", L"0", L"0", L"1" },  //duni
        { L"ᢘᡪᡫ ", L"1", L"1", L"0", L"1", L"0" },   //tai
        { L"ᢘᡪᡫ ", L"1", L"1", L"0", L"1", L"0" },   //tei
        { L"ᢏᡭᢉᡨ ", L"1", L"1", L"0", L"1", L"0" }, //lvga
        { L"ᢏᡭᢊᡪᡨ ", L"1", L"1", L"0", L"1", L"0" },  //luge
        { L"ᡥᢚᡧ ", L"1", L"1", L"0", L"1", L"0" },   //aca
        { L"ᡥᢚᡧ ", L"1", L"1", L"0", L"1", L"0" },   //ece
        { L"ᢙᡪᡱᡱᡪᡧ ", L"1", L"0", L"1", L"1", L"0" },  //dagan
        { L"ᢙᡪᢊᡪᡧ ", L"1", L"0", L"1", L"1", L"0" },  //degen
        { L"ᢘᡪᡱᡱᡪᡧ ", L"0", L"0", L"0", L"0", L"1" }, //tagan
        { L"ᢘᡪᢊᡪᡧ ", L"0", L"0", L"0", L"0", L"1" },  //tegen
        { L"ᡯᡭᡱᡱᡭᡭᡧ ", L"1", L"0", L"0", L"1", L"0" },  //nvgvd
        { L"ᡯᡭᢋᡭᡭᡧ ", L"1", L"0", L"0", L"1", L"0" }, //nugud
        { L"ᡭᡭᡧ ", L"0", L"1", L"0", L"0", L"0" },     //vd
        { L"ᡭᡭᡧ ", L"0", L"1", L"0", L"0", L"0" },     //ud
        { L"ᡭᡳ ", L"1", L"0", L"0", L"0", L"0" },     //vv
        { L"ᡭᡳ ", L"1", L"0", L"0", L"0", L"0" },     //uu
        { L"ᡯᡪᢝ ", L"1", L"1", L"0", L"1", L"0" },    //nar
        { L"ᡯᡪᢝ ", L"1", L"1", L"0", L"1", L"0" },    //ner
        { L"ᢌᡬᡱᡫ ", L"1", L"1", L"0", L"1", L"0" },   //mini
        { L"ᢚᡬᡱᡫ ", L"1", L"1", L"0", L"1", L"0" },   //cini
        { L"ᡯᡫ ", L"1", L"1", L"0", L"1", L"0" }//,      //ni
};

wstring aArr[12] = { L"ᡥᡧ", L"", L"", L"ᡥᡪ", L"ᡪᡪ", L"", L"ᡪ", L"ᡪᡪ", L"", L"ᡧ", L"ᡪᡨ", L"ᡨ" };
wstring eArr[12] = { L"ᡥᡨ", L"", L"", L"ᡥ", L"ᡪᡪ", L"", L"ᡪ", L"ᡪᡪ", L"", L"ᡪᡨ", L"ᡧ", L"ᡨ" };
wstring iArr[12] = { L"ᡫ", L"", L"", L"ᡥᡬ", L"", L"", L"ᡬ", L"ᡬᡬ", L"ᡪᡬ", L"ᡫ", L"ᡬᡦ", L"" };
wstring oArr[12] = { L"ᡥᡭ", L"ᡥᡭ", L"", L"ᡥᡭ", L"", L"", L"ᡭ", L"ᡪᡭ", L"", L"ᡳ", L"ᡭ", L"" };
wstring uArr[12] = { L"ᡥᡭᡦ", L"", L"", L"ᡥᡭᡬ", L"", L"", L"ᡭ", L"ᡭᡬ", L"ᡪᡭᡬ", L"ᡳ", L"ᡭ", L"ᡭᡦ" };
wstring nArr[12] = { L"ᡯ", L"", L"", L"ᡯ", L"", L"", L"ᡪ", L"ᡱ", L"", L"ᡧ", L"ᡰ", L"" };
wstring bArr[12] = { L"ᡳ", L"", L"", L"ᡳ", L"ᡴ", L"", L"ᡳ", L"ᡴ", L"", L"ᡲ", L"", L"" };
wstring pArr[12] = { L"ᡶ", L"", L"", L"ᡶ", L"ᡷ", L"", L"ᡶ", L"ᡷ", L"", L"ᡵ", L"", L"" };
wstring hArr[12] = { L"ᡸ", L"", L"", L"ᡸ", L"ᢊ", L"ᢋ", L"ᡪᡪ", L"ᢊ", L"ᢋ", L"ᢇ", L"ᢇ", L"" };
wstring gArr[12] = { L"ᢈ", L"", L"ᡪᡪ", L"ᢈ", L"ᢊ", L"ᢋ", L"ᡱᡱ", L"ᢊ", L"ᢋ", L"ᢇ", L"ᢉ", L"ᡬᡨ" };
wstring mArr[12] = { L"ᢌ", L"", L"", L"ᢌ", L"", L"", L"ᢎ", L"", L"", L"ᢍ", L"", L"" };
wstring lArr[12] = { L"ᢏ", L"", L"", L"ᢏ", L"", L"", L"ᢑ", L"", L"", L"ᢐ", L"", L"" };
wstring sArr[12] = { L"ᢔ", L"", L"", L"ᢔ", L"", L"", L"ᢔ", L"", L"", L"ᢓ", L"", L"" };
wstring xArr[12] = { L"ᢗ", L"", L"", L"ᢗ", L"", L"", L"ᢗ", L"", L"", L"ᢖ", L"", L"" };
wstring tArr[12] = { L"ᢘ", L"", L"", L"ᢘ", L"", L"", L"ᢙ", L"ᢘ", L"", L"ᢘᡦ", L"", L"" };
wstring dArr[12] = { L"ᢙ", L"", L"", L"ᢘ", L"", L"", L"ᡭᡪ", L"ᢙ", L"", L"ᡭᡧ", L"ᢙᡦ", L"" };
wstring cArr[12] = { L"ᢚ", L"", L"", L"ᢚ", L"", L"", L"ᢚ", L"", L"", L"ᢚᡦ", L"", L"" };
wstring jArr[12] = { L"ᡬ", L"", L"", L"ᡬ", L"", L"", L"ᢛ", L"", L"", L"ᢛᡦ", L"", L"" };
wstring yArr[12] = { L"ᢜ", L"", L"", L"ᢜ", L"", L"", L"ᢜ", L"", L"", L"ᡫ", L"", L"" };
wstring rArr[12] = { L"ᢞ", L"", L"", L"ᢞ", L"", L"", L"ᢞ", L"", L"", L"ᢝ", L"", L"" };
wstring wArr[12] = { L"ᢟ", L"", L"", L"ᢟ", L"", L"", L"ᢟ", L"", L"", L"ᢟᡦ", L"", L"" };
wstring fArr[12] = { L"ᢡ", L"", L"", L"ᢡ", L"ᢢ", L"", L"ᢡ", L"ᢢ", L"", L"ᢠ", L"", L"" };
wstring kArr[12] = { L"ᢤ", L"", L"", L"ᢤ", L"ᢥ", L"", L"ᢤ", L"ᢥ", L"", L"ᢣ", L"", L"" };
wstring qArr[12] = { L"ᢚ", L"", L"", L"ᢚ", L"", L"", L"ᢚ", L"", L"", L"ᢚᡦ", L"", L"" };
wstring zArr[12] = { L"ᢧ", L"", L"", L"ᢧ", L"", L"", L"ᢧ", L"", L"", L"ᢧᡦ", L"", L"" };
wstring vArr[12] = { L"ᡥᡭ", L"ᡥᡭ", L"", L"ᡥᡭ", L"", L"", L"ᡭ", L"ᡪᡭ", L"", L"ᡳ", L"ᡭ", L"" };

wstring AArr[12] = { L"ᡥᡧ", L"", L"", L"ᡪᡪ", L"", L"", L"ᡪᡪ", L"", L"", L"ᡧ", L"", L"" };
wstring EArr[12] = { L"ᢟ", L"", L"", L"ᢟ", L"", L"", L"ᢟ", L"", L"", L"ᢟᡦ", L"", L"" };
wstring IArr[12] = { L"ᡫ", L"", L"", L"ᡥᡬ", L"", L"", L"ᡬ", L"ᡬᡬ", L"ᡪᡬ", L"ᡫ", L"ᡬᡦ", L"" };
wstring OArr[12] = { L"ᡥᡭ", L"ᡥᡭ", L"", L"ᡥᡭ", L"", L"", L"ᡭ", L"ᡪᡭ", L"", L"ᡭ", L"ᡭ", L"" };//2021.3.13
wstring UArr[12] = { L"ᡥᡭᡦ", L"", L"", L"ᡥᡭᡬ", L"", L"", L"ᡭᡬ", L"", L"", L"ᡭᡦ", L"", L"" };//2021.3.9
wstring NArr[12] = { L"ᡯ", L"", L"", L"ᡯ", L"", L"", L"ᡱ", L"ᡪ", L"", L"ᡧ", L"ᡰ", L"" };//2021.3.9
wstring BArr[12] = { L"ᡳ", L"", L"", L"ᡳ", L"ᡴ", L"", L"ᡳ", L"ᡴ", L"", L"ᡲ", L"", L"" };
wstring PArr[12] = { L"ᡶ", L"", L"", L"ᡶ", L"ᡷ", L"", L"ᡶ", L"ᡷ", L"", L"ᡵ", L"", L"" };
wstring HArr[12] = { L"ᡸ", L"", L"", L"ᡸ", L"ᢊ", L"ᢋ", L"ᡪᡪ", L"ᢊ", L"ᢋ", L"ᢇ", L"ᢇ", L"" };
wstring GArr[12] = { L"ᢈ", L"", L"ᡪᡪ", L"ᢈ", L"ᢊ", L"ᢋ", L"ᡱᡱ", L"ᢊ", L"ᢋ", L"ᢇ", L"ᢉ", L"ᡬᡨ" };
wstring MArr[12] = { L"ᢌ", L"", L"", L"ᢌ", L"", L"", L"ᢎ", L"", L"", L"ᢍ", L"", L"" };
wstring LArr[12] = { L"ᢏᢨ", L"", L"", L"ᢏᢨ", L"", L"", L"ᢑᢨ", L"", L"", L"ᢑᢨᡦ", L"", L"" };
wstring SArr[12] = { L"ᢔ", L"", L"", L"ᢔ", L"", L"", L"ᢔ", L"", L"", L"ᢓ", L"", L"" };
wstring XArr[12] = { L"ᢗ", L"", L"", L"ᢗ", L"", L"", L"ᢗ", L"", L"", L"ᢖ", L"", L"" };
wstring TArr[12] = { L"ᢙ", L"", L"", L"ᢙ", L"", L"", L"ᢙ", L"ᢘ", L"", L"ᢙᡦ", L"", L"" };//2021.3.9
wstring DArr[12] = { L"ᢘ", L"", L"", L"ᢙ", L"", L"", L"ᢘ", L"", L"", L"ᢘᡦ", L"", L"" };
wstring CArr[12] = { L"ᢦ", L"", L"", L"ᢦ", L"", L"", L"ᢦ", L"", L"", L"ᢦᡦ", L"", L"" };
wstring JArr[12] = { L"ᡬ", L"", L"", L"ᡬ", L"", L"", L"ᢛ", L"", L"", L"ᢛᡦ", L"", L"" };
wstring YArr[12] = { L"ᢜ", L"", L"", L"ᢜ", L"", L"", L"ᢜ", L"", L"", L"ᡫ", L"", L"" };
wstring RArr[12] = { L"ᢞ", L"", L"", L"ᢞ", L"", L"", L"ᢞ", L"", L"", L"ᢝ", L"", L"" };
wstring WArr[12] = { L"ᢟ", L"", L"", L"ᢟ", L"", L"", L"ᢟ", L"", L"", L"ᢟᡦ", L"", L"" };
wstring FArr[12] = { L"ᢡ", L"", L"", L"ᢡ", L"ᢢ", L"", L"ᢡ", L"ᢢ", L"", L"ᢠ", L"", L"" };
wstring KArr[12] = { L"ᢤ", L"", L"", L"ᢤ", L"ᢥ", L"", L"ᢤ", L"ᢥ", L"", L"ᢣ", L"", L"" };
wstring QArr[12] = { L"ᢦ", L"", L"", L"ᢦ", L"", L"", L"", L"", L"", L"ᢦᡦ", L"", L"" };
wstring ZArr[12] = { L"ᢨ", L"", L"", L"ᢨ", L"", L"", L"ᢨ", L"", L"", L"ᢨᡦ", L"", L"" };
wstring VArr[12] = { L"ᡭ", L"ᡭ", L"", L"ᡭ", L"", L"", L"ᡭ", L"ᡪᡭ", L"", L"ᡳ", L"ᡭ", L"" };

ZCode::ZCode()
{
    qArray.push_back(L"ᡳᡪᢝ");
    qArray.push_back(L"ᡳᡪᢝ");
    qArray.push_back(L"ᡬᡬᡪᢝ");
    qArray.push_back(L"ᢘᡪᡫ");
    qArray.push_back(L"ᡳᡪᡧ");
    qArray.push_back(L"ᡬᡬᡪᡧ");
    qArray.push_back(L"ᡭᡭᡧ");
    qArray.push_back(L"ᢘᡪᡱᡱᡪᡧ");
    qArray.push_back(L"ᢘᡪᢊᡪᡧ");
    qArray.push_back(L"ᢙᡪᡱᡱᡪᡧ");
    qArray.push_back(L"ᢙᡪᢊᡪᡧ");

    vArray.push_back(L"ᡬᡬᡧ");
    vArray.push_back(L"ᡭᡧ");
    vArray.push_back(L"ᡳ");
    vArray.push_back(L"ᢘᡳ");
    vArray.push_back(L"ᢙᡳ");
    vArray.push_back(L"ᡬᡫ");
    vArray.push_back(L"ᡫ");
    vArray.push_back(L"ᡥᢚᡧ");

    teinIlgal.insert(make_pair(L"q", qArray));
    teinIlgal.insert(make_pair(L"v", vArray));

    databases.insert(make_pair(L"aav", L"ᡥᡪᡴᡭ"));
    databases.insert(make_pair(L"america", L"ᡥᡪᢎᢟᢞᡬᢤᡪᡨ"));
    databases.insert(make_pair(L"ch", L"ᡭᡭ"));
    databases.insert(make_pair(L"chi", L"ᡭᡭᡫ"));
    databases.insert(make_pair(L"cihola", L"ᢚᡬᡪᡪᡭᢑᡧ"));
    databases.insert(make_pair(L"cino", L"ᢚᡬᡱᡳᡨ"));
    databases.insert(make_pair(L"do", L"ᢙᡳ"));
    databases.insert(make_pair(L"du", L"ᢙᡳ"));
    databases.insert(make_pair(L"eej", L"ᡥᢛᡫ"));
    databases.insert(make_pair(L"eyer", L"ᡬᡬᡪᢝ"));
    databases.insert(make_pair(L"europe", L"ᡥᢟᡭᡬᢞᡭᡶᡪᡨ"));
    databases.insert(make_pair(L"eyen", L"ᡬᡬᡪᡧ"));
    databases.insert(make_pair(L"gowa", L"ᢈᡭᡳᡨ"));
    databases.insert(make_pair(L"hebei", L"ᡥᢨᢟᡳᢟᡫ"));
    databases.insert(make_pair(L"in", L"ᡬᡬᡧ"));
    databases.insert(make_pair(L"kino", L"ᢤᡬᡱᡭ"));
    databases.insert(make_pair(L"kod", L"ᢥᡭᢙᡦ"));
    //            databases.insert(make_pair(L"lasa", L"ᢏᢨᡪᢔᡧ"));
    databases.insert(make_pair(L"mongol", L"ᢌᡭᡪᢊᡱᡱᡭᢐ"));
    databases.insert(make_pair(L"no", L"ᡳ"));
    databases.insert(make_pair(L"on", L"ᡭᡧ"));
    databases.insert(make_pair(L"oo", L"ᡭᡳ"));
    databases.insert(make_pair(L"radio", L"ᢞᡪᢙᡬᡭ"));
    databases.insert(make_pair(L"sh", L"ᢗ"));
    databases.insert(make_pair(L"shi", L"ᢗᡫ"));
    databases.insert(make_pair(L"su", L"ᢔᡭᡦ"));
    databases.insert(make_pair(L"tatar", L"ᢘᡪᢘᡪᢝ"));
    databases.insert(make_pair(L"yunikod", L"ᢜᡭᡬᡱᡬᢥᡭᢙᡦ"));
    databases.insert(make_pair(L"zh", L"ᢨ"));
    databases.insert(make_pair(L"zhi", L"ᢨᡫ"));
    databases.insert(make_pair(L"english", L"ᡥᡪᡪᢊᢊᢑᡫ"));
    databases.insert(make_pair(L"england", L"ᡥᡪᡪᢊᢊᢑᡫ"));
    databases.insert(make_pair(L"degen", L"ᢙᡪᢊᡪᡧ"));
    databases.insert(make_pair(L"deng", L"ᢙᢟᡪᡬᡨ"));
    databases.insert(make_pair(L"dan", L"ᢙᡪᡧ"));
    databases.insert(make_pair(L"den", L"ᢙᡪᡧ"));
    databases.insert(make_pair(L"din", L"ᢙᡬᡧ"));
    databases.insert(make_pair(L"o", L"ᡥᡭ"));
    databases.insert(make_pair(L"u", L"ᡥᡭᡬ"));
    databases.insert(make_pair(L"i", L"ᡥᡫ"));
    databases.insert(make_pair(L"naima", L"ᡯᡪᡬᢎᡧ"));
    databases.insert(make_pair(L"dung", L"ᢙᡭᡬᡪᡬᡨ"));
    databases.insert(make_pair(L"don", L"ᢙᡭᡧ"));
    databases.insert(make_pair(L"dungsigor", L"ᢙᡭᡬᡪᢊᢔᡬᡱᡱᡭᢝ"));
    databases.insert(make_pair(L"agola", L"ᡥᡪᡱᡱᡭᢑᡧ"));
    databases.insert(make_pair(L"sig", L"ᢔᡬᢇ"));
    databases.insert(make_pair(L"tig", L"ᢘᡬᢇ"));
    databases.insert(make_pair(L"tere", L"ᢘᡪᢞᡧ"));

    
    wordMap.insert(make_pair(L"a", aArr));
    wordMap.insert(make_pair(L"e", eArr));
    wordMap.insert(make_pair(L"i", iArr));
    wordMap.insert(make_pair(L"o", oArr));
    wordMap.insert(make_pair(L"u", uArr));
    wordMap.insert(make_pair(L"n", nArr));
    wordMap.insert(make_pair(L"b", bArr));
    wordMap.insert(make_pair(L"p", pArr));
    wordMap.insert(make_pair(L"h", hArr));
    wordMap.insert(make_pair(L"g", gArr));
    wordMap.insert(make_pair(L"m", mArr));
    wordMap.insert(make_pair(L"l", lArr));
    wordMap.insert(make_pair(L"s", sArr));
    wordMap.insert(make_pair(L"x", xArr));
    wordMap.insert(make_pair(L"t", tArr));
    wordMap.insert(make_pair(L"d", dArr));
    wordMap.insert(make_pair(L"c", cArr));
    wordMap.insert(make_pair(L"j", jArr));
    wordMap.insert(make_pair(L"y", yArr));
    wordMap.insert(make_pair(L"r", rArr));
    wordMap.insert(make_pair(L"w", wArr));
    wordMap.insert(make_pair(L"f", fArr));
    wordMap.insert(make_pair(L"k", kArr));
    wordMap.insert(make_pair(L"q", qArr));
    wordMap.insert(make_pair(L"z", zArr));
    wordMap.insert(make_pair(L"v", vArr));

    wordMap.insert(make_pair(L"A", AArr));
    wordMap.insert(make_pair(L"E", eArr));
    wordMap.insert(make_pair(L"I", iArr));
    wordMap.insert(make_pair(L"O", OArr));//2021.3.13
    wordMap.insert(make_pair(L"U", UArr));
    wordMap.insert(make_pair(L"N", nArr));
    wordMap.insert(make_pair(L"B", bArr));
    wordMap.insert(make_pair(L"P", pArr));
    wordMap.insert(make_pair(L"H", hArr));
    wordMap.insert(make_pair(L"G", gArr));
    wordMap.insert(make_pair(L"M", mArr));
    wordMap.insert(make_pair(L"L", LArr));
    wordMap.insert(make_pair(L"S", sArr));
    wordMap.insert(make_pair(L"X", xArr));
    wordMap.insert(make_pair(L"T", TArr));
    wordMap.insert(make_pair(L"D", DArr));
    wordMap.insert(make_pair(L"C", CArr));
    wordMap.insert(make_pair(L"J", jArr));
    wordMap.insert(make_pair(L"Y", yArr));
    wordMap.insert(make_pair(L"R", rArr));
    wordMap.insert(make_pair(L"W", wArr));
    wordMap.insert(make_pair(L"F", fArr));
    wordMap.insert(make_pair(L"K", kArr));
    wordMap.insert(make_pair(L"Q", qArr));
    wordMap.insert(make_pair(L"Z", ZArr));
    wordMap.insert(make_pair(L"V", vArr));

    //init dagbvr
    vector<wstring> vDagbvr;
    vDagbvr.push_back(dagbrEx[0][0]);
    vDagbvr.push_back(dagbrEx[1][0]);
    vDagbvr.push_back(dagbrEx[3][0]);
    m_mapNumDagvr.insert(make_pair(1, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[13][0]);
    vDagbvr.push_back(dagbrEx[14][0]);
    m_mapNumDagvr.insert(make_pair(2, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[15][0]);
    vDagbvr.push_back(dagbrEx[17][0]);
    m_mapNumDagvr.insert(make_pair(3, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[9][0]);
    vDagbvr.push_back(dagbrEx[11][0]);
    m_mapNumDagvr.insert(make_pair(4, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[5][0]);
    vDagbvr.push_back(dagbrEx[7][0]);
    m_mapNumDagvr.insert(make_pair(5, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[37][0]);
    vDagbvr.push_back(dagbrEx[39][0]);
    vDagbvr.push_back(dagbrEx[38][0]);
    vDagbvr.push_back(dagbrEx[40][0]);
    m_mapNumDagvr.insert(make_pair(6, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[25][0]);
    vDagbvr.push_back(dagbrEx[26][0]);
    m_mapNumDagvr.insert(make_pair(8, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[41][0]);
    vDagbvr.push_back(dagbrEx[42][0]);
    vDagbvr.push_back(dagbrEx[43][0]);
    vDagbvr.push_back(dagbrEx[47][0]);
    m_mapNumDagvr.insert(make_pair(7, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[35][0]);
    m_mapNumDagvr.insert(make_pair(9, vDagbvr));

    vDagbvr.clear();
    vDagbvr.push_back(dagbrEx[49][0]);
    vDagbvr.push_back(dagbrEx[50][0]);
    vDagbvr.push_back(dagbrEx[51][0]);
    m_mapNumDagvr.insert(make_pair(0, vDagbvr));

    m_tein1.push_back(dagbrEx[0][0]);
    m_tein1.push_back(dagbrEx[13][0]);
    m_tein1.push_back(dagbrEx[9][0]);
    m_tein1.push_back(dagbrEx[5][0]);
    m_tein1.push_back(dagbrEx[17][0]);
    m_tein1.push_back(dagbrEx[21][0]);
    m_tein1.push_back(dagbrEx[35][0]);
    m_tein1.push_back(dagbrEx[31][0]);
    m_tein1.push_back(dagbrEx[37][0]);
    m_tein1.push_back(dagbrEx[33][0]);

    m_tein2.push_back(dagbrEx[0][0]);
    m_tein2.push_back(dagbrEx[13][0]);
    m_tein2.push_back(dagbrEx[9][0]);
    m_tein2.push_back(dagbrEx[7][0]);
    m_tein2.push_back(dagbrEx[17][0]);
    m_tein2.push_back(dagbrEx[21][0]);
    m_tein2.push_back(dagbrEx[35][0]);
    m_tein2.push_back(dagbrEx[31][0]);
    m_tein2.push_back(dagbrEx[38][0]);
    m_tein2.push_back(dagbrEx[34][0]);

    m_tein3.push_back(dagbrEx[1][0]);
    m_tein3.push_back(dagbrEx[14][0]);
    m_tein3.push_back(dagbrEx[11][0]);
    m_tein3.push_back(dagbrEx[35][0]);
    m_tein3.push_back(dagbrEx[31][0]);

    m_tein4.push_back(dagbrEx[4][0]);
    m_tein4.push_back(dagbrEx[17][0]);
    m_tein4.push_back(dagbrEx[21][0]);
    m_tein4.push_back(dagbrEx[35][0]);
    m_tein4.push_back(dagbrEx[31][0]);

    m_tein5.push_back(dagbrEx[1][0]);
    m_tein5.push_back(dagbrEx[14][0]);
    m_tein5.push_back(dagbrEx[11][0]);
    m_tein5.push_back(dagbrEx[17][0]);
    m_tein5.push_back(dagbrEx[21][0]);
    m_tein5.push_back(dagbrEx[35][0]);
    m_tein5.push_back(dagbrEx[31][0]);

    m_tein6.push_back(dagbrEx[1][0]);
    m_tein6.push_back(dagbrEx[14][0]);
    m_tein6.push_back(dagbrEx[11][0]);
    m_tein6.push_back(dagbrEx[15][0]);
    m_tein6.push_back(dagbrEx[19][0]);
    m_tein6.push_back(dagbrEx[35][0]);
    m_tein6.push_back(dagbrEx[31][0]);
}

ZCode::~ZCode()
{
}

//2021.3.13
void ZCode::Excute(wstring latin, vector<wstring>& result) {

    int wordLength = (int)latin.length();
    resultFirst = L"";
    resultMid = L"";
    vector<wstring> resultLast;
    if ( wordLength == 1 && wordMap.find(latin) != wordMap.end()) {
        wstring* currentAry = wordMap[latin];
        resultFirst = currentAry[0];
    }
    else if (wordLength == 2) {
        FirstAndLast(latin, resultFirst, resultLast);
    }
    else {
        FirstAndLast(latin, resultFirst, resultLast);
        Middle(latin, resultMid);
    }

    if (resultLast.size() > 0)
    {
        for (int i = 0; i < resultLast.size(); i++)
        {
            result.push_back(resultFirst + resultMid + resultLast.at(i));
        }
    }
    else
    {
        result.push_back(resultFirst);
    }
    
    return;
}

//2021.3.9
void ZCode::ExcuteEx(wstring latin, vector<wstring>& result)
{
    vector<wstring> resWords;
    Excute(latin, resWords);
    for (int i = 0; i < resWords.size(); i++)
    {
        if (resWords.at(i).length() > 0)
        {
            result.push_back(resWords.at(i));

            //ne me le ye re wa
            vector<wstring> newWord;
            int iEndClass = GetEndsClass(resWords.at(i), newWord);
            if (newWord.size() > 0)
            {
                result.insert(result.end(), newWord.begin(), newWord.end());
            }
        }
    }

    return;
}

void ZCode::FirstAndLast(wstring str, wstring &resultFirst, vector<wstring>& resultLast) {
    //solving first letter
    
    if (wordMap.find(str.substr(0, 1)) == wordMap.end())
    {
        return;
    }
    resultFirst = wordMap[str.substr(0, 1)][3];
    wchar_t awc[2] = { 0 };
    awc[0] = str.at(0);
    wstring x = awc;
    
    //2020.3.13
    // solving b,p,k,f  before o,u
    if (x == L"b" || x == L"p" || x == L"k" || x == L"f") {
        wstring y = GetWstring(str.at(1));
        if (y == L"o" || y == L"u" || y == L"v" || y == L"U") {
            resultFirst = wordMap[x][4];
        }
    }
    // solving h,g before e,i,w
    if (x == L"h" || x == L"g") {
        wstring y = GetWstring(str.at(1));
        if (y == L"e" || y == L"i" || y == L"w") {
            resultFirst = wordMap[x][4];
        }
    }
    //2021.3.13
    // solving h,g before u
    if (x == L"h" || x == L"g") {
        wstring y = GetWstring(str.at(1));
        if (y == L"u" || y == L"U") {
            resultFirst = wordMap[x][5];
        }
    }

    //solving last letter;
    if (wordMap.find(str.substr(str.length() - 1)) != wordMap.end() && wordMap[str.substr(str.length() - 1)] != NULL)
    {
        wstring pTemp = wordMap[str.substr(str.length() - 1)][9];
        if (pTemp.length() > 0)
        {
            //resultLast = pTemp;
            resultLast.push_back(pTemp);
        }
    }
    x = str.at(str.length() - 2);
    // solving a after b,p,k,f    test haha  baba
    if (x == L"b" || x == L"p" || x == L"k" || x == L"f") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"a") {
            //resultLast = wordMap[y][10];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][10]);
        }
    }
    // solving e after h,g
    if (x == L"h" || x == L"g") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"e") {
            //resultLast = wordMap[y][9];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][9]);
        }
    }
    // solving i after b,p,k,f,h,g
    if (x == L"b" || x == L"p"
        || x == L"k" || x == L"f"
        || x == L"h" || x == L"g") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"i") {
            //resultLast = wordMap[y][10];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][10]);
        }
    }
    // solving o after b,p,k,f
    if (x == L"b" || x == L"p"
        || x == L"k" || x == L"f") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"o" || y == L"v") {
            //resultLast = wordMap[y][10];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][10]);
        }
    }
    // solving u after b,p,k,f,h,g
    if (x == L"b" || x == L"p"
        || x == L"k" || x == L"f"
        || x == L"h" || x == L"g") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"u") {
            //resultLast = wordMap[y][10];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][10]);
        }
    }
    // solving g after i,e,u, U
    if (x == L"i" || x == L"e" || x == L"u" || x == L"U") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"g") {
            
            if (x == L"i") {
                wstring temp;
                for (int j = 1; j < str.length() - 2; j++) {
                    wstring z = GetWstring(str.at(str.length() - 2 - j));
                    if (z == L"a" || z == L"o" || z == L"v") {
                        //resultLast = wordMap[y][9];
                        temp = wordMap[y][9];
                    }
                }
                if (resultLast.size() > 0)
                {
                    resultLast.clear();
                }
                resultLast.push_back(wordMap[y][9]);
            }
            else
            {
                //resultLast = wordMap[y][11];
                if (resultLast.size() > 0)
                {
                    resultLast.clear();
                }
                resultLast.push_back(wordMap[y][11]);
            }
        }
    }

    // solving g after n
    if (x == L"n") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"g") {
            //resultLast = wordMap[y][11];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][11]);
        }
    }
    // solving a, e after n, m, l, y, r
    if (x == L"n" || x == L"m" || x == L"l" || x == L"y" || x == L"r") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"a" || y == L"e") {
            //resultLast = wordMap[y][11];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][11]);
        }
    }
    // solving e after c, v, z, q, d
    if (x == L"c" || x == L"v" || x == L"z" || x == L"q" || x == L"d") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"e") {
            //resultLast = wordMap[y][10];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][10]);
        }
    }
    // solving a, after h, g
    if (x == L"h" || x == L"g") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"a") {
            //resultLast = wordMap[y][11];
            if (resultLast.size() > 0)
            {
                resultLast.clear();
            }
            resultLast.push_back(wordMap[y][11]);
        }
    }
    // solving a, after n, m, h, g, for isolated na, ma, ha, ga
    if (x == L"n" || x == L"m" || x == L"h" || x == L"g") {
        wstring y = GetWstring(str.at(str.length() - 1));
        if (y == L"a") {
            if (2 == str.length()) {
                //resultLast = wordMap[y][9];
                if (resultLast.size() > 0)
                {
                    resultLast.clear();
                }
                resultLast.push_back(wordMap[y][9]);
            }
        }
    }

}


void ZCode::Middle(wstring str, wstring& resultMid) {

    wstring m = L"";
    for (int i = 1; i < str.length() - 1; i++) {
        wstring x = GetWstring(str.at(i));
        if (wordMap[x] != NULL)
        {
            m = wordMap[x][6];


            //solving g after a or o
            wstring yy = GetWstring(str.at(i - 1));
            if (yy == L"a" || yy == L"o" || yy == L"v") {
                if (x == L"g") {
                    m = wordMap[x][2];
                }
            }
            //solving g not after a or o
            if (yy != L"a" && yy != L"o" && yy != L"v") {
                if (x == L"g") {
                    m = wordMap[x][7];
                }
            }

            //solving g before a or o
            if (x == L"g") {
                wstring y = GetWstring(str.at(i + 1));
                if (y == L"a" || y == L"o" || y == L"v") {
                    m = wordMap[x][6];
                }
            }

            //2021.3.9
            //solving n,d before egshig    a,e,i,o,u, U, A, E,
            if (x == L"n" || x == L"d") {
                wstring y = GetWstring(str.at(i + 1));
                if (y == L"a" || y == L"e" || y == L"i" || y == L"o" || y == L"v" || y == L"u" || y == L"A" || y == L"E" || y == L"U") {
                    m = wordMap[x][7];
                }
            }

            //2021.3.9
            //solving N,T before egshig    a,e,i,o,u, U, A, E,
            if (x == L"N" || x == L"T" || x == L"D") {
                m = wordMap[x][7];
            }

            //2021.3.13
            // solving b,p,k,f  before o,u
            if (x == L"b" || x == L"p" || x == L"k" || x == L"f") {
                wstring y = GetWstring(str.at(i + 1));
                if (y == L"o" || y == L"u" || y == L"v" || y == L"U") {
                    m = wordMap[x][7];
                }
            }

            //solving h, g before e, i, w
            if (x == L"h" || x == L"g") {
                wstring y = GetWstring(str.at(i + 1));
                if (y == L"e" || y == L"i" || y == L"w") {
                    m = wordMap[x][7];
                }
            }

            //solving h, g before u
            if (x == L"h" || x == L"g") {
                wstring y = GetWstring(str.at(i + 1));
                if (y == L"u") {
                    m = wordMap[x][8];
                }
            }

            //solving u for second position,    test bumbur  bum
            if (x == L"u" && i == 1) {
                m = wordMap[x][7];
            }

            //solving i after a, e, o
            if (x == L"i") {
                wstring y = GetWstring(str.at(i - 1));
                if (y == L"a" || y == L"e" || y == L"o" || y == L"v") {
                    m = wordMap[x][7];
                }
            }

            //solving g after Positive or Negative i traceback and  not before a,e,i, o, u      test yabogsan uggugsen jarlig jerlig baigal
            if (x == L"g") {
                wstring y = GetWstring(str.at(i - 1));
                wstring w = GetWstring(str.at(i + 1));
                if (y == L"i") {
                    if (w != L"a" && w != L"e" && w != L"i" && w != L"o" && y != L"v" && w != L"u") {
                        for (int j = 1; j <= (i); j++) {
                            wstring z = GetWstring(str.at(i + 1 - j));
                            if (z == L"a" || z == L"o" || z == L"v" || z == L"A") {
                                m = wordMap[x][2];
                            }
                        }
                    }
                }
            }


            //h, g before a , for second last letter
            if (x == L"h" || x == L"g") {
                wstring y = GetWstring(str.at(i + 1));
                if (y == L"a") {
                    if (i == str.length() - 2) {
                        m = wordMap[x][10];
                    }
                }
            }

            //n before a, e, for second last letter      test yabona
            if (x == L"n") {
                wstring y = GetWstring(str.at(i + 1));
                if (y == L"a" || y == L"e") {
                    if (i == str.length() - 2) {
                        m = wordMap[x][10];
                    }
                }
            }

            //m, L, y, r before a, e
            if (x == L"m" || x == L"l" || x == L"y" || x == L"r") {
                wstring y = GetWstring(str.at(i + 1));
                if (y == L"a" || y == L"e") {
                    if (i == str.length() - 2) {
                        m = wordMap[x][9];
                    }
                }
            }


            resultMid = resultMid + m;
        }
    }
}

wstring ZCode::GetWstring(wchar_t t)
{
    wchar_t awc[2] = { 0 };
    awc[0] = t;
    return awc;
}

int ZCode::GetTeinClass(wstring latin)
{
    int iRet = 0;
    
    wstring word = latin;

    while (true && word.length() > 1)
    {
        wchar_t cLast = word.c_str()[word.length() - 1];
        wchar_t cPreLast = word.c_str()[word.length() - 2];

        if ((cPreLast >= 'a' && cPreLast <= 'z') || (cPreLast >= 'A' && cPreLast <= 'Z'))
        {
            if (cLast == 'a' || cLast == 'o' || cLast == 'v')
            {
                iRet = 1;
                break;
            }
            else if (cLast == 'e' || cLast == 'i' || cLast == 'u')
            {
                iRet = 2;
                break;
            }
            else if (cLast == 'p' || cLast == 'h' || cLast == 'x' ||
                cLast == 't' || cLast == 'c' || cLast == 'j' ||
                cLast == 'y' || cLast == 'w' || cLast == 'f' ||
                cLast == 'k' || cLast == 'q' || cLast == 'z')
            {
                iRet = 3;
                break;
            }
            else if (cLast == 'n')
            {
                iRet = 4;
                break;
            }
            else if (cLast == 'n' && cPreLast == 'g')
            {
                iRet = 5;
                break;
            }
            else if (cLast == 'b' || cLast == 'g' || cLast == 'r' ||
                cLast == 'r' || cLast == 's' || cLast == 'd')
            {
                iRet = 6;
                break;
            }
            else
            {
                break;
            }
        }

        break;
    }

    return iRet;
}

void ZCode::ExeutePhrase(wstring preWordLatin, vector<wstring>& out)
{
    int iTeinClass = GetTeinClass(preWordLatin);
    switch (iTeinClass)
    {
    case 1:
        out.insert(out.end(), m_tein1.begin(), m_tein1.end());
        break;
    case 2:
        out.insert(out.end(), m_tein2.begin(), m_tein2.end());
        break;
    case 3:
        out.insert(out.end(), m_tein3.begin(), m_tein3.end());
        break;
    case 4:
        out.insert(out.end(), m_tein4.begin(), m_tein4.end());
        break;
    case 5:
        out.insert(out.end(), m_tein5.begin(), m_tein5.end());
        break;
    case 6:
        out.insert(out.end(), m_tein6.begin(), m_tein6.end());
        break;
    default:
        break;
    }
}

//2021.3.9
int ZCode::GetEndsClass(wstring word, vector<wstring> &newWords)
{
    //0:Unknown   1:ne 2:me 3:le 4:ye 5:re 6:wa  7:o-3,u-3
    int iRet = 0;

    if (word == oArr[0])
    {
        //o
        newWords.push_back(eArr[3] + uArr[9]);
        newWords.push_back(oArr[9]);
        newWords.push_back(oArr[6]);
    }
    else if (word == eArr[3] + uArr[11] )
    {
        //u
        newWords.push_back(eArr[3] + uArr[9]);
        newWords.push_back(uArr[3]);
    }
    else if (word.length() > 2)
    {
        wchar_t cLast = word.c_str()[word.length() - 1];
        wchar_t cPreLast = word.c_str()[word.length() - 2];

        wstring scLast = word.substr(word.length() - 1, 1);
        wstring sPreLast = word.substr(word.length() - 2, 1);
        wstring subWordPre = word.substr(0, word.length() - 2);
        if (scLast == aArr[11])
        {
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
            newWords.push_back(subWordPre);
        }
    }

    return iRet;
}
