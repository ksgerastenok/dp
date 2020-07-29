#from ansible.module_utils.basic import *

try:
    import base64 as base64
    import urllib3 as urllib3
    import lxml.etree as xml
    import ansible.module_utils.basic as basic
    reason = str()
except Exception as ex:
    import base64 as base64
    import urllib3 as urllib3
    import lxml.etree as xml
    import yaml as yaml
    reason = str(ex)


class Action(object):

    __items__ = dict()

    def __init__(self, params):

        urllib3.disable_warnings()
        self.__params__ = dict(params.copy())
        urllib3.disable_warnings()

        return

    def __yml2xml__(self, yml):

        value = None

        if((not(self.__strcmp__(type(yml), [type(list()), type(dict()), type(tuple())], "equals")))):
            value = str(yml).strip()
            for (i_item, item) in enumerate(list()):
                value += str(self.__yml2xml__(item).strip())
        if((self.__strcmp__(type(yml), [type(list())], "equals"))):
            value = str().strip()
            for (i_item, item) in enumerate(list(yml)):
                value += str(self.__yml2xml__(item).strip())
        if((self.__strcmp__(type(yml), [type(dict())], "equals"))):
            value = str().strip()
            for (i_item, item) in enumerate(dict(yml).keys()):
                value += str("<{1}>{0}</{1}>").format(self.__yml2xml__(yml.get(item)).strip(), item.strip())
        if((self.__strcmp__(type(yml), [type(tuple())], "equals"))):
            value = str().strip()
            for (i_item, item) in enumerate(tuple(yml)):
                value += str(self.__yml2xml__(item).strip())
        if((not(self.__strcmp__(type(yml), [type(list()), type(dict()), type(tuple())], "equals")))):
            value = str(yml).strip()
            for (i_item, item) in enumerate(tuple()):
                value += str(self.__yml2xml__(item).strip())

        return(value)

    def __strcmp__(self, string, items, mode):

        value = None

        if((mode.strip() in ["equals"])):
            value = any(((str(item).strip() in [str(string).strip()])) for (i_item, item) in enumerate(items))
        if((mode.strip() in ["contains"])):
            value = any(((str(item).strip() in (str(string).strip()))) for (i_item, item) in enumerate(items))
        if((mode.strip() in ["ends"])):
            value = any(((str(string).strip().endswith(str(item).strip()))) for (i_item, item) in enumerate(items))
        if((mode.strip() in ["starts"])):
            value = any(((str(string).strip().startswith(str(item).strip()))) for (i_item, item) in enumerate(items))

        return(value)

    def __getxml__(self, flag):

        value = str()

        if((flag)):
            value += str("<{0} name='{1}'>{2}</{0}>").format(self.__class__.__module__.split(".")[-1], self.__class__.__name__.split(".")[-1], self.__yml2xml__(self.__items__.get(self.__class__.__module__.split(".")[-1])))
        else:
            value += str("<{0} name='{1}'>{2}</{0}>").format(self.__class__.__module__.split(".")[-1], self.__class__.__name__.split(".")[-1], self.__yml2xml__(self.__items__))

        return(value)

    def __getvalue__(self, name):

        if((not(self.__strcmp__(type(self.__items__.get(self.__class__.__module__.split(".")[-1])), [type(dict())], "equals")))):
            self.__items__[self.__class__.__module__.split(".")[-1]] = dict()
        value = self.__items__.get(self.__class__.__module__.split(".")[-1]).get(name)

        return(value)

    def __setvalue__(self, name, value):

        if((not(self.__strcmp__(type(self.__items__.get(self.__class__.__module__.split(".")[-1])), [type(dict())], "equals")))):
            self.__items__[self.__class__.__module__.split(".")[-1]] = dict()
        self.__items__[self.__class__.__module__.split(".")[-1]][name] = value

        return(value)

    def __getrequest__(self, data):

        value = dict()

        if((self.__strcmp__(type(data), [type(Exception())], "equals"))):
            value["url"] = str("/service/mgmt/current")
            value["method"] = str("POST")
            value["headers"] = dict([("Authorization", str("Basic {0}").format(base64.b64encode(str("{0}:{1}").format(self.__params__.get("connect").get("user"), self.__params__.get("connect").get("passwd")))))])
            value["body"] = str("<soap:Envelope xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body>{0}</soap:Body></soap:Envelope>").format(data)
        else:
            value["url"] = str("/service/mgmt/current")
            value["method"] = str("POST")
            value["headers"] = dict([("Authorization", str("Basic {0}").format(base64.b64encode(str("{0}:{1}").format(self.__params__.get("connect").get("user"), self.__params__.get("connect").get("passwd")))))])
            value["body"] = str("<soap:Envelope xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body>{0}</soap:Body></soap:Envelope>").format(data)

        return(value)

    def __getresponse__(self, data):

        value = dict()

        if((self.__strcmp__(type(data), [type(Exception())], "equals"))):
            value["reason"] = str(data).replace("<", "").replace("/", "").replace(">", "")
            value["status"] = str(999).replace("<", "").replace("/", "").replace(">", "")
            value["headers"] = dict([("Authorization", str("Basic {0}").format(base64.b64encode(str("{0}:{1}").format(self.__params__.get("connect").get("user"), self.__params__.get("connect").get("passwd")))))])
            value["body"] = str("<soap:Envelope xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body>{0}</soap:Body></soap:Envelope>").format(str("<dp:response xmlns:dp='http://www.datapower.com/schemas/management'><dp:result>{0}</dp:result></dp:response>").format(value.get("reason")))
        else:
            value["reason"] = str(data.reason)
            value["status"] = str(data.status)
            value["headers"] = dict(data.headers)
            value["body"] = str(xml.tostring(xml.fromstring(data.data.replace("\n", "")), method="xml", encoding="utf-8"))

        return(value)

    def __processreports__(self):

        open(str("report.{0}.{1}.{2}.{3}.{4}.xml").format(self.__params__.get("connect").get("host"), self.__params__.get("connect").get("port"), self.__params__.get("connect").get("domain"), self.__class__.__module__.split(".")[-1], self.__class__.__name__.split(".")[-1]), "wb").write(self.__getxml__(True))

        return

    def __processoptions__(self):

        error = str()

        if((not(self.__strcmp__(type(self.__params__.get("connect").get("host")), [type(str())], "equals")))):
            error += str("<{0} name='{1}'>{2}</{0}>").format("Connect", "Host", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("connect").get("host"))))
        if((not(self.__strcmp__(type(self.__params__.get("connect").get("port")), [type(str())], "equals")))):
            error += str("<{0} name='{1}'>{2}</{0}>").format("Connect", "Port", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("connect").get("port"))))
        if((not(self.__strcmp__(type(self.__params__.get("connect").get("user")), [type(str())], "equals")))):
            error += str("<{0} name='{1}'>{2}</{0}>").format("Connect", "User", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("connect").get("user"))))
        if((not(self.__strcmp__(type(self.__params__.get("connect").get("passwd")), [type(str())], "equals")))):
            error += str("<{0} name='{1}'>{2}</{0}>").format("Connect", "Passwd", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("connect").get("passwd"))))
        if((not(self.__strcmp__(type(self.__params__.get("connect").get("domain")), [type(str())], "equals")))):
            error += str("<{0} name='{1}'>{2}</{0}>").format("Connect", "Domain", str("<value>{0}</value>").format(self.__yml2xml__(self.__params__.get("connect").get("domain"))))
        if((not(self.__strcmp__(error, [""], "equals")))):
            raise(Exception(error))

        return

    def __processactions__(self):

        try:
            self.__setvalue__("policy", self.__processpolicy__())
            self.__setvalue__("command", self.__processrequest__())
            if((not(self.__strcmp__(self.__getvalue__("command"), [""], "equals")))):
                for i in range(0, 9, 1):
                    try:
                        self.__setvalue__("request", self.__getrequest__(self.__getvalue__("command")))
                        pool = urllib3.HTTPSConnectionPool(host=self.__params__.get("connect").get("host"), port=self.__params__.get("connect").get("port"), cert_reqs="CERT_NONE").urlopen(method=self.__getvalue__("request").get("method"), url=self.__getvalue__("request").get("url"), headers=self.__getvalue__("request").get("headers"), body=self.__getvalue__("request").get("body"))
                        self.__setvalue__("response", self.__getresponse__(pool))
                    except Exception as ex:
                        self.__setvalue__("request", self.__getrequest__(self.__getvalue__("command")))
                        pool = Exception(ex)
                        self.__setvalue__("response", self.__getresponse__(pool))
                    if((   (any(self.__strcmp__(xml.tostring(item, method="text", encoding="utf-8"), [999], "equals") for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(True)).xpath("((./*[((local-name() = 'response'))]/*[((local-name() = 'status'))]))")))))):
                        continue
                    if((   (any(self.__strcmp__(xml.tostring(item, method="text", encoding="utf-8"), ["Authentication failure", "Permission denided", "Authorization failure"], "contains") for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(True)).xpath("((./*[((local-name() = 'response'))]/*[((local-name() = 'result'))]))")))))):
                        continue
                    if((not(all(self.__strcmp__(xml.tostring(item, method="text", encoding="utf-8"), [200], "equals") for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(True)).xpath("((./*[((local-name() = 'response'))]/*[((local-name() = 'status'))]))")))))):
                        raise(Exception(self.__yml2xml__(self.__getvalue__("response"))))
                    if((not(all(self.__strcmp__(xml.tostring(item, method="text", encoding="utf-8"), ["text/xml"], "contains") for (i_item, item) in enumerate(xml.fromstring(self.__getxml__(True)).xpath("((./*[((local-name() = 'response'))]/*[((local-name() = 'headers'))]))")))))):
                        raise(Exception(self.__yml2xml__(self.__getvalue__("response"))))
                    break
            self.__setvalue__("parsed", self.__processresponse__())
            self.__setvalue__("error", self.__processerror__())
        except Exception as ex:
            self.__setvalue__("error", ex.message)
        finally:
            if((not(self.__strcmp__(self.__getvalue__("error"), [""], "equals")))):
                raise(Exception(self.__getvalue__("error")))

        return

    def __processerror__(self):

        value = str()

        return(value)

    def __processpolicy__(self):

        value = str()

        return(value)

    def __processrequest__(self):

        value = str()

        return(value)

    def __processresponse__(self):

        value = str()

        return(value)

    def ExecuteTask(self):

        try:
            self.__processoptions__()
            self.__processactions__()
        except Exception as ex:
            if((not(self.__strcmp__(ex.message, [""], "equals")))):
                raise(Exception(ex.message))
        finally:
            self.__processreports__()

        return
