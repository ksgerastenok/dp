# from ansible.module_utils.basic import *
try:
    import ansible.module_utils.basic as basic
    import ansible.module_utils.cache_xml as cache_xml
    import ansible.module_utils.cache_xsl as cache_xsl
    import ansible.module_utils.file_move as file_move
    import ansible.module_utils.file_delete as file_delete
    import ansible.module_utils.file_export as file_export
    import ansible.module_utils.file_import as file_import
    import ansible.module_utils.file_disable as file_disable
    import ansible.module_utils.store_files as store_files
    import ansible.module_utils.store_config as store_config
    import ansible.module_utils.check_create as check_create
    import ansible.module_utils.check_delete as check_delete
    import ansible.module_utils.check_restore as check_restore
    import ansible.module_utils.backup_create as backup_create
    import ansible.module_utils.backup_delete as backup_delete
    import ansible.module_utils.backup_restore as backup_restore
    import ansible.module_utils.folder_create as folder_create
    import ansible.module_utils.folder_delete as folder_delete
    import ansible.module_utils.domain_reset as domain_reset
    import ansible.module_utils.domain_quiesce as domain_quiesce
    import ansible.module_utils.domain_unquiesce as domain_unquiesce
    import ansible.module_utils.config_save as config_save
    import ansible.module_utils.config_create as config_create
    import ansible.module_utils.config_delete as config_delete
    import ansible.module_utils.config_modify as config_modify
    import ansible.module_utils.config_status as config_status
    import ansible.module_utils.config_import as config_import
    import ansible.module_utils.config_export as config_export
    import ansible.module_utils.config_compare as config_compare
    import ansible.module_utils.config_disable as config_disable
    reason = str()
except Exception as ex:
    import yaml as yaml
    import cache_xml as cache_xml
    import cache_xsl as cache_xsl
    import file_move as file_move
    import file_delete as file_delete
    import file_export as file_export
    import file_import as file_import
    import file_disable as file_disable
    import store_files as store_files
    import store_config as store_config
    import check_create as check_create
    import check_delete as check_delete
    import check_restore as check_restore
    import backup_create as backup_create
    import backup_delete as backup_delete
    import backup_restore as backup_restore
    import folder_create as folder_create
    import folder_delete as folder_delete
    import domain_reset as domain_reset
    import domain_quiesce as domain_quiesce
    import domain_unquiesce as domain_unquiesce
    import config_save as config_save
    import config_create as config_create
    import config_delete as config_delete
    import config_modify as config_modify
    import config_status as config_status
    import config_import as config_import
    import config_export as config_export
    import config_compare as config_compare
    import config_disable as config_disable
    reason = str(ex)


def RunAction(params):

    store_files.Action(params).ExecuteTask()
    store_config.Action(params).ExecuteTask()
    for item in params.get("actions"):
        eval(item.get("action")).Action(params).ExecuteTask()

    return


def main():

    if((reason == str())):
        mod = basic.AnsibleModule({"connect": {"type": "dict", "required": True}, "actions": {"type": "list", "required": True}, "options": {"type": "dict", "required": False}})
        RunAction(mod.params)
        mod.exit_json()
    else:
        params = yaml.load(open("datapower.yml", "rb").read())
        RunAction(params.get("datapower"))

    return


if((__name__ == "__main__")):
    main()
