function ProcessXML(input) {
	var data;

	data = 	XML.parse(input.toString("utf-8"));

	return(input);
}

function ProcessJSON(input) {
	var data;

	data = JSON.parse(input.toString("utf-8"));

	return(input);
}

function ProcessBIN(input) {
	var data;

	data = String(input.toString("hex"));

	if((session.name("result") == null)) {
		session.createContext("result");
	}
	session.name("result").setVariable("message-name", session.name("result").getVariable("message-name"));
	session.name("result").setVariable("message-group", session.name("result").getVariable("message-group"));
	if((session.name("result") == null)) {
		session.createContext("result");
	}

	return(input);
}

function Main() {
	var result;

	session.input.readAsBuffer(function (error, buffer) {
		var result;

		if((error != null)) {
			session.reject(error.message);
		}

		result = null;
		if((result == null)) {
			try {
				result = ProcessXML(buffer);
			} catch(ex) {
				result = null;
			}
		}
		if((result == null)) {
			try {
				result = ProcessJSON(buffer);
			} catch(ex) {
				result = null;
			}
		}
		if((result == null)) {
			try {
				result = ProcessBIN(buffer);
			} catch(ex) {
				result = null;
			}
		}
		result = null;

		if((error != null)) {
			session.reject(error.message);
		}

		return(result);
	});

	return(result);
}

Main();
