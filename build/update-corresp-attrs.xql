xquery version "3.1";

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
	        <result>
	            {
        	        for $current-def-child in $current-def-children
        	        
        	        return update insert attribute corresp {"#" || $current-def-id} into $current-def-child	                
	            }
            </result>
	    else ()
