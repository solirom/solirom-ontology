xquery version "3.0";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $ids := collection("/data/dlr/entries")//@xml:id[not(. = ('dlr-senses', 'dex-senses'))]

return $ids[index-of($ids, .)[2]] ! (. || " - " || ./root()/document-uri(.))[not(contains(., '/tests/'))]
