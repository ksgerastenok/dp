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

        return

    def __processpolicy__(self):

        super(self.__class__, self).__processpolicy__()

        value = str()

        return(value)

    def __processrequest__(self):

        super(self.__class__, self).__processrequest__()

        error = value = str()
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'store_config'))]/*[((local-name() = 'parsed'))]/*[((local-name() != 'file'))]))")):
            if((   (any((self.__strcmp__((item.tag, item.attrib.get("name")), [(part.tag, part.attrib.get("name"))], "equals")) for (i_part, part) in enumerate(item.getroottree().xpath("((./*[((local-name() = 'store_config'))]/*[((local-name() = 'parsed'))]/*[((local-name() != 'file'))]))")))))):
                for (i_part, part) in enumerate(item.xpath("((./.))")):
                    if((self.__strcmp__(item.tag, ["Statistics"], "equals"))):
                        if((self.__strcmp__(part.attrib.get("name"), ["default"], "equals"))):
                            value += str()
            if((not(any((self.__strcmp__((item.tag, item.attrib.get("name")), [(part.tag, part.attrib.get("name"))], "equals")) for (i_part, part) in enumerate(item.getroottree().xpath("((./*[((local-name() = 'store_config'))]/*[((local-name() = 'parsed'))]/*[((local-name() != 'file'))]))")))))):
                for (i_part, part) in enumerate(item.xpath("((./.))")):
                    if((self.__strcmp__(item.tag, ["Statistics"], "equals"))):
                        if((self.__strcmp__(part.attrib.get("name"), ["default"], "equals"))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
        if((self.__strcmp__(value, [""], "equals"))):
            value = str("<dp:request domain='{0}' xmlns:dp='http://www.datapower.com/schemas/management'><dp:get-status class='ObjectStatus'>{1}</dp:get-status></dp:request>").format(self.__params__.get("connect").get("domain"), value)
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return(value)

    def __processresponse__(self):

        super(self.__class__, self).__processresponse__()

        error = value = str()
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'config_status'))]/*[((local-name() = 'response'))]//*[((local-name() = 'response'))]/*[((local-name() = 'result'))]))")):
            item.tag = str("StatusConfig")
            item.attrib["name"] = str(self.__params__.get("connect").get("domain"))
            if((self.__strcmp__(xml.tostring(item, method="text", encoding="utf-8"), ["OK"], "equals"))):
                value += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
            else:
                error += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'config_status'))]/*[((local-name() = 'response'))]//*[((local-name() = 'response'))]//*[((local-name() = 'ObjectStatus'))]))")):
            item.tag = str(item.findtext("./Class"))
            item.attrib["name"] = str(item.findtext("./Name"))
            if(((self.__strcmp__(item.findtext("./AdminState"), ["enabled"], "equals")) and (self.__strcmp__(item.findtext("./OpState"), ["up"], "equals"))) or ((self.__strcmp__(item.findtext("./AdminState"), ["disabled"], "equals")) and (self.__strcmp__(item.findtext("./OpState"), ["down"], "equals")))):
                value += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.findtext("./EventCode"), item.findtext("./ErrorCode")))
                pass
            else:
                error += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.findtext("./EventCode"), item.findtext("./ErrorCode")))
                pass
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return(value)
