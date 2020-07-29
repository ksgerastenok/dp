//********************************************************************************************************************//
//***                                      Response Code Checker for DataPower                                     ***//
//********************************************************************************************************************//
function CheckCode(input) {
	var result;

	result = String();

	if((session.name("result") == null)) {
		session.createContext("result");
	}
	if((input != null)) {
		if((input.length != 0)) {
			session.name("result").setVariable("response-code", input);
		}
	}
	if((session.name("result") == null)) {
		session.createContext("result");
	}
	if((session.name("result").getVariable("response-code") != null)) {
		switch(session.name("result").getVariable("response-code")) {
			case String("200"): {
				result = String();
			}
			break;
			case String("302"): {
				result = String();
			}
			break;
			case String("307"): {
				result = String();
			}
			break;
			case String("500"): {
				result = String();
			}
			break;
			default: {
				result = String(session.name("result").getVariable("response-code"));
			}
			break;
		}
	}

	if((require("service-metadata").errorCode == "0x00000000")) {
		if((result.length != 0)) {
			session.reject(result);
		}
	}

	return(result);
}

function CheckData(input) {
	var result;

	result = String();

	if((session.name("result") == null)) {
		session.createContext("result");
	}
	if((input != null)) {
		if((input.length != 0)) {
			session.name("result").setVariable("message-src", input);
		}
	}
	if((session.name("result") == null)) {
		session.createContext("result");
	}
	if((session.name("result").getVariable("message-src") != null)) {
		switch(session.name("result").getVariable("message-src")) {
			case String(""): {
				result = String();
			}
			break;
			default: {
				result = String(session.name("result").getVariable("message-src"));
			}
			break;
		}
	}

	if((require("service-metadata").errorCode == "0x00000000")) {
		if((result.length != 0)) {
			console.log(result);
		}
	}

	return(result);
}

function CheckResult(input) {
	var result;
	
	result = CheckCode(require("header-metadata").current.statusCode);
	result = CheckData(input);

	return(result);
}

function Main() {
	var result;

	session.input.readAsBuffer(function (error, buffer) {
		var result;

		if((error != null)) {
			session.reject(error.message);
		}
		session.output.write(Buffer(CheckResult(buffer.toString("base64")), "base64"));

		return(result);
	});

	return(result);
}

Main();
