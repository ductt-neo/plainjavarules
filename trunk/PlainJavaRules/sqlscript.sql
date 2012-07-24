drop table RULES;
drop table CONDITIONS;
drop table PTY_OPERATOR_LIST;
drop table CONDITIONS_PTY_OPERATOR_LIST_MAPPING;
drop table RULES_CONDITION_MAPPING;

create table RULES (
RULE_ID INT NOT NULL ,
RULE_NAME VARCHAR(500),
RULE_DESCRIPTION VARCHAR(500),
ENABLE INT,
DEFAULT_VALUE INT,
PRIMARY KEY (RULE_ID)
);



create table CONDITIONS (
CONDITION_ID INT NOT NULL ,
CONDITION_NAME VARCHAR(500),
CONDITION_DISPLAY_NAME VARCHAR(500),
ENABLE INT,
DEFAULT_VALUE INT,
PRIMARY KEY (CONDITION_ID)
);

create table PTY_OPERATOR_LIST(
PTY_OPR_ID INT NOT NULL ,
DISPLAY_NAME VARCHAR(500) NOT NULL,
OBJECT_NAME VARCHAR(500) NOT NULL ,
PRIMARY KEY (PTY_OPR_ID)
);


create table CONDITIONS_PTY_OPERATOR_LIST_MAPPING(
ID INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
CONDITION_ID  INT NOT NULL CONSTRAINT CONDITIONS_PTY_OPERATOR_LIST_MAPPING_CONDITION_ID_FK REFERENCES CONDITIONS(CONDITION_ID),
PTY_OPR_ID INT NOT NULL CONSTRAINT CONDITIONS_PTY_OPERATOR_LIST_MAPPING_PTY_OPR_ID_FK REFERENCES PTY_OPERATOR_LIST(PTY_OPR_ID),
CONSTRAINT CONDITIONS_PTY_OPERATOR_LIST_MAPPING_PK PRIMARY KEY (ID)
)


CREATE TABLE RULES_CONDITION_MAPPING(
RULES_CONDITIONS_ID  INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
RULE_ID INT NOT NULL CONSTRAINT RULES_CONDITIONS_MAPPING_RULE_ID_FK REFERENCES RULES(RULE_ID),
USER_CONDITION_ID INT NOT NULL CONSTRAINT RULES_CONDITION_MAPPING_CONDITIONS__FK REFERENCES CONDITIONS(CONDITION_ID),
ENABLE INT,
CONDITION_DISPLAY VARCHAR(1000),
CONDITION_MVEL_FORMAT VARCHAR(1000),
PRIMARY KEY (RULES_CONDITIONS_ID)
);

