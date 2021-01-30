xquery version "3.1";

declare namespace skos = "http://www.w3.org/2004/02/skos/core#";
declare namespace rdf = "http://www.w3.org/1999/02/22-rdf-syntax-ns#";


let $scripts :=
<properties>
    <entry key="ro-x-accent-lowcase-vowels">áéíóúắấî́</entry>
    <entry key="ro-x-accent-upcase-vowels">ÁÉÍÓÚẮẤÎ́</entry>
    <entry key="fr">ßàáâãȁäāǎçćĉčèéêëēĕȅǵĝğìíîïīĭȉıłñńòóôöōŏőȍœśŝşšţùúûüūŭűȕýÿźżž</entry>
    <entry key="sr-Latn-x-lowcase">ßàáâãȁäāǎçćĉčèéêëēĕȅǵĝğìíîïīĭȉıłñńòóôöōŏőȍœśŝşšţùúûüūŭűȕýÿźżž</entry>
    <entry key="pl-x-lowcase">ßàáâãȁäāǎçćĉčèéêëēĕȅǵĝğìíîïīĭȉıłñńòóôöōŏőȍœśŝşšţùúûüūŭűȕýÿźżž</entry>
    <entry key="tr-x-lowcase">ßàáâãȁäāǎçćĉčèéêëēĕȅǵĝğìíîïīĭȉıłñńòóôöōŏőȍœśŝşšţùúûüūŭűȕýÿźżž</entry>
    <entry key="fr-x-upcase">ÀÁȀÄĀĂÇĆĈČÈÉÊËĒĔȄǴĜĞÌÍÎÏĪĬȈŁÑŃÒÓÔÖŌŎŐȌŒŚŜŞŠŢÙÚÛŪÜŬŰȔŸŹŻŽ</entry>
    <entry key="sr-Latn-x-upcase">ÀÁȀÄĀĂÇĆĈČÈÉÊËĒĔȄǴĜĞÌÍÎÏĪĬȈŁÑŃÒÓÔÖŌŎŐȌŒŚŜŞŠŢÙÚÛŪÜŬŰȔŸŹŻŽ</entry>
    <entry key="pl-x-upcase">ÀÁȀÄĀĂÇĆĈČÈÉÊËĒĔȄǴĜĞÌÍÎÏĪĬȈŁÑŃÒÓÔÖŌŎŐȌŒŚŜŞŠŢÙÚÛŪÜŬŰȔŸŹŻŽ</entry>
    <entry key="tr-x-upcase">ÀÁȀÄĀĂÇĆĈČÈÉÊËĒĔȄǴĜĞÌÍÎÏĪĬȈŁÑŃÒÓÔÖŌŎŐȌŒŚŜŞŠŢÙÚÛŪÜŬŰȔŸŹŻŽ</entry>
    <entry key="el-x-lowcase">αβγδεζηθικλμνξοπρςστυφχψω</entry>
    <entry key="el-x-acute-accent-vowels">άέήίόύώ</entry>
    <entry key="el-x-circum-accent-vowels">ᾶῆῖῦῶ</entry>
    <entry key="el-x-grave-accent-vowels">ὰὲὴὶὸὺὼ</entry>
    <entry key="el-x-psili-lowcase">ἀἁἐἑἠἡἰἱὀὁὐὑὠὡῤῥ</entry>
    <entry key="el-x-psili-accent-lowcase">ἄἅἂἃἆἇἒἓἔἕἢἣἤἥἦἧἲἳἴἵἶἷὂὃὄὅὒὓὔὕὖὗὢὣὤὥὦὧ</entry>
    <entry key="el-x-sbs-iota-lowcase">ᾀᾁᾂᾃᾄᾅᾆᾇᾐᾑᾒᾓᾔᾖᾗᾠᾡᾢᾣᾤᾥᾦᾧ</entry>
    <entry key="el-x-upcase">ΑΒΓΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ</entry>
    <entry key="el-x-psili-upcase">ἈἉἘἙἨἩἸἹὈὉὙὨὩῬ</entry>
    <entry key="el-x-psili-accent-upcase">ἊἋἌἍἎἏἚἛἜἝἪἫἬἭἮἯἺἻἼἽἾἿὊὋὌὍὛὝὟὪὫὬὭὮὯ</entry>
    <entry key="el-x-sbs-iota-upcase">ᾈᾉᾊᾋᾌᾍᾎᾏᾘᾙᾚᾛᾜᾝᾞᾟᾨᾩᾪᾫᾬᾭᾮᾯ</entry>
</properties>

return
    for $entry in $scripts/entry
    let $tag := data($entry/@key)
    let $characters := $entry/text()
    
    return
        <skos:Concept rdf:about="http://lingv.ro/ontology/special-characters/{$tag}">
            <skos:definition>{$characters}</skos:definition>
            <skos:notation>{$tag}</skos:notation>
        </skos:Concept>