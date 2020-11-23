# Datapower

This repository contains:
- Ansible playbook for IBM Datapower deploy.
- Universal Gateway for Datapower.

Ansible plugin for Datapower has features:
- Deployment policy now is in YML format instead of XCFG.
- Automatically generates the Deployment policy for MQQM, CryptoKey / CryptoCertificate, HTTPSourceProtocolHandler / HTTPSSourceProtocolHalndler, SQLDataSource objects based on current configuration (if there is no corresponding object definition in user-defined YML Deployment policy). So, it is quite safe to deploy configuration without any Deployment policy.
- Checks if to be deployed export.zip contains new stand-specific objects (e.g. MQQM, CryptoKey / CryptoCertificate, HTTPSourceProtocolHandler / HTTPSSourceProtocolHalndler, SQLDataSource contains IP-addresses, paths to crypto keys and so on). If there is no corresponding object definition in user-defined YML Deployment policy, exception will be thrown. So, there will be no cases for misconfigured objects.
- Modules are developed in microservice principal and could be combined to chain in different ways. New modules also can be developed quite easily. When new module is developed, it is able to access specific information of previous modules executed in chain.

Universal Gateway for Datapower has features:
- Processing rule contains multiple actions (e.g. transformation, schema-validation, routing, logging).
- Not all of this actions may be executed, so there is configuration file, that describes, which actions have to be executed.
- In one processing rule could be processed different formatted messages and processing action logic could be written in different ways: XSLT / JS / XQ / XSLTBIN - all of this cases could be defined in configuration file.
- Different messages also should be processed in different ways, so configuration file can be defined for each type of message separately.
- Processing rule contains logic defining the type of message to be processed, after that there are folders for each message type, where configuration file for this message type could be placed.
- Processing rule contains MQ Header Parser, which transforms binary representation of MQ Header to its corresponding Datapower XML format. Parser supports such types of MQ Headers: MQXQH, MQMDE, MQRFH. With this parser it is possible to get messages from transmit queue and route to neccessary destination using MQOD header.
- Example in this repository allows execution of RUNMQSC / DMPMQCFG commands on remote MQ Queue Manager using Datapower instead of MQ MCA for routing MQ commands to remote MQ Queue Manager. 
