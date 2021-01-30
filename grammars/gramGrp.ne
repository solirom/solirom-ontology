gramGrp -> (S | ADJ) {% data => "<gramGrp>" + data.join("") + "</gramGrp>" %}
POS -> ("adj." | "adv." | "art." | "conj." | "interj." | "num." | "prep." | "pron." | "s." | "s. pr." | "subst." | "vb." | "loc.") {% data => '<pos value="' + data[0] + '" />' %}

S -> POS delimiter GENDER:? delimiter NUMBER:? delimiter CASE:? delimiter ARTICULATION:? {% data => data.join("") %}
GENDER -> ("f." | "m." | "m. și f." | "n.") {% data => '<gen value="' + data[0] + '" />' %}
NUMBER -> ("sg." | "pl." | "invar.") {% data => '<number value="' + data[0] + '" />' %}
CASE -> ("dat."| "gen.-dat." | "voc.") {% data => '<case value="' + data[0] + '" />' %}
ARTICULATION -> ("art.") {% data => '<subc value="' + data[0] + '" />' %}

ADJ -> POS | POS delimiter ADJSUBC | POS delimiter ADJSUBC delimiter ADJNUMBER {% data => data.join("") %}
ADJSUBC -> "dem." | "interog.-rel." | "nehot." | "pos." {% data => '<subc value="' + data[0] + '" />' %}
ADJNUMBER -> "invar." {% data => '<number value="' + data[0] + '" />' %}

delimiter -> [,]:? [\s]:? {% null %}
