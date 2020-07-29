#from ansible.module_utils.basic import *
try:
    import base64 as base64
    import urllib3 as urllib3
    import lxml.etree as xml
    import ansible.module_utils.basic as basic
    import ansible.module_utils.base_action as base_action
    reason = str()
except Exception as ex:
    import base64 as base64
    import urllib3 as urllib3
    import lxml.etree as xml
    import yaml as yaml
    import base_action as base_action
    reason = str(ex)


class Action(base_action.Action):

    def __processoptions__(self):

        super(self.__class__, self).__processoptions__()

        value = str()
        if((not(self.__strcmp__(type(self.__params__.get("options").get("src")), [type(str())], "equals")))):
            value += str("<{0} name='{1}'>{2}</{0}>").format("Options", "Src", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("options").get("src"))))
        if((not(self.__strcmp__(type(self.__params__.get("options").get("dest")), [type(str())], "equals")))):
            value += str("<{0} name='{1}'>{2}</{0}>").format("Options", "Dest", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("options").get("dest"))))
        if((not(self.__strcmp__(value, [""], "equals")))):
            raise(Exception(value))

        return

    def __processpolicy__(self):

        super(self.__class__, self).__processpolicy__()

        value = str()

        return(value)

    def __processrequest__(self):

        super(self.__class__, self).__processrequest__()

        error = value = str()
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'store_files'))]/*[((local-name() = 'parsed'))]/*[((local-name() = 'file'))]))")):
            if((   (any((self.__strcmp__((item.tag, item.attrib.get("name")), [(part.tag, part.attrib.get("name"))], "equals")) for (i_part, part) in enumerate(item.getroottree().xpath("((./*[((local-name() = 'store_files'))]/*[((local-name() = 'parsed'))]/*[((local-name() = 'file'))]))")))))):
                for (i_part, part) in enumerate(item.xpath("((./.))")):
                    if((self.__strcmp__(item.tag, ["file"], "equals"))):
                        if((self.__strcmp__(part.attrib.get("name"), [self.__params__.get("options").get("src")], "equals"))):
                            value += str()
            if((not(any((self.__strcmp__((item.tag, item.attrib.get("name")), [(part.tag, part.attrib.get("name"))], "equals")) for (i_part, part) in enumerate(item.getroottree().xpath("((./*[((local-name() = 'store_files'))]/*[((local-name() = 'parsed'))]/*[((local-name() = 'file'))]))")))))):
                for (i_part, part) in enumerate(item.xpath("((./.))")):
                    if((self.__strcmp__(item.tag, ["file"], "equals"))):
                        if((self.__strcmp__(part.attrib.get("name"), [self.__params__.get("options").get("src")], "equals"))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
        if((self.__strcmp__(value, [""], "equals"))):
            value = str("<dp:request domain='{0}' xmlns:dp='http://www.datapower.com/schemas/management'><dp:get-file name='{1}'>{2}</dp:get-file></dp:request>").format(self.__params__.get("connect").get("domain"), self.__params__.get("options").get("src"), value)
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return(value)

    def __processresponse__(self):

        super(self.__class__, self).__processresponse__()

        error = value = str()
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'file_export'))]/*[((local-name() = 'response'))]//*[((local-name() = 'response'))]/*[((local-name() = 'result'))]))")):
            item.tag = str(item.getroottree().xpath("((./*[((local-name() = 'file_export'))]/*[((local-name() = 'request'))]//*[((local-name() = 'request'))]/*[((local-name() = 'get-file'))]))")[i_item].tag[slice(49, 53, 1)])
            item.attrib["name"] = str(item.getroottree().xpath("((./*[((local-name() = 'file_export'))]/*[((local-name() = 'request'))]//*[((local-name() = 'request'))]/*[((local-name() = 'get-file'))]))")[i_item].attrib.get("name"))
            if((self.__strcmp__(xml.tostring(item, method="text", encoding="utf-8"), ["OK"], "equals"))):
                value += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
            else:
                error += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'file_export'))]/*[((local-name() = 'response'))]//*[((local-name() = 'response'))]/*[((local-name() = 'file'))]))")):
            item.tag = str(item.getroottree().xpath("((./*[((local-name() = 'file_export'))]/*[((local-name() = 'request'))]//*[((local-name() = 'request'))]/*[((local-name() = 'get-file'))]))")[i_item].tag[slice(49, 53, 1)])
            item.attrib["name"] = str(item.getroottree().xpath("((./*[((local-name() = 'file_export'))]/*[((local-name() = 'request'))]//*[((local-name() = 'request'))]/*[((local-name() = 'get-file'))]))")[i_item].attrib.get("name"))
            if((not(self.__strcmp__(item.text, [""], "equals")))):
                value += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                open(self.__params__.get("options").get("dest"), "wb").write(base64.b64decode(item.text))
            else:
                error += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return(value)
