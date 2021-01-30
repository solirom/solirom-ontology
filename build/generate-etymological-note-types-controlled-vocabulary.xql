xquery version "3.0";

declare namespace html = "http://www.w3.org/1999/xhtml";
declare namespace rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#";

let $datalist := 		
let $controlled-vocabulary :=
    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">
			<skos:OrderedCollection rdf:about="http://lingv.ro/ontology/etymology/note/types">
				<rdfs:label>Tipuri de note etimologice</rdfs:label>
				<skos:memberList rdf:parseType="Collection">
	        		{
	                    for $option in $datalist//html:option[@label != '']
	                    let $label := $option/@label/string()
	                    let $value := $option/@value/string()
	                    let $notation := "uuid-" || util:uuid("etymological-note-types-" || $label)
	                    
	                    return
	                        <skos:Concept rdf:about="http://lingv.ro/ontology/etymology/note/types/#{$notation}">
	                        	<skos:prefLabel>{$label}</skos:prefLabel>
	                        	<skos:altLabel>{$value}</skos:altLabel>
	                        	<skos:notation>{$notation}</skos:notation>
	                        </skos:Concept>		    
	        		}    				
				</skos:memberList>
			</skos:OrderedCollection>
    </rdf:RDF>

return xmldb:store("/db", "etimological-note-types.rdf", $controlled-vocabulary)