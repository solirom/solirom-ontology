xquery version "3.0";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $entries := collection("/data/dlr/entries")/*

return
    for $current-def in $entries//tei:dictScrap[@xml:id = 'dlr-senses']//tei:sense/tei:def
    let $next-def := $current-def/following-sibling::tei:def[1]
    let $current-def-children := $current-def/following-sibling::element()[local-name() = ('ptr', 'usg')] except ($next-def, $next-def/following-sibling::*)
    let $current-def-id := $current-def/@xml:id/string()
		
	return
	    if ($current-def-children)
	    then
            let $corresp-attr-values := distinct-values($current-def-children/@corresp)
            
            return
                if (count($corresp-attr-values) > 1)
                then 
                    if ($current-def-id != $corresp-attr-values)
                    then $corresp-attr-values
                    else ()
                else ()
	    else ()
	    