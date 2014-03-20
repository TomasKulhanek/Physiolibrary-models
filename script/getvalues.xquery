declare option saxon:output 'omit-xml-declaration=yes';
declare option saxon:output 'item-separator=';
let $nl := '
'
return ("// initial values of model ",data(doc("../bin/BurkhoffModel.Parts.Hemodynamics_init.xml")/fmiModelDescription/@modelName ),$nl)
for $x in doc("../bin/BurkhoffModel.Parts.Hemodynamics_init.xml")/fmiModelDescription/ModelVariables/ScalarVariable
where fn:ends-with($x/@name,".k")
return (data($x/@name)," = ",data($x/Real/@start),$nl)  