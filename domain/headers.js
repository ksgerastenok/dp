//******************************************************************************************************************//
//***                                   IBM MQ Header Parser for IBM DataPower                                   ***//
//******************************************************************************************************************//
function parseHeader(buffer, mode) {
	if (buffer.length == 0) {
		return String();
	}

	switch (mode) {
		case String("LEXQH1"): {
			return String()
				.concat("<MQXQH>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32LE().toString(10))
				.concat("</Version>")
				.concat("<RemoteQName>")
				.concat(buffer.slice(8, 56).toString("utf-8"))
				.concat("</RemoteQName>")
				.concat("<RemoteQMgrName>")
				.concat(buffer.slice(56, 104).toString("utf-8"))
				.concat("</RemoteQMgrName>")
				.concat("<MsgDesc>")
				.concat("<StrucId>")
				.concat(buffer.slice(104, 108).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(108, 112).readInt32LE().toString(10))
				.concat("</Version>")
				.concat("<Report>")
				.concat(buffer.slice(112, 116).readInt32LE().toString(10))
				.concat("</Report>")
				.concat("<MsgType>")
				.concat(buffer.slice(116, 120).readInt32LE().toString(10))
				.concat("</MsgType>")
				.concat("<Expiry>")
				.concat(buffer.slice(120, 124).readInt32LE().toString(10))
				.concat("</Expiry>")
				.concat("<Feedback>")
				.concat(buffer.slice(124, 128).readInt32LE().toString(10))
				.concat("</Feedback>")
				.concat("<Encoding>")
				.concat(buffer.slice(128, 132).readInt32LE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(132, 136).readInt32LE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(136, 144).toString("utf-8"))
				.concat("</Format>")
				.concat("<Priority>")
				.concat(buffer.slice(144, 148).readInt32LE().toString(10))
				.concat("</Priority>")
				.concat("<Persistence>")
				.concat(buffer.slice(148, 152).readInt32LE().toString(10))
				.concat("</Persistence>")
				.concat("<MsgId>")
				.concat(buffer.slice(152, 176).toString("hex"))
				.concat("</MsgId>")
				.concat("<CorrelId>")
				.concat(buffer.slice(176, 200).toString("hex"))
				.concat("</CorrelId>")
				.concat("<BackoutCount>")
				.concat(buffer.slice(200, 204).readInt32LE().toString(10))
				.concat("</BackoutCount>")
				.concat("<ReplyToQ>")
				.concat(buffer.slice(204, 252).toString("utf-8"))
				.concat("</ReplyToQ>")
				.concat("<ReplyToQMgr>")
				.concat(buffer.slice(252, 300).toString("utf-8"))
				.concat("</ReplyToQMgr>")
				.concat("<UserIdentifier>")
				.concat(buffer.slice(300, 312).toString("utf-8"))
				.concat("</UserIdentifier>")
				.concat("<AccountingToken>")
				.concat(buffer.slice(312, 344).toString("hex"))
				.concat("</AccountingToken>")
				.concat("<ApplIdentityData>")
				.concat(buffer.slice(344, 376).toString("utf-8"))
				.concat("</ApplIdentityData>")
				.concat("<PutApplType>")
				.concat(buffer.slice(376, 380).readInt32LE().toString(10))
				.concat("</PutApplType>")
				.concat("<PutApplName>")
				.concat(buffer.slice(380, 408).toString("utf-8"))
				.concat("</PutApplName>")
				.concat("<PutDate>")
				.concat(buffer.slice(408, 416).toString("utf-8"))
				.concat("</PutDate>")
				.concat("<PutTime>")
				.concat(buffer.slice(416, 424).toString("utf-8"))
				.concat("</PutTime>")
				.concat("<ApplOriginData>")
				.concat(buffer.slice(424, 428).toString("utf-8"))
				.concat("</ApplOriginData>")
				.concat("</MsgDesc>")
				.concat("</MQXQH>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("BEXQH1"): {
			return String()
				.concat("<MQXQH>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32BE().toString(10))
				.concat("</Version>")
				.concat("<RemoteQName>")
				.concat(buffer.slice(8, 56).toString("utf-8"))
				.concat("</RemoteQName>")
				.concat("<RemoteQMgrName>")
				.concat(buffer.slice(56, 104).toString("utf-8"))
				.concat("</RemoteQMgrName>")
				.concat("<MsgDesc>")
				.concat("<StrucId>")
				.concat(buffer.slice(104, 108).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(108, 112).readInt32BE().toString(10))
				.concat("</Version>")
				.concat("<Report>")
				.concat(buffer.slice(112, 116).readInt32BE().toString(10))
				.concat("</Report>")
				.concat("<MsgType>")
				.concat(buffer.slice(116, 120).readInt32BE().toString(10))
				.concat("</MsgType>")
				.concat("<Expiry>")
				.concat(buffer.slice(120, 124).readInt32BE().toString(10))
				.concat("</Expiry>")
				.concat("<Feedback>")
				.concat(buffer.slice(124, 128).readInt32BE().toString(10))
				.concat("</Feedback>")
				.concat("<Encoding>")
				.concat(buffer.slice(128, 132).readInt32BE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(132, 136).readInt32BE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(136, 144).toString("utf-8"))
				.concat("</Format>")
				.concat("<Priority>")
				.concat(buffer.slice(144, 148).readInt32BE().toString(10))
				.concat("</Priority>")
				.concat("<Persistence>")
				.concat(buffer.slice(148, 152).readInt32BE().toString(10))
				.concat("</Persistence>")
				.concat("<MsgId>")
				.concat(buffer.slice(152, 176).toString("hex"))
				.concat("</MsgId>")
				.concat("<CorrelId>")
				.concat(buffer.slice(176, 200).toString("hex"))
				.concat("</CorrelId>")
				.concat("<BackoutCount>")
				.concat(buffer.slice(200, 204).readInt32BE().toString(10))
				.concat("</BackoutCount>")
				.concat("<ReplyToQ>")
				.concat(buffer.slice(204, 252).toString("utf-8"))
				.concat("</ReplyToQ>")
				.concat("<ReplyToQMgr>")
				.concat(buffer.slice(252, 300).toString("utf-8"))
				.concat("</ReplyToQMgr>")
				.concat("<UserIdentifier>")
				.concat(buffer.slice(300, 312).toString("utf-8"))
				.concat("</UserIdentifier>")
				.concat("<AccountingToken>")
				.concat(buffer.slice(312, 344).toString("hex"))
				.concat("</AccountingToken>")
				.concat("<ApplIdentityData>")
				.concat(buffer.slice(344, 376).toString("utf-8"))
				.concat("</ApplIdentityData>")
				.concat("<PutApplType>")
				.concat(buffer.slice(376, 380).readInt32BE().toString(10))
				.concat("</PutApplType>")
				.concat("<PutApplName>")
				.concat(buffer.slice(380, 408).toString("utf-8"))
				.concat("</PutApplName>")
				.concat("<PutDate>")
				.concat(buffer.slice(408, 416).toString("utf-8"))
				.concat("</PutDate>")
				.concat("<PutTime>")
				.concat(buffer.slice(416, 424).toString("utf-8"))
				.concat("</PutTime>")
				.concat("<ApplOriginData>")
				.concat(buffer.slice(424, 428).toString("utf-8"))
				.concat("</ApplOriginData>")
				.concat("</MsgDesc>")
				.concat("</MQXQH>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("LEXQH2"): {
			return String()
				.concat("<MQXQH>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32LE().toString(10))
				.concat("</Version>")
				.concat("<RemoteQName>")
				.concat(buffer.slice(8, 56).toString("utf-8"))
				.concat("</RemoteQName>")
				.concat("<RemoteQMgrName>")
				.concat(buffer.slice(56, 104).toString("utf-8"))
				.concat("</RemoteQMgrName>")
				.concat("<MsgDesc>")
				.concat("<StrucId>")
				.concat(buffer.slice(104, 108).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(108, 112).readInt32LE().toString(10))
				.concat("</Version>")
				.concat("<Report>")
				.concat(buffer.slice(112, 116).readInt32LE().toString(10))
				.concat("</Report>")
				.concat("<MsgType>")
				.concat(buffer.slice(116, 120).readInt32LE().toString(10))
				.concat("</MsgType>")
				.concat("<Expiry>")
				.concat(buffer.slice(120, 124).readInt32LE().toString(10))
				.concat("</Expiry>")
				.concat("<Feedback>")
				.concat(buffer.slice(124, 128).readInt32LE().toString(10))
				.concat("</Feedback>")
				.concat("<Encoding>")
				.concat(buffer.slice(128, 132).readInt32LE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(132, 136).readInt32LE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(136, 144).toString("utf-8"))
				.concat("</Format>")
				.concat("<Priority>")
				.concat(buffer.slice(144, 148).readInt32LE().toString(10))
				.concat("</Priority>")
				.concat("<Persistence>")
				.concat(buffer.slice(148, 152).readInt32LE().toString(10))
				.concat("</Persistence>")
				.concat("<MsgId>")
				.concat(buffer.slice(152, 176).toString("hex"))
				.concat("</MsgId>")
				.concat("<CorrelId>")
				.concat(buffer.slice(176, 200).toString("hex"))
				.concat("</CorrelId>")
				.concat("<BackoutCount>")
				.concat(buffer.slice(200, 204).readInt32LE().toString(10))
				.concat("</BackoutCount>")
				.concat("<ReplyToQ>")
				.concat(buffer.slice(204, 252).toString("utf-8"))
				.concat("</ReplyToQ>")
				.concat("<ReplyToQMgr>")
				.concat(buffer.slice(252, 300).toString("utf-8"))
				.concat("</ReplyToQMgr>")
				.concat("<UserIdentifier>")
				.concat(buffer.slice(300, 312).toString("utf-8"))
				.concat("</UserIdentifier>")
				.concat("<AccountingToken>")
				.concat(buffer.slice(312, 344).toString("hex"))
				.concat("</AccountingToken>")
				.concat("<ApplIdentityData>")
				.concat(buffer.slice(344, 376).toString("utf-8"))
				.concat("</ApplIdentityData>")
				.concat("<PutApplType>")
				.concat(buffer.slice(376, 380).readInt32LE().toString(10))
				.concat("</PutApplType>")
				.concat("<PutApplName>")
				.concat(buffer.slice(380, 408).toString("utf-8"))
				.concat("</PutApplName>")
				.concat("<PutDate>")
				.concat(buffer.slice(408, 416).toString("utf-8"))
				.concat("</PutDate>")
				.concat("<PutTime>")
				.concat(buffer.slice(416, 424).toString("utf-8"))
				.concat("</PutTime>")
				.concat("<ApplOriginData>")
				.concat(buffer.slice(424, 428).toString("utf-8"))
				.concat("</ApplOriginData>")
				.concat("<GroupId>")
				.concat(buffer.slice(428, 452).toString("hex"))
				.concat("</GroupId>")
				.concat("<MsgSeqNumber>")
				.concat(buffer.slice(452, 456).readInt32LE().toString(10))
				.concat("</MsgSeqNumber>")
				.concat("<Offset>")
				.concat(buffer.slice(456, 460).readInt32LE().toString(10))
				.concat("</Offset>")
				.concat("<MsgFlags>")
				.concat(buffer.slice(460, 464).readInt32LE().toString(10))
				.concat("</MsgFlags>")
				.concat("<OriginalLength>")
				.concat(buffer.slice(464, 468).readInt32LE().toString(10))
				.concat("</OriginalLength>")
				.concat("</MsgDesc>")
				.concat("</MQXQH>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("BEXQH2"): {
			return String()
				.concat("<MQXQH>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32BE().toString(10))
				.concat("</Version>")
				.concat("<RemoteQName>")
				.concat(buffer.slice(8, 56).toString("utf-8"))
				.concat("</RemoteQName>")
				.concat("<RemoteQMgrName>")
				.concat(buffer.slice(56, 104).toString("utf-8"))
				.concat("</RemoteQMgrName>")
				.concat("<MsgDesc>")
				.concat("<StrucId>")
				.concat(buffer.slice(104, 108).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(108, 112).readInt32BE().toString(10))
				.concat("</Version>")
				.concat("<Report>")
				.concat(buffer.slice(112, 116).readInt32BE().toString(10))
				.concat("</Report>")
				.concat("<MsgType>")
				.concat(buffer.slice(116, 120).readInt32BE().toString(10))
				.concat("</MsgType>")
				.concat("<Expiry>")
				.concat(buffer.slice(120, 124).readInt32BE().toString(10))
				.concat("</Expiry>")
				.concat("<Feedback>")
				.concat(buffer.slice(124, 128).readInt32BE().toString(10))
				.concat("</Feedback>")
				.concat("<Encoding>")
				.concat(buffer.slice(128, 132).readInt32BE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(132, 136).readInt32BE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(136, 144).toString("utf-8"))
				.concat("</Format>")
				.concat("<Priority>")
				.concat(buffer.slice(144, 148).readInt32BE().toString(10))
				.concat("</Priority>")
				.concat("<Persistence>")
				.concat(buffer.slice(148, 152).readInt32BE().toString(10))
				.concat("</Persistence>")
				.concat("<MsgId>")
				.concat(buffer.slice(152, 176).toString("hex"))
				.concat("</MsgId>")
				.concat("<CorrelId>")
				.concat(buffer.slice(176, 200).toString("hex"))
				.concat("</CorrelId>")
				.concat("<BackoutCount>")
				.concat(buffer.slice(200, 204).readInt32BE().toString(10))
				.concat("</BackoutCount>")
				.concat("<ReplyToQ>")
				.concat(buffer.slice(204, 252).toString("utf-8"))
				.concat("</ReplyToQ>")
				.concat("<ReplyToQMgr>")
				.concat(buffer.slice(252, 300).toString("utf-8"))
				.concat("</ReplyToQMgr>")
				.concat("<UserIdentifier>")
				.concat(buffer.slice(300, 312).toString("utf-8"))
				.concat("</UserIdentifier>")
				.concat("<AccountingToken>")
				.concat(buffer.slice(312, 344).toString("hex"))
				.concat("</AccountingToken>")
				.concat("<ApplIdentityData>")
				.concat(buffer.slice(344, 376).toString("utf-8"))
				.concat("</ApplIdentityData>")
				.concat("<PutApplType>")
				.concat(buffer.slice(376, 380).readInt32BE().toString(10))
				.concat("</PutApplType>")
				.concat("<PutApplName>")
				.concat(buffer.slice(380, 408).toString("utf-8"))
				.concat("</PutApplName>")
				.concat("<PutDate>")
				.concat(buffer.slice(408, 416).toString("utf-8"))
				.concat("</PutDate>")
				.concat("<PutTime>")
				.concat(buffer.slice(416, 424).toString("utf-8"))
				.concat("</PutTime>")
				.concat("<ApplOriginData>")
				.concat(buffer.slice(424, 428).toString("utf-8"))
				.concat("</ApplOriginData>")
				.concat("<GroupId>")
				.concat(buffer.slice(428, 452).toString("hex"))
				.concat("</GroupId>")
				.concat("<MsgSeqNumber>")
				.concat(buffer.slice(452, 456).readInt32BE().toString(10))
				.concat("</MsgSeqNumber>")
				.concat("<Offset>")
				.concat(buffer.slice(456, 460).readInt32BE().toString(10))
				.concat("</Offset>")
				.concat("<MsgFlags>")
				.concat(buffer.slice(460, 464).readInt32BE().toString(10))
				.concat("</MsgFlags>")
				.concat("<OriginalLength>")
				.concat(buffer.slice(464, 468).readInt32BE().toString(10))
				.concat("</OriginalLength>")
				.concat("</MsgDesc>")
				.concat("</MQXQH>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("LEMDE1"): {
			return String()
				.concat("<MQMDE>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32LE().toString(10))
				.concat("</Version>")
				.concat("<StrucLength>")
				.concat(buffer.slice(8, 12).readInt32LE().toString(10))
				.concat("</StrucLength>")
				.concat("<Encoding>")
				.concat(buffer.slice(12, 16).readInt32LE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(16, 20).readInt32LE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(20, 28).toString("utf-8"))
				.concat("</Format>")
				.concat("<Flags>")
				.concat(buffer.slice(28, 32).readInt32LE().toString(10))
				.concat("</Flags>")
				.concat("<GroupId>")
				.concat(buffer.slice(32, 56).toString("hex"))
				.concat("</GroupId>")
				.concat("<MsgSeqNumber>")
				.concat(buffer.slice(56, 60).readInt32LE().toString(10))
				.concat("</MsgSeqNumber>")
				.concat("<Offset>")
				.concat(buffer.slice(60, 64).readInt32LE().toString(10))
				.concat("</Offset>")
				.concat("<MsgFlags>")
				.concat(buffer.slice(64, 68).readInt32LE().toString(10))
				.concat("</MsgFlags>")
				.concat("<OriginalLength>")
				.concat(buffer.slice(68, 72).readInt32LE().toString(10))
				.concat("</OriginalLength>")
				.concat("</MQMDE>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("BEMDE1"): {
			return String()
				.concat("<MQMDE>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32BE().toString(10))
				.concat("</Version>")
				.concat("<StrucLength>")
				.concat(buffer.slice(8, 12).readInt32BE().toString(10))
				.concat("</StrucLength>")
				.concat("<Encoding>")
				.concat(buffer.slice(12, 16).readInt32BE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(16, 20).readInt32BE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(20, 28).toString("utf-8"))
				.concat("</Format>")
				.concat("<Flags>")
				.concat(buffer.slice(28, 32).readInt32BE().toString(10))
				.concat("</Flags>")
				.concat("<GroupId>")
				.concat(buffer.slice(32, 56).toString("hex"))
				.concat("</GroupId>")
				.concat("<MsgSeqNumber>")
				.concat(buffer.slice(56, 60).readInt32BE().toString(10))
				.concat("</MsgSeqNumber>")
				.concat("<Offset>")
				.concat(buffer.slice(60, 64).readInt32BE().toString(10))
				.concat("</Offset>")
				.concat("<MsgFlags>")
				.concat(buffer.slice(64, 68).readInt32BE().toString(10))
				.concat("</MsgFlags>")
				.concat("<OriginalLength>")
				.concat(buffer.slice(68, 72).readInt32BE().toString(10))
				.concat("</OriginalLength>")
				.concat("</MQMDE>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("LEMDE2"): {
			return String()
				.concat("<MQMDE>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32LE().toString(10))
				.concat("</Version>")
				.concat("<StrucLength>")
				.concat(buffer.slice(8, 12).readInt32LE().toString(10))
				.concat("</StrucLength>")
				.concat("<Encoding>")
				.concat(buffer.slice(12, 16).readInt32LE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(16, 20).readInt32LE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(20, 28).toString("utf-8"))
				.concat("</Format>")
				.concat("<Flags>")
				.concat(buffer.slice(28, 32).readInt32LE().toString(10))
				.concat("</Flags>")
				.concat("<GroupId>")
				.concat(buffer.slice(32, 56).toString("hex"))
				.concat("</GroupId>")
				.concat("<MsgSeqNumber>")
				.concat(buffer.slice(56, 60).readInt32LE().toString(10))
				.concat("</MsgSeqNumber>")
				.concat("<Offset>")
				.concat(buffer.slice(60, 64).readInt32LE().toString(10))
				.concat("</Offset>")
				.concat("<MsgFlags>")
				.concat(buffer.slice(64, 68).readInt32LE().toString(10))
				.concat("</MsgFlags>")
				.concat("<OriginalLength>")
				.concat(buffer.slice(68, 72).readInt32LE().toString(10))
				.concat("</OriginalLength>")
				.concat("</MQMDE>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("BEMDE2"): {
			return String()
				.concat("<MQMDE>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32BE().toString(10))
				.concat("</Version>")
				.concat("<StrucLength>")
				.concat(buffer.slice(8, 12).readInt32BE().toString(10))
				.concat("</StrucLength>")
				.concat("<Encoding>")
				.concat(buffer.slice(12, 16).readInt32BE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(16, 20).readInt32BE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(20, 28).toString("utf-8"))
				.concat("</Format>")
				.concat("<Flags>")
				.concat(buffer.slice(28, 32).readInt32BE().toString(10))
				.concat("</Flags>")
				.concat("<GroupId>")
				.concat(buffer.slice(32, 56).toString("hex"))
				.concat("</GroupId>")
				.concat("<MsgSeqNumber>")
				.concat(buffer.slice(56, 60).readInt32BE().toString(10))
				.concat("</MsgSeqNumber>")
				.concat("<Offset>")
				.concat(buffer.slice(60, 64).readInt32BE().toString(10))
				.concat("</Offset>")
				.concat("<MsgFlags>")
				.concat(buffer.slice(64, 68).readInt32BE().toString(10))
				.concat("</MsgFlags>")
				.concat("<OriginalLength>")
				.concat(buffer.slice(68, 72).readInt32BE().toString(10))
				.concat("</OriginalLength>")
				.concat("</MQMDE>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("LERFH1"): {
			return String()
				.concat("<MQRFH>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32LE().toString(10))
				.concat("</Version>")
				.concat("<StrucLength>")
				.concat(buffer.slice(8, 12).readInt32LE().toString(10))
				.concat("</StrucLength>")
				.concat("<Encoding>")
				.concat(buffer.slice(12, 16).readInt32LE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(16, 20).readInt32LE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(20, 28).toString("utf-8"))
				.concat("</Format>")
				.concat("<Flags>")
				.concat(buffer.slice(28, 32).readInt32LE().toString(10))
				.concat("</Flags>")
				.concat("<NameValueString>")
				.concat(parseHeader(buffer.slice(32, buffer.length), mode.concat("X")))
				.concat("</NameValueString>")
				.concat("</MQRFH>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("BERFH1"): {
			return String()
				.concat("<MQRFH>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32BE().toString(10))
				.concat("</Version>")
				.concat("<StrucLength>")
				.concat(buffer.slice(8, 12).readInt32BE().toString(10))
				.concat("</StrucLength>")
				.concat("<Encoding>")
				.concat(buffer.slice(12, 16).readInt32BE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(16, 20).readInt32BE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(20, 28).toString("utf-8"))
				.concat("</Format>")
				.concat("<Flags>")
				.concat(buffer.slice(28, 32).readInt32BE().toString(10))
				.concat("</Flags>")
				.concat("<NameValueString>")
				.concat(parseHeader(buffer.slice(32, buffer.length), mode.concat("X")))
				.concat("</NameValueString>")
				.concat("</MQRFH>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("LERFH2"): {
			return String()
				.concat("<MQRFH2>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32LE().toString(10))
				.concat("</Version>")
				.concat("<StrucLength>")
				.concat(buffer.slice(8, 12).readInt32LE().toString(10))
				.concat("</StrucLength>")
				.concat("<Encoding>")
				.concat(buffer.slice(12, 16).readInt32LE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(16, 20).readInt32LE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(20, 28).toString("utf-8"))
				.concat("</Format>")
				.concat("<Flags>")
				.concat(buffer.slice(28, 32).readInt32LE().toString(10))
				.concat("</Flags>")
				.concat("<NameValueCCSID>")
				.concat(buffer.slice(32, 36).readInt32LE().toString(10))
				.concat("</NameValueCCSID>")
				.concat("<NameValueData>")
				.concat(parseHeader(buffer.slice(36, buffer.length), mode.concat("X")))
				.concat("</NameValueData>")
				.concat("</MQRFH2>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("BERFH2"): {
			return String()
				.concat("<MQRFH2>")
				.concat("<StrucId>")
				.concat(buffer.slice(0, 4).toString("utf-8"))
				.concat("</StrucId>")
				.concat("<Version>")
				.concat(buffer.slice(4, 8).readInt32BE().toString(10))
				.concat("</Version>")
				.concat("<StrucLength>")
				.concat(buffer.slice(8, 12).readInt32BE().toString(10))
				.concat("</StrucLength>")
				.concat("<Encoding>")
				.concat(buffer.slice(12, 16).readInt32BE().toString(10))
				.concat("</Encoding>")
				.concat("<CodedCharSetId>")
				.concat(buffer.slice(16, 20).readInt32BE().toString(10))
				.concat("</CodedCharSetId>")
				.concat("<Format>")
				.concat(buffer.slice(20, 28).toString("utf-8"))
				.concat("</Format>")
				.concat("<Flags>")
				.concat(buffer.slice(28, 32).readInt32BE().toString(10))
				.concat("</Flags>")
				.concat("<NameValueCCSID>")
				.concat(buffer.slice(32, 36).readInt32BE().toString(10))
				.concat("</NameValueCCSID>")
				.concat("<NameValueData>")
				.concat(parseHeader(buffer.slice(36, buffer.length), mode.concat("X")))
				.concat("</NameValueData>")
				.concat("</MQRFH2>")
				.concat(parseHeader(buffer.slice(buffer.length, buffer.length), mode));
		}
		case String("LERFH1X"): {
			return String()
				.concat("<NameValue>")
				.concat("<Name>")
				.concat(buffer.toString("utf-8").split(" ")[0])
				.concat("</Name>")
				.concat("<Value>")
				.concat(buffer.toString("utf-8").split(" ")[1])
				.concat("</Value>")
				.concat("</NameValue>")
				.concat(parseHeader(buffer.slice(buffer.toString("utf-8").split(" ")[0].length + 1 + buffer.toString("utf-8").split(" ")[1].length + 1, buffer.length), mode));
		}
		case String("BERFH1X"): {
			return String()
				.concat("<NameValue>")
				.concat("<Name>")
				.concat(buffer.toString("utf-8").split(" ")[0])
				.concat("</Name>")
				.concat("<Value>")
				.concat(buffer.toString("utf-8").split(" ")[1])
				.concat("</Value>")
				.concat("</NameValue>")
				.concat(parseHeader(buffer.slice(buffer.toString("utf-8").split(" ")[0].length + 1 + buffer.toString("utf-8").split(" ")[1].length + 1, buffer.length), mode));
		}
		case String("LERFH2X"): {
			return String()
				.concat("<NameValue>")
				.concat(buffer.slice(4, 4 + buffer.slice(0, 4).readInt32LE()).toString("utf-8"))
				.concat("</NameValue>")
				.concat(parseHeader(buffer.slice(4 + buffer.slice(0, 4).readInt32LE(), buffer.length), mode));
		}
		case String("BERFH2X"): {
			return String()
				.concat("<NameValue>")
				.concat(buffer.slice(4, 4 + buffer.slice(0, 4).readInt32BE()).toString("utf-8"))
				.concat("</NameValue>")
				.concat(parseHeader(buffer.slice(4 + buffer.slice(0, 4).readInt32BE(), buffer.length), mode));
		}
		default: {
			return String();
		}
	}
}

function parseBuffer(buffer) {
	if (buffer.length == 0) {
		return buffer;
	}

	switch (buffer.slice(0, 8).toString("hex")) {
		case String("5851482001000000"): {
			require("header-metadata").current.set("MQXQH", parseHeader(buffer.slice(0, 428), "LEXQH1"));
			return parseBuffer(buffer.slice(428, buffer.length));
		}
		case String("5851482000000001"): {
			require("header-metadata").current.set("MQXQH", parseHeader(buffer.slice(0, 428), "BEXQH1"));
			return parseBuffer(buffer.slice(428, buffer.length));
		}
		case String("5851482002000000"): {
			require("header-metadata").current.set("MQXQH", parseHeader(buffer.slice(0, 468), "LEXQH2"));
			return parseBuffer(buffer.slice(468, buffer.length));
		}
		case String("5851482000000002"): {
			require("header-metadata").current.set("MQXQH", parseHeader(buffer.slice(0, 468), "BEXQH2"));
			return parseBuffer(buffer.slice(468, buffer.length));
		}
		case String("4d44452001000000"): {
			require("header-metadata").current.set("MQMDE", parseHeader(buffer.slice(0, buffer.slice(8, 12).readInt32LE()), "LEMDE1"));
			return parseBuffer(buffer.slice(buffer.slice(8, 12).readInt32LE(), buffer.length));
		}
		case String("4d44452000000001"): {
			require("header-metadata").current.set("MQMDE", parseHeader(buffer.slice(0, buffer.slice(8, 12).readInt32BE()), "BEMDE1"));
			return parseBuffer(buffer.slice(buffer.slice(8, 12).readInt32BE(), buffer.length));
		}
		case String("4d44452002000000"): {
			require("header-metadata").current.set("MQMDE", parseHeader(buffer.slice(0, buffer.slice(8, 12).readInt32LE()), "LEMDE2"));
			return parseBuffer(buffer.slice(buffer.slice(8, 12).readInt32LE(), buffer.length));
		}
		case String("4d44452000000002"): {
			require("header-metadata").current.set("MQMDE", parseHeader(buffer.slice(0, buffer.slice(8, 12).readInt32BE()), "BEMDE2"));
			return parseBuffer(buffer.slice(buffer.slice(8, 12).readInt32BE(), buffer.length));
		}
		case String("5246482001000000"): {
			require("header-metadata").current.set("MQRFH", parseHeader(buffer.slice(0, buffer.slice(8, 12).readInt32LE()), "LERFH1"));
			return parseBuffer(buffer.slice(buffer.slice(8, 12).readInt32LE(), buffer.length));
		}
		case String("5246482000000001"): {
			require("header-metadata").current.set("MQRFH", parseHeader(buffer.slice(0, buffer.slice(8, 12).readInt32BE()), "BERFH1"));
			return parseBuffer(buffer.slice(buffer.slice(8, 12).readInt32BE(), buffer.length));
		}
		case String("5246482002000000"): {
			require("header-metadata").current.set("MQRFH2", parseHeader(buffer.slice(0, buffer.slice(8, 12).readInt32LE()), "LERFH2"));
			return parseBuffer(buffer.slice(buffer.slice(8, 12).readInt32LE(), buffer.length));
		}
		case String("5246482000000002"): {
			require("header-metadata").current.set("MQRFH2", parseHeader(buffer.slice(0, buffer.slice(8, 12).readInt32BE()), "BERFH2"));
			return parseBuffer(buffer.slice(buffer.slice(8, 12).readInt32BE(), buffer.length));
		}
		default: {
			return buffer;
		}
	}
}

{
	session.input.readAsBuffer(
		function (error, buffer) {
			if (error != null) {
				session.reject(error.message);
			}
			session.output.write(parseBuffer(buffer));
		}
	);
}
