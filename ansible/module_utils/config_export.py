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
        if((not(self.__strcmp__(type(self.__params__.get("options").get("dest")), [type(str())], "equals")))):
            value += str("<{0} name='{1}'>{2}</{0}>").format("Options", "Dest", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("options").get("dest"))))
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
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'store_config'))]/*[((local-name() = 'parsed'))]/*[((local-name() != 'file'))]) | (./*[((local-name() = 'config_export'))]/*[((local-name() = 'policy'))]/*[((local-name() != 'file'))]))")):
            if((   (any((self.__strcmp__((item.tag, item.attrib.get("name")), [(part.tag, part.attrib.get("name"))], "equals")) for (i_part, part) in enumerate(item.getroottree().xpath("((./*[((local-name() = 'store_config'))]/*[((local-name() = 'parsed'))]/*[((local-name() != 'file'))]))")))))):
                for (i_part, part) in enumerate(item.xpath("((.//*))")):
                    if((self.__strcmp__(item.tag, ["MQQM"], "equals"))):
                        if((   (self.__strcmp__(part.tag, ["mAdminState", "QMname", "HostName", "ChannelName", "UserName", "PermitSSLv3", "SSLkey", "SSLcipher", "SSLClientConfigType", "SSLClient"], "equals")))):
                            value += str("<ModifiedConfig><Match>*/*/network/mq-qm?Name={0}&amp;Property={1}&amp;Value=.*</Match><Type>delete</Type><Property></Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                            value += str("<ModifiedConfig><Match>*/*/network/mq-qm?Name={0}</Match><Type>add</Type><Property>{1}</Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                    if((self.__strcmp__(item.tag, ["HTTPSourceProtocolHandler"], "equals"))):
                        if((   (self.__strcmp__(part.tag, ["mAdminState", "LocalAddress", "LocalPort"], "equals")))):
                            value += str("<ModifiedConfig><Match>*/*/protocol/http?Name={0}&amp;Property={1}&amp;Value=.*</Match><Type>delete</Type><Property></Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                            value += str("<ModifiedConfig><Match>*/*/protocol/http?Name={0}</Match><Type>add</Type><Property>{1}</Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                    if((self.__strcmp__(item.tag, ["CryptoKey"], "equals"))):
                        if((   (self.__strcmp__(part.tag, ["mAdminState", "Filename", "PasswordAlias", "Alias"], "equals")))):
                            value += str("<ModifiedConfig><Match>*/*/crypto/key?Name={0}&amp;Property={1}&amp;Value=.*</Match><Type>delete</Type><Property></Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                            value += str("<ModifiedConfig><Match>*/*/crypto/key?Name={0}</Match><Type>add</Type><Property>{1}</Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                    if((self.__strcmp__(item.tag, ["LoadBalancerGroup"], "equals"))):
                        if((self.__strcmp__(part.tag, ["mAdminState", "LBGroupMembers"], "equals"))):
                            value += str("<ModifiedConfig><Match>*/*/network/loadbalancer-group?Name={0}&amp;Property={1}&amp;Value=.*</Match><Type>delete</Type><Property></Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                            value += str("<ModifiedConfig><Match>*/*/network/loadbalancer-group?Name={0}</Match><Type>add</Type><Property>{1}</Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                    if((self.__strcmp__(item.tag, ["CryptoCertificate"], "equals"))):
                        if((   (self.__strcmp__(part.tag, ["mAdminState", "Filename", "PasswordAlias", "Alias"], "equals")))):
                            value += str("<ModifiedConfig><Match>*/*/crypto/cert?Name={0}&amp;Property={1}&amp;Value=.*</Match><Type>delete</Type><Property></Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                            value += str("<ModifiedConfig><Match>*/*/crypto/cert?Name={0}</Match><Type>add</Type><Property>{1}</Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                    if((self.__strcmp__(item.tag, ["HTTPSSourceProtocolHandler"], "equals"))):
                        if((   (self.__strcmp__(part.tag, ["mAdminState", "LocalAddress", "LocalPort"], "equals")))):
                            value += str("<ModifiedConfig><Match>*/*/protocol/https?Name={0}&amp;Property={1}&amp;Value=.*</Match><Type>delete</Type><Property></Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                            value += str("<ModifiedConfig><Match>*/*/protocol/https?Name={0}</Match><Type>add</Type><Property>{1}</Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                    if((self.__strcmp__(item.tag, ["SQLDataSource"], "equals"))):
                        if((   (self.__strcmp__(part.tag, ["mAdminState", "Username", "Password", "PasswordAlias", "DataSourceID", "DataSourceHost", "DataSourcePort", "MaxConnection"], "equals")))):
                            value += str("<ModifiedConfig><Match>*/*/network/sqlsource?Name={0}&amp;Property={1}&amp;Value=.*</Match><Type>delete</Type><Property></Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
                            value += str("<ModifiedConfig><Match>*/*/network/sqlsource?Name={0}</Match><Type>add</Type><Property>{1}</Property><Value>{2}</Value></ModifiedConfig>").format(item.attrib.get("name"), part.tag if((not(self.__strcmp__(type(part.tag), [type(None)], "equals")))) else str(), part.text if((not(self.__strcmp__(type(part.text), [type(None)], "equals")))) else str())
            if((not(any((self.__strcmp__((item.tag, item.attrib.get("name")), [(part.tag, part.attrib.get("name"))], "equals")) for (i_part, part) in enumerate(item.getroottree().xpath("((./*[((local-name() = 'config_export'))]/*[((local-name() = 'policy'))]/*[((local-name() != 'file'))]))")))))):
                for (i_part, part) in enumerate(item.xpath("((./.))")):
                    if((self.__strcmp__(item.tag, ["MQQM"], "equals"))):
                        if((not(self.__strcmp__(part.tag, ["MQQM"], "equals")))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
                    if((self.__strcmp__(item.tag, ["HTTPSourceProtocolHandler"], "equals"))):
                        if((not(self.__strcmp__(part.tag, ["HTTPSourceProtocolHandler"], "equals")))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
                    if((self.__strcmp__(item.tag, ["CryptoKey"], "equals"))):
                        if((not(self.__strcmp__(part.tag, ["CryptoKey"], "equals")))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
                    if((self.__strcmp__(item.tag, ["LoadBalancerGroup"], "equals"))):
                        if((not(self.__strcmp__(part.tag, ["LoadBalancerGroup"], "equals")))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
                    if((self.__strcmp__(item.tag, ["CryptoCertificate"], "equals"))):
                        if((not(self.__strcmp__(part.tag, ["CryptoCertificate"], "equals")))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
                    if((self.__strcmp__(item.tag, ["HTTPSSourceProtocolHandler"], "equals"))):
                        if((not(self.__strcmp__(part.tag, ["HTTPSSourceProtocolHandler"], "equals")))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
                    if((self.__strcmp__(item.tag, ["SQLDataSource"], "equals"))):
                        if((not(self.__strcmp__(part.tag, ["SQLDataSource"], "equals")))):
                            error += str(xml.tostring(part, method="xml", encoding="utf-8"))
        if((not(self.__strcmp__(self.__params__.get("connect").get("domain"), [""], "equals")))):
            value = str("<dp:request domain='{0}' xmlns:dp='http://www.datapower.com/schemas/management'><dp:do-export format='ZIP' all-files='true' persisted='true'><dp:object class='all-classes' name='all-objects' ref-objects='true' ref-files='true'></dp:object><dp:deployment-policy>{1}</dp:deployment-policy></dp:do-export></dp:request>").format(self.__params__.get("connect").get("domain"), value)
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return(value)

    def __processresponse__(self):

        super(self.__class__, self).__processresponse__()

        error = value = str()
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'config_export'))]/*[((local-name() = 'response'))]//*[((local-name() = 'response'))]/*[((local-name() = 'result'))]))")):
            item.tag = str("file")
            item.attrib["name"] = str(self.__params__.get("options").get("dest"))
            if((self.__strcmp__(xml.tostring(item, method="text", encoding="utf-8"), ["OK"], "equals"))):
                value += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
            else:
                error += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
        for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(False)).xpath("((./*[((local-name() = 'config_export'))]/*[((local-name() = 'response'))]//*[((local-name() = 'response'))]/*[((local-name() = 'file'))]))")):
            item.tag = str("file")
            item.attrib["name"] = str(self.__params__.get("options").get("dest"))
            if((not(self.__strcmp__(item.text, [""], "equals")))):
                value += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                open(self.__params__.get("options").get("dest"), "wb").write(base64.b64decode(item.text))
            else:
                error += str("<{0} name='{1}'>{2}</{0}>").format(item.tag, item.attrib.get("name"), str("<status>{0}</status><reason>{1}</reason>").format(item.text, xml.tostring(item, method="text", encoding="utf-8")))
                pass
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return(value)
