//********************************************************************************************************************//
//***                                       SQL Injection Filter for DataPower                                     ***//
//********************************************************************************************************************//
function jsonToArray(data) {
	var result, i;

	result = Array();

	if((data != null)) {
		if((data.constructor == Object)) {
			for(i in data) {
				result = result.concat(jsonToArray(data[i]));
			}
		}
		if((data.constructor != Object) && (data.constructor != Array)) {
			for(i = 0; i != 1; i += 1) {
				result = result.concat(data.toString());
			}
		}
		if((data.constructor == Array)) {
			for(i in data) {
				result = result.concat(jsonToArray(data[i]));
			}
		}
	}

	return(result);
}

function xmlToArray(data) {
	var result, i;

	result = Array();

	if((data != null)) {
		if((data.attributes != null)) {
		        for(i = 0; i != data.attributes.length; i += 1) {
				result = result.concat(xmlToArray(data.attributes.item(i)));
			}
		}
		if((data.nodeType == 2) || (data.nodeType == 3)) {
		        for(i = 0; i != 1; i += 1) {
				result = result.concat(data.nodeValue.toString());
			}
		}
		if((data.childNodes != null)) {
		        for(i = 0; i != data.childNodes.length; i += 1) {
				result = result.concat(xmlToArray(data.childNodes.item(i)));
			}
		}
	}

	return(result);
}

function textToArray(data) {
	var result, i;

	result = Array();

        if((data != null)) {
		result = result.concat(data.split("\n").join(";").split(";").join("&").split("&").join(" ").split(" ").join("|").split("|").join("=").split("=").join("\t").split("\t"));
	}

	return(result);
}

function Process(data) {
	require("fs").readFile(session.parameters.SQLPatternFile, function(error, buffer) {
		var result, k, i;

	        result = XML.parse(buffer.toString("utf-8")).documentElement.getElementsByTagName("pattern");

		for(i = 0; i != result.length; i += 1) {
			if((result.item(i).attributes.getNamedItem("type") != null) && (String(result.item(i).attributes.getNamedItem("type").nodeValue) == String("element"))) {
				for(k = 0; k != data.length; k += 1) {
					if((data[k].match(result.item(i).getElementsByTagName("regex").item(0).textContent) != null)) {
						session.reject("VALUE: " + data[k] + "; " + "NAME: " + result.item(i).getElementsByTagName("name").item(0).textContent + "; " + "REGEX: " + result.item(i).getElementsByTagName("regex").item(0).textContent + ".");
					}
				}
			}
			if((result.item(i).attributes.getNamedItem("type") == null) || (String(result.item(i).attributes.getNamedItem("type").nodeValue) == String("global"))) {
				for(k = 0; k != 1; k += 1) {
					if((data.join(" ").match(result.item(i).getElementsByTagName("regex").item(0).textContent) != null)) {
						session.reject("VALUE: " + data.join(" ") + "; " + "NAME: " + result.item(i).getElementsByTagName("name").item(0).textContent + "; " + "REGEX: " + result.item(i).getElementsByTagName("regex").item(0).textContent + ".");
					}
				}
			}
		}

		return(result);
	});

	return(data);
}

function Main() {
	session.input.readAsBuffer(function(error, buffer) {
		var result;

		result = null;

		if((result == null)) {
			try {
				result = Process(jsonToArray(JSON.parse(buffer.toString('utf-8'))));
			} catch(ex) {
				result = null;
			}
		}
		if((result == null)) {
			try {
				result = Process(xmlToArray(XML.parse(buffer.toString('utf-8'))));
			} catch(ex) {
				result = null;
			}
		}
		if((result == null)) {
			try {
				result = Process(textToArray(String(buffer.toString('utf-8'))));
			} catch(ex) {
				result = null;
			}
		}

		return(result);
	});

	return(null);
}

Main();
