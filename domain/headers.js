//********************************************************************************************************************//
//***                                        MQ Header Parser for DataPower                                        ***//
//********************************************************************************************************************//
function ParseHDR(data, mode) {
	var result, length;

	length = 0;
	result = String();
	if((data.length != 0)) {
		switch(mode) {
			case String("LEXQH1"): {
				length += data.length / 2;
				result += Buffer("<MQXQH>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<RemoteQName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 96), "hex").toString("utf-8");
				result += Buffer("</RemoteQName>", "utf-8").toString("utf-8");
				result += Buffer("<RemoteQMgrName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(112, 96), "hex").toString("utf-8");
				result += Buffer("</RemoteQMgrName>", "utf-8").toString("utf-8");
				result += Buffer("<MsgDesc>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(208, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(216, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<Report>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(224, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Report>", "utf-8").toString("utf-8");
				result += Buffer("<MsgType>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(232, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</MsgType>", "utf-8").toString("utf-8");
				result += Buffer("<Expiry>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(240, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Expiry>", "utf-8").toString("utf-8");
				result += Buffer("<Feedback>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(248, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Feedback>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(256, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(264, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(272, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Priority>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(288, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Priority>", "utf-8").toString("utf-8");
				result += Buffer("<Persistence>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(296, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Persistence>", "utf-8").toString("utf-8");
				result += Buffer("<MsgId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(304, 48), "hex").toString("hex");
				result += Buffer("</MsgId>", "utf-8").toString("utf-8");
				result += Buffer("<CorrelId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(352, 48), "hex").toString("hex");
				result += Buffer("</CorrelId>", "utf-8").toString("utf-8");
				result += Buffer("<BackoutCount>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(400, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</BackoutCount>", "utf-8").toString("utf-8");
				result += Buffer("<ReplyToQ>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(408, 96), "hex").toString("utf-8");
				result += Buffer("</ReplyToQ>", "utf-8").toString("utf-8");
				result += Buffer("<ReplyToQMgr>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(504, 96), "hex").toString("utf-8");
				result += Buffer("</ReplyToQMgr>", "utf-8").toString("utf-8");
				result += Buffer("<UserIdentifier>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(600, 24), "hex").toString("utf-8");
				result += Buffer("</UserIdentifier>", "utf-8").toString("utf-8");
				result += Buffer("<AccountingToken>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(624, 64), "hex").toString("hex");
				result += Buffer("</AccountingToken>", "utf-8").toString("utf-8");
				result += Buffer("<ApplIdentityData>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(688, 64), "hex").toString("utf-8");
				result += Buffer("</ApplIdentityData>", "utf-8").toString("utf-8");
				result += Buffer("<PutApplType>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(752, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</PutApplType>", "utf-8").toString("utf-8");
				result += Buffer("<PutApplName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(760, 56), "hex").toString("utf-8");
				result += Buffer("</PutApplName>", "utf-8").toString("utf-8");
				result += Buffer("<PutDate>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(816, 16), "hex").toString("utf-8");
				result += Buffer("</PutDate>", "utf-8").toString("utf-8");
				result += Buffer("<PutTime>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(832, 16), "hex").toString("utf-8");
				result += Buffer("</PutTime>", "utf-8").toString("utf-8");
				result += Buffer("<ApplOriginData>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(848, 8), "hex").toString("utf-8");
				result += Buffer("</ApplOriginData>", "utf-8").toString("utf-8");
				result += Buffer("</MsgDesc>", "utf-8").toString("utf-8");
				result += Buffer("</MQXQH>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "LEXQH1");
			}
			break;
			case String("BEXQH1"): {
				length += data.length / 2;
				result += Buffer("<MQXQH>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<RemoteQName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 96), "hex").toString("utf-8");
				result += Buffer("</RemoteQName>", "utf-8").toString("utf-8");
				result += Buffer("<RemoteQMgrName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(112, 96), "hex").toString("utf-8");
				result += Buffer("</RemoteQMgrName>", "utf-8").toString("utf-8");
				result += Buffer("<MsgDesc>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(208, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(216, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<Report>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(224, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Report>", "utf-8").toString("utf-8");
				result += Buffer("<MsgType>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(232, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</MsgType>", "utf-8").toString("utf-8");
				result += Buffer("<Expiry>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(240, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Expiry>", "utf-8").toString("utf-8");
				result += Buffer("<Feedback>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(248, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Feedback>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(256, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(264, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(272, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Priority>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(288, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Priority>", "utf-8").toString("utf-8");
				result += Buffer("<Persistence>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(296, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Persistence>", "utf-8").toString("utf-8");
				result += Buffer("<MsgId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(304, 48), "hex").toString("hex");
				result += Buffer("</MsgId>", "utf-8").toString("utf-8");
				result += Buffer("<CorrelId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(352, 48), "hex").toString("hex");
				result += Buffer("</CorrelId>", "utf-8").toString("utf-8");
				result += Buffer("<BackoutCount>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(400, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</BackoutCount>", "utf-8").toString("utf-8");
				result += Buffer("<ReplyToQ>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(408, 96), "hex").toString("utf-8");
				result += Buffer("</ReplyToQ>", "utf-8").toString("utf-8");
				result += Buffer("<ReplyToQMgr>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(504, 96), "hex").toString("utf-8");
				result += Buffer("</ReplyToQMgr>", "utf-8").toString("utf-8");
				result += Buffer("<UserIdentifier>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(600, 24), "hex").toString("utf-8");
				result += Buffer("</UserIdentifier>", "utf-8").toString("utf-8");
				result += Buffer("<AccountingToken>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(624, 64), "hex").toString("hex");
				result += Buffer("</AccountingToken>", "utf-8").toString("utf-8");
				result += Buffer("<ApplIdentityData>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(688, 64), "hex").toString("utf-8");
				result += Buffer("</ApplIdentityData>", "utf-8").toString("utf-8");
				result += Buffer("<PutApplType>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(752, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</PutApplType>", "utf-8").toString("utf-8");
				result += Buffer("<PutApplName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(760, 56), "hex").toString("utf-8");
				result += Buffer("</PutApplName>", "utf-8").toString("utf-8");
				result += Buffer("<PutDate>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(816, 16), "hex").toString("utf-8");
				result += Buffer("</PutDate>", "utf-8").toString("utf-8");
				result += Buffer("<PutTime>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(832, 16), "hex").toString("utf-8");
				result += Buffer("</PutTime>", "utf-8").toString("utf-8");
				result += Buffer("<ApplOriginData>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(848, 8), "hex").toString("utf-8");
				result += Buffer("</ApplOriginData>", "utf-8").toString("utf-8");
				result += Buffer("</MsgDesc>", "utf-8").toString("utf-8");
				result += Buffer("</MQXQH>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "BEXQH1");
			}
			break;
			case String("LEXQH2"): {
				length += data.length / 2;
				result += Buffer("<MQXQH>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<RemoteQName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 96), "hex").toString("utf-8");
				result += Buffer("</RemoteQName>", "utf-8").toString("utf-8");
				result += Buffer("<RemoteQMgrName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(112, 96), "hex").toString("utf-8");
				result += Buffer("</RemoteQMgrName>", "utf-8").toString("utf-8");
				result += Buffer("<MsgDesc>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(208, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(216, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<Report>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(224, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Report>", "utf-8").toString("utf-8");
				result += Buffer("<MsgType>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(232, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</MsgType>", "utf-8").toString("utf-8");
				result += Buffer("<Expiry>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(240, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Expiry>", "utf-8").toString("utf-8");
				result += Buffer("<Feedback>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(248, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Feedback>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(256, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(264, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(272, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Priority>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(288, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Priority>", "utf-8").toString("utf-8");
				result += Buffer("<Persistence>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(296, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Persistence>", "utf-8").toString("utf-8");
				result += Buffer("<MsgId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(304, 48), "hex").toString("hex");
				result += Buffer("</MsgId>", "utf-8").toString("utf-8");
				result += Buffer("<CorrelId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(352, 48), "hex").toString("hex");
				result += Buffer("</CorrelId>", "utf-8").toString("utf-8");
				result += Buffer("<BackoutCount>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(400, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</BackoutCount>", "utf-8").toString("utf-8");
				result += Buffer("<ReplyToQ>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(408, 96), "hex").toString("utf-8");
				result += Buffer("</ReplyToQ>", "utf-8").toString("utf-8");
				result += Buffer("<ReplyToQMgr>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(504, 96), "hex").toString("utf-8");
				result += Buffer("</ReplyToQMgr>", "utf-8").toString("utf-8");
				result += Buffer("<UserIdentifier>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(600, 24), "hex").toString("utf-8");
				result += Buffer("</UserIdentifier>", "utf-8").toString("utf-8");
				result += Buffer("<AccountingToken>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(624, 64), "hex").toString("hex");
				result += Buffer("</AccountingToken>", "utf-8").toString("utf-8");
				result += Buffer("<ApplIdentityData>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(688, 64), "hex").toString("utf-8");
				result += Buffer("</ApplIdentityData>", "utf-8").toString("utf-8");
				result += Buffer("<PutApplType>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(752, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</PutApplType>", "utf-8").toString("utf-8");
				result += Buffer("<PutApplName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(760, 56), "hex").toString("utf-8");
				result += Buffer("</PutApplName>", "utf-8").toString("utf-8");
				result += Buffer("<PutDate>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(816, 16), "hex").toString("utf-8");
				result += Buffer("</PutDate>", "utf-8").toString("utf-8");
				result += Buffer("<PutTime>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(832, 16), "hex").toString("utf-8");
				result += Buffer("</PutTime>", "utf-8").toString("utf-8");
				result += Buffer("<ApplOriginData>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(848, 8), "hex").toString("utf-8");
				result += Buffer("</ApplOriginData>", "utf-8").toString("utf-8");
				result += Buffer("<GroupId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(856, 48), "hex").toString("hex");
				result += Buffer("</GroupId>", "utf-8").toString("utf-8");
				result += Buffer("<MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(904, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer("<Offset>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(912, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Offset>", "utf-8").toString("utf-8");
				result += Buffer("<MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(920, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer("<OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(928, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer("</MsgDesc>", "utf-8").toString("utf-8");
				result += Buffer("</MQXQH>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "LEXQH2");
			}
			break;
			case String("BEXQH2"): {
				length += data.length / 2;
				result += Buffer("<MQXQH>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<RemoteQName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 96), "hex").toString("utf-8");
				result += Buffer("</RemoteQName>", "utf-8").toString("utf-8");
				result += Buffer("<RemoteQMgrName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(112, 96), "hex").toString("utf-8");
				result += Buffer("</RemoteQMgrName>", "utf-8").toString("utf-8");
				result += Buffer("<MsgDesc>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(208, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(216, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<Report>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(224, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Report>", "utf-8").toString("utf-8");
				result += Buffer("<MsgType>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(232, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</MsgType>", "utf-8").toString("utf-8");
				result += Buffer("<Expiry>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(240, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Expiry>", "utf-8").toString("utf-8");
				result += Buffer("<Feedback>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(248, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Feedback>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(256, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(264, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(272, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Priority>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(288, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Priority>", "utf-8").toString("utf-8");
				result += Buffer("<Persistence>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(296, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Persistence>", "utf-8").toString("utf-8");
				result += Buffer("<MsgId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(304, 48), "hex").toString("hex");
				result += Buffer("</MsgId>", "utf-8").toString("utf-8");
				result += Buffer("<CorrelId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(352, 48), "hex").toString("hex");
				result += Buffer("</CorrelId>", "utf-8").toString("utf-8");
				result += Buffer("<BackoutCount>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(400, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</BackoutCount>", "utf-8").toString("utf-8");
				result += Buffer("<ReplyToQ>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(408, 96), "hex").toString("utf-8");
				result += Buffer("</ReplyToQ>", "utf-8").toString("utf-8");
				result += Buffer("<ReplyToQMgr>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(504, 96), "hex").toString("utf-8");
				result += Buffer("</ReplyToQMgr>", "utf-8").toString("utf-8");
				result += Buffer("<UserIdentifier>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(600, 24), "hex").toString("utf-8");
				result += Buffer("</UserIdentifier>", "utf-8").toString("utf-8");
				result += Buffer("<AccountingToken>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(624, 64), "hex").toString("hex");
				result += Buffer("</AccountingToken>", "utf-8").toString("utf-8");
				result += Buffer("<ApplIdentityData>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(688, 64), "hex").toString("utf-8");
				result += Buffer("</ApplIdentityData>", "utf-8").toString("utf-8");
				result += Buffer("<PutApplType>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(752, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</PutApplType>", "utf-8").toString("utf-8");
				result += Buffer("<PutApplName>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(760, 56), "hex").toString("utf-8");
				result += Buffer("</PutApplName>", "utf-8").toString("utf-8");
				result += Buffer("<PutDate>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(816, 16), "hex").toString("utf-8");
				result += Buffer("</PutDate>", "utf-8").toString("utf-8");
				result += Buffer("<PutTime>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(832, 16), "hex").toString("utf-8");
				result += Buffer("</PutTime>", "utf-8").toString("utf-8");
				result += Buffer("<ApplOriginData>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(848, 8), "hex").toString("utf-8");
				result += Buffer("</ApplOriginData>", "utf-8").toString("utf-8");
				result += Buffer("<GroupId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(856, 48), "hex").toString("hex");
				result += Buffer("</GroupId>", "utf-8").toString("utf-8");
				result += Buffer("<MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(904, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer("<Offset>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(912, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Offset>", "utf-8").toString("utf-8");
				result += Buffer("<MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(920, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer("<OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(928, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer("</MsgDesc>", "utf-8").toString("utf-8");
				result += Buffer("</MQXQH>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "BEXQH2");
			}
			break;
			case String("LEMDE1"): {
				length += data.length / 2;
				result += Buffer("<MQMDE>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<StrucLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</StrucLength>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(24, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(32, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(40, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Flags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(56, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Flags>", "utf-8").toString("utf-8");
				result += Buffer("<GroupId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(64, 48), "hex").toString("hex");
				result += Buffer("</GroupId>", "utf-8").toString("utf-8");
				result += Buffer("<MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(112, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer("<Offset>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(120, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Offset>", "utf-8").toString("utf-8");
				result += Buffer("<MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(128, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer("<OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(136, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer("</MQMDE>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "LEMDE1");
			}
			break;
			case String("BEMDE1"): {
				length += data.length / 2;
				result += Buffer("<MQMDE>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<StrucLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</StrucLength>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(24, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(32, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(40, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Flags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(56, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Flags>", "utf-8").toString("utf-8");
				result += Buffer("<GroupId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(64, 48), "hex").toString("hex");
				result += Buffer("</GroupId>", "utf-8").toString("utf-8");
				result += Buffer("<MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(112, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer("<Offset>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(120, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Offset>", "utf-8").toString("utf-8");
				result += Buffer("<MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(128, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer("<OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(136, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer("</MQMDE>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "BEMDE1");
			}
			break;
			case String("LEMDE2"): {
				length += data.length / 2;
				result += Buffer("<MQMDE>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<StrucLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</StrucLength>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(24, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(32, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(40, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Flags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(56, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Flags>", "utf-8").toString("utf-8");
				result += Buffer("<GroupId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(64, 48), "hex").toString("hex");
				result += Buffer("</GroupId>", "utf-8").toString("utf-8");
				result += Buffer("<MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(112, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer("<Offset>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(120, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Offset>", "utf-8").toString("utf-8");
				result += Buffer("<MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(128, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer("<OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(136, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer("</MQMDE>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "LEMDE2");
			}
			break;
			case String("BEMDE2"): {
				length += data.length / 2;
				result += Buffer("<MQMDE>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<StrucLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</StrucLength>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(24, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(32, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(40, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Flags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(56, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Flags>", "utf-8").toString("utf-8");
				result += Buffer("<GroupId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(64, 48), "hex").toString("hex");
				result += Buffer("</GroupId>", "utf-8").toString("utf-8");
				result += Buffer("<MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(112, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</MsgSeqNumber>", "utf-8").toString("utf-8");
				result += Buffer("<Offset>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(120, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Offset>", "utf-8").toString("utf-8");
				result += Buffer("<MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(128, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</MsgFlags>", "utf-8").toString("utf-8");
				result += Buffer("<OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(136, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</OriginalLength>", "utf-8").toString("utf-8");
				result += Buffer("</MQMDE>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "BEMDE2");
			}
			break;
			case String("LERFH1"): {
				length += data.length / 2;
				result += Buffer("<MQRFH>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<StrucLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</StrucLength>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(24, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(32, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(40, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Flags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(56, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Flags>", "utf-8").toString("utf-8");
				result += Buffer("<NameValueString>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(64, length * 2 - 64), "LERFH3");
				result += Buffer("</NameValueString>", "utf-8").toString("utf-8");
				result += Buffer("</MQRFH>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "LERFH1");
			}
			break;
			case String("BERFH1"): {
				length += data.length / 2;
				result += Buffer("<MQRFH>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<StrucLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</StrucLength>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(24, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(32, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(40, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Flags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(56, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Flags>", "utf-8").toString("utf-8");
				result += Buffer("<NameValueString>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(64, length * 2 - 64), "BERFH3");
				result += Buffer("</NameValueString>", "utf-8").toString("utf-8");
				result += Buffer("</MQRFH>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "BERFH1");
			}
			break;
			case String("LERFH2"): {
				length += data.length / 2;
				result += Buffer("<MQRFH2>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<StrucLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</StrucLength>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(24, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(32, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(40, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Flags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(56, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</Flags>", "utf-8").toString("utf-8");
				result += Buffer("<NameValueCCSID>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(64, 8), "hex").readInt32LE().toString(10);
				result += Buffer("</NameValueCCSID>", "utf-8").toString("utf-8");
				result += Buffer("<NameValueData>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(72, length * 2 - 72), "LERFH4");
				result += Buffer("</NameValueData>", "utf-8").toString("utf-8");
				result += Buffer("</MQRFH2>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "LERFH2");
			}
			break;
			case String("BERFH2"): {
				length += data.length / 2;
				result += Buffer("<MQRFH2>", "utf-8").toString("utf-8");
				result += Buffer("<StrucId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(0, 8), "hex").toString("utf-8");
				result += Buffer("</StrucId>", "utf-8").toString("utf-8");
				result += Buffer("<Version>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Version>", "utf-8").toString("utf-8");
				result += Buffer("<StrucLength>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(16, 8), "hex").readInt32BE().toString(10) ;
				result += Buffer("</StrucLength>", "utf-8").toString("utf-8");
				result += Buffer("<Encoding>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(24, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Encoding>", "utf-8").toString("utf-8");
				result += Buffer("<CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(32, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</CodedCharSetId>", "utf-8").toString("utf-8");
				result += Buffer("<Format>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(40, 16), "hex").toString("utf-8");
				result += Buffer("</Format>", "utf-8").toString("utf-8");
				result += Buffer("<Flags>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(56, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</Flags>", "utf-8").toString("utf-8");
				result += Buffer("<NameValueCCSID>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(64, 8), "hex").readInt32BE().toString(10);
				result += Buffer("</NameValueCCSID>", "utf-8").toString("utf-8");
				result += Buffer("<NameValueData>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(72, length * 2 - 72), "BERFH4");
				result += Buffer("</NameValueData>", "utf-8").toString("utf-8");
				result += Buffer("</MQRFH2>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), "BERFH2");
			}
			break;
			case String("LERFH3"): {
				length += data.split("20")[0].length / 2 + data.split("20")[1].length / 2;
				result += Buffer("<NameValue>", "utf-8").toString("utf-8");
				result += Buffer("<Name>", "utf-8").toString("utf-8");
				result += Buffer(data.split("20")[0], "hex").toString("utf-8");
				result += Buffer("</Name>", "utf-8").toString("utf-8");
				result += Buffer("<Value>", "utf-8").toString("utf-8");
				result += Buffer(data.split("20")[1], "hex").toString("utf-8");
				result += Buffer("</Value>", "utf-8").toString("utf-8");
				result += Buffer("</NameValue>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(4 + length * 2, data.length - (4 + length * 2)), "LERFH3");
			}
			break;
			case String("BERFH3"): {
				length += data.split("20")[0].length / 2 + data.split("20")[1].length / 2;
				result += Buffer("<NameValue>", "utf-8").toString("utf-8");
				result += Buffer("<Name>", "utf-8").toString("utf-8");
				result += Buffer(data.split("20")[0], "hex").toString("utf-8");
				result += Buffer("</Name>", "utf-8").toString("utf-8");
				result += Buffer("<Value>", "utf-8").toString("utf-8");
				result += Buffer(data.split("20")[1], "hex").toString("utf-8");
				result += Buffer("</Value>", "utf-8").toString("utf-8");
				result += Buffer("</NameValue>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(4 + length * 2, data.length - (4 + length * 2)), "BERFH3");
			}
			break;
			case String("LERFH4"): {
				length += Buffer(data.substr(0, 8), "hex").readInt32LE();
				result += Buffer("<NameValue>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, length * 2), "hex").toString("utf-8");
				result += Buffer("</NameValue>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(8 + length * 2, data.length - (8 + length * 2)), "LERFH4");
			}
			break;
			case String("BERFH4"): {
				length += Buffer(data.substr(0, 8), "hex").readInt32BE();
				result += Buffer("<NameValue>", "utf-8").toString("utf-8");
				result += Buffer(data.substr(8, length * 2), "hex").toString("utf-8");
				result += Buffer("</NameValue>", "utf-8").toString("utf-8");
				result += ParseHDR(data.substr(8 + length * 2, data.length - (8 + length * 2)), "BERFH4");
			}
			break;
			default: {
				length += data.length / 2;
				result += ParseHDR(data.substr(0 + length * 2, data.length - (0 + length * 2)), mode);
			}
			break;
		}
	}

	return(result);
}

function ParseHEX(data) {
	var result, length;

	length = 0;
	result = String();
	if((data.length != 0)) {
		switch(data.substr(0, 16)) {
			case String("5851482001000000"): {
				length += 428;
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQXQH", ParseHDR(data.substr(0, length * 2), "LEXQH1"));
			}
			break;
			case String("5851482000000001"): {
				length += 428;
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQXQH", ParseHDR(data.substr(0, length * 2), "BEXQH1"));
			}
			break;
			case String("5851482002000000"): {
				length += 468;
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQXQH", ParseHDR(data.substr(0, length * 2), "LEXQH2"));
			}
			break;
			case String("5851482000000002"): {
				length += 468;
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQXQH", ParseHDR(data.substr(0, length * 2), "BEXQH2"));
			}
			break;
			case String("4d44452001000000"): {
				length += Buffer(data.substr(16, 8), "hex").readInt32LE();
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQMDE", ParseHDR(data.substr(0, length * 2), "LEMDE1"));
			}
			break;
			case String("4d44452000000001"): {
				length += Buffer(data.substr(16, 8), "hex").readInt32BE();
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQMDE", ParseHDR(data.substr(0, length * 2), "BEMDE1"));
			}
			break;
			case String("4d44452002000000"): {
				length += Buffer(data.substr(16, 8), "hex").readInt32LE();
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQMDE", ParseHDR(data.substr(0, length * 2), "LEMDE2"));
			}
			break;
			case String("4d44452000000002"): {
				length += Buffer(data.substr(16, 8), "hex").readInt32BE();
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQMDE", ParseHDR(data.substr(0, length * 2), "BEMDE2"));
			}
			break;
			case String("5246482001000000"): {
				length += Buffer(data.substr(16, 8), "hex").readInt32LE();
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQRFH", ParseHDR(data.substr(0, length * 2), "LERFH1"));
			}
			break;
			case String("5246482000000001"): {
				length += Buffer(data.substr(16, 8), "hex").readInt32BE();
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQRFH", ParseHDR(data.substr(0, length * 2), "BERFH1"));
			}
			break;
			case String("5246482002000000"): {
				length += Buffer(data.substr(16, 8), "hex").readInt32LE();
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQRFH2", ParseHDR(data.substr(0, length * 2), "LERFH2"));
			}
			break;
			case String("5246482000000002"): {
				length += Buffer(data.substr(16, 8), "hex").readInt32BE();
				result += ParseHEX(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("MQRFH2", ParseHDR(data.substr(0, length * 2), "BERFH2"));
			}
			break;
			default: {
				length += 0;
				result += String(data.substr(0 + length * 2, data.length - (0 + length * 2)));
				require("header-metadata").current.set("NONE", String(data.substr(0, length * 2)));
			}
			break;
		}
	}

	return(result);
}

function Main() {
	var result;

	session.input.readAsBuffer(function (error, buffer) {
		var result;

		if((error != null)) {
			session.reject(error.message);
		}
		session.output.write(Buffer(ParseHEX(buffer.toString("hex")), "hex"));

		return(result);
	});

	return(result);
}

Main();
