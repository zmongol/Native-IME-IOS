//
//  CPPSuggestions.hpp
//  ZMongolIMEIOS
//
//  Created by Nataliia Hudzeliak on 11.04.2021.
//

#ifndef CPPSuggestions_hpp
#define CPPSuggestions_hpp

#include <vector>
#include <map>
#include <string>


using namespace std;

class ZCode
{
public:
    ZCode();
    ~ZCode();

    void Excute(wstring latin, vector<wstring>& result);

    void ExcuteEx(wstring latin, vector<wstring>& result);

    void ExeutePhrase(wstring preWordLatin, vector<wstring>& out);

    int GetEndsClass(wstring word, vector<wstring> &newWords);

private:
    void FirstAndLast(wstring str, wstring &resultFirst, vector<wstring>& resultLast);

    void Middle(wstring str, wstring &resultMiddle);

    int GetTeinClass(wstring latin);

    wstring GetWstring(wchar_t t);
    wstring result = L"-1";
    wstring resultFirst = L"";
    wstring resultMid = L"";
    wstring resultLast = L"";

    vector<wstring> qArray;
    vector<wstring> vArray;
    map<wstring, vector<wstring> > teinIlgal;

    map<wstring, wstring> databases;

    map<wstring, wstring*> wordMap;

    map<int, vector<wstring> > m_mapNumDagvr;

    vector<wstring> m_tein1;
    vector<wstring> m_tein2;
    vector<wstring> m_tein3;
    vector<wstring> m_tein4;
    vector<wstring> m_tein5;
    vector<wstring> m_tein6;
};

#endif
