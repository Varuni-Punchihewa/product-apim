ALTER TABLE AM_APPLICATION ADD APPLICATION_TIER VARCHAR2(50) DEFAULT 'Unlimited';

CREATE TABLE AM_API_URL_MAPPING (
    URL_MAPPING_ID INTEGER,
    API_ID INTEGER NOT NULL,
    HTTP_METHOD VARCHAR(20) NULL,
    AUTH_SCHEME VARCHAR(50) NULL,
    URL_PATTERN VARCHAR(512) NULL,
    PRIMARY KEY(URL_MAPPING_ID)
)
/

CREATE SEQUENCE AM_API_URL_MAPPING_SEQUENCE START WITH 1 INCREMENT BY 1
/

CREATE OR REPLACE TRIGGER AM_API_URL_MAPPING_TRIGGER
		            BEFORE INSERT
                    ON AM_API_URL_MAPPING
                    REFERENCING NEW AS NEW
                    FOR EACH ROW
                    BEGIN
                    SELECT AM_API_URL_MAPPING_SEQUENCE.nextval INTO :NEW.URL_MAPPING_ID FROM dual;
                    END;
/