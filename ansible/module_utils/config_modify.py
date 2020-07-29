# from ansible.module_utils.basic import *

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
        if((not(self.__strcmp__(type(self.__params__.get("options").get("policy")), [type(list()), type(None), type(dict())], "equals")))):
            value += str("<{0} name='{1}'>{2}</{0}>").format("Options", "Policy", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("options").get("policy"))))
        if((not(self.__strcmp__(value, [""], "equals")))):
            raise(Exception(value))

        return

    def __processpolicy__(self):

        super(self.__class__, self).__processpolicy__()

        value = str()
        if((self.__strcmp__(type(self.__params__.get("options").get("policy")), [type(list())], "equals"))):
            for (i_item, item) in enumerate(self.__params__.get("options").get("policy")):
                if((self.__strcmp__(item.get("type"), ["modify"], "equals"))):
                    item["class"] = str(item.get("class"))
                    item["object"] = str(item.get("object"))
                    value += str("<{0} name='{1}'>{2}</{0}>").format(item.get("class"), item.get("object"), self.__yml2xml__(item.get("config")))
        if((self.__strcmp__(type(self.__params__.get("options").get("policy")), [type(dict())], "equals"))):
            for (i_types, types) in enumerate(self.__params__.get("options").get("policy").keys()):
                for (i_classes, classes) in enumerate(self.__params__.get("options").get("policy").get(types).keys()):
                    for (i_objects, objects) in enumerate(self.__params__.get("options").get("policy").get(types).get(classes).keys()):
                        if((self.__strcmp__(types, ["modify"], "equals"))):
                            classes = str(classes)
                            objects = str(objects)
                            value += str("<{0} name='{1}'>{2}</{0}>").format(classes, objects, self.__yml2xml__(self.__params__.get("options").get("policy").get(types).get(classes).get(objects)))

        return(value)

    def __processrequest__(self):

        super(self.__class__, self).__processrequest__()

        error = value = str()
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'config_modify'))]/*[((local-name() = 'policy'))]/*[((local-name() != 'file'))]))")):
            if((   (any((self.__strcmp__((item.tag, item.attrib.get("name")), [(part.tag, part.attrib.get("name"))], "equals")) for (i_part, part) in enumerate(item.getroottree().xpath("((./*[((local-name() = 'store_config'))]/*[((local-name() = 'parsed'))]/*[((local-name() != 'file'))]))")))))):
                for (i_part, part) in enumerate(item.xpath("((./.))")):
                    if((not(self.__strcmp__(item.tag, ["GeneratedPolicy"], "equals")))):
                        if((not(self.__strcmp__(part.tag, ["GeneratedPolicy"], "equals")))):
                            value += str(xml.tostring(item, method="xml", encoding="utf-8"))
            if((not(any((self.__strcmp__((item.tag, item.attrib.get("name")), [(part.tag, part.attrib.get("name"))], "equals")) for (i_part, part) in enumerate(item.getroottree().xpath("((./*[((local-name() = 'config_modify'))]/*[((local-name() = 'policy'))]/*[((local-name() != 'file'))]))")))))):
                for (i_part, part) in enumerate(item.xpath("((./.))")):
                    if((not(self.__strcmp__(item.tag, ["GeneratedPolicy"], "equals")))):
                        if((   (self.__strcmp__(part.tag, ["GeneratedPolicy"], "equals")))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
        if((not(self.__strcmp__(value, [""], "equals")))):
            value = str("<dp:request domain='{0}' xmlns:dp='http://www.datapower.com/schemas/management'><dp:modify-config>{1}</dp:modify-config></dp:request>").format(self.__params__.get("connect").get("domain"), value)
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return(value)

    def __processresponse__(self):

        super(self.__class__, self).__processresponse__()

        error = value = str()
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'config_modify'))]/*[((local-name() = 'response'))]//*[((local-name() = 'response'))]/*[((local-name() = 'result'))]))")):
            item.tag = str(item.getroottree().xpath("((./*[((local-name() = 'config_modify'))]/*[((local-name() = 'request'))]//*[((local-name() = 'modify-config'))]/*[((local-name() != 'file'))]))")[i_item].tag)
            item.attrib["name"] = str(item.getroottree().xpath("((./*[((local-name() = 'config_modify'))]/*[((local-name() = 'request'))]//*[((local-name() = 'modify-config'))]/*[((local-name() != 'file'))]))")[i_item].attrib.get("name"))
            if((self.__strcmp__(xml.tostring(item, method="text", encoding="utf-8"), ["OK"], "equals"))):
                value += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
            else:
                error += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return(value)
