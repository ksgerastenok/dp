# Datapower

This repository contains:
- Ansible plugin for Datapower deploy with playbooks.
- Universal Gateway for Datapower.

Ansible plugin for Datapower has benefits:
- Deployment policy now is in YML format instead of XCFG.
- Automatically generates the Deployment policy for MQQM, CryptoKey / CryptoCertificate, HTTPSourceProtocolHandler / HTTPSSourceProtocolHalndler, SQLDataSource objects based on current configuration (if there is no corresponding object definition in user-defined YML Deployment policy), so it is quite safe to deploy configuration without any Deployment policy.
- Checks if to be deployed export.zip contains new stand-specific objects (e.g. MQQM, CryptoKey / CryptoCertificate, HTTPSourceProtocolHandler / HTTPSSourceProtocolHalndler, SQLDataSource contains IP-addresses, paths to crypto keys and so on). If there is no corresponding object definition in user-defined YML Deployment policy, throws an Exception. So, there will be no cases for misconfigured objects.
- Modules are developed in microservice principal and could be combined to chain in different ways. New modules also can be developed quite easily. When new module is developed, it is able to access specific information of previous modules executed in chain.

Universal Gateway for Datapower has benefits:
- Processing rule contains multiple actions (e.g. transformation, schema-validation, routing, logging).
- Not all of this action may be executed, so there is configuration file, that describes, which action have to be executed.
- In one processing rule could be processed different formatted messages and processing action logic could be written in different ways: XSLT / JS / XQ / XSLTBIN - all of this cases could be defined in configuration file.
- Different messages also should be processed in different ways, so configuration file can be defined for each type of message separately.
- Processing rule contains logic defining the type of message to be processed, after that there are folders for each message type, where configuration file for this message type could be placed.
