--------------------------------------------------------
--  File created - Wednesday-May-25-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type MIGR_FILTER
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MIGR_FILTER" IS OBJECT (
  FILTER_TYPE INTEGER, -- Filter Types are 0-> ALL, 1->NAMELIST, 2->WHERE CLAUSE, 3->OBJECTID LIST
  OBJTYPE VARCHAR2(40),
  OBJECTIDS OBJECTIDLIST,
  NAMES NAMELIST,
  WHERECLAUSE VARCHAR2(1000));


/

--------------------------------------------------------
--  DDL for Type MIGR_FILTER_SET
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MIGR_FILTER_SET" IS TABLE OF MIGR_FILTER;


/

--------------------------------------------------------
--  DDL for Type MIGR_REPORT_DETAIL_ROW
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MIGR_REPORT_DETAIL_ROW" AS OBJECT
 (CAPTURED_ID            NUMBER(38),
  CAPTURED_NAME          VARCHAR2(4000),
  CONVERTED_NAME          VARCHAR2(4000),
  CAPTURED_TYPE          VARCHAR2(4000),
  CONVERTED_TYPE          VARCHAR2(4000),
  CAPTURE_STATUS         VARCHAR2(20),
  CONVERT_STATUS         VARCHAR2(20),
  GENERATE_STATUS        VARCHAR2(20),
  LOGTEXT               VARCHAR2(4000)
 );
 

/

--------------------------------------------------------
--  DDL for Type MIGR_REPORT_DETAIL_TABLE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MIGR_REPORT_DETAIL_TABLE" AS TABLE OF MIGR_REPORT_DETAIL_ROW;


/

--------------------------------------------------------
--  DDL for Type MIGR_REPORT_SUM_ROW
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MIGR_REPORT_SUM_ROW" AS OBJECT
       (LABEL           VARCHAR2(50),
	    SCHEMA_SUM      NUMBER,
        TABLE_SUM       NUMBER,
		INDEX_SUM       NUMBER,
		CONSTRAINT_SUM  NUMBER,
		VIEW_SUM        NUMBER,
		TRIGGER_SUM     NUMBER,
		SP_SUM          NUMBER		
        );


/

--------------------------------------------------------
--  DDL for Type MIGR_REPORT_SUM_TABLE
--------------------------------------------------------

  CREATE OR REPLACE TYPE "MIGR_REPORT_SUM_TABLE" AS TABLE OF MIGR_REPORT_SUM_ROW;


/

--------------------------------------------------------
--  DDL for Type NAMELIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "NAMELIST" IS TABLE OF VARCHAR2(40);


/

--------------------------------------------------------
--  DDL for Type NAME_AND_COUNT_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE TYPE "NAME_AND_COUNT_ARRAY" IS VARRAY(30) OF name_and_count_t;
 

/

--------------------------------------------------------
--  DDL for Type NAME_AND_COUNT_T
--------------------------------------------------------

  CREATE OR REPLACE TYPE "NAME_AND_COUNT_T" IS OBJECT (
  OBJECT_NAME varchar2(30),
  UPDATE_COUNT INTEGER);
 

/

--------------------------------------------------------
--  DDL for Type OBJECTIDLIST
--------------------------------------------------------

  CREATE OR REPLACE TYPE "OBJECTIDLIST" IS TABLE OF INTEGER;


/

--------------------------------------------------------
--  DDL for Sequence DBOBJECTID_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "DBOBJECTID_SEQUENCE"  MINVALUE 1 MAXVALUE 999999999999999999999999 INCREMENT BY 50 START WITH 1 CACHE 50 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence FASILITAS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "FASILITAS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence JENIS_KAMAR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JENIS_KAMAR_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 11 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence KAMAR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KAMAR_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOG_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LOG_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PETUGAS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PETUGAS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 11 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TAMU_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TAMU_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 31 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TRANSAKSI_SEWAKAMAR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "TRANSAKSI_SEWAKAMAR_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 51 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence WISMA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "WISMA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 11 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table FASILITAS
--------------------------------------------------------

  CREATE TABLE "FASILITAS" 
   (	"ID_FASILITAS" VARCHAR2(6), 
	"ID_JENIS" VARCHAR2(6), 
	"NAMA_FASILITAS" VARCHAR2(20), 
	"HARGA_FASILITAS" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table JENIS_KAMAR
--------------------------------------------------------

  CREATE TABLE "JENIS_KAMAR" 
   (	"ID_JENIS" VARCHAR2(6), 
	"NAMA_JENIS" VARCHAR2(20), 
	"HARGA" NUMBER(*,0), 
	"HARGA_AWAL" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table KAMAR
--------------------------------------------------------

  CREATE TABLE "KAMAR" 
   (	"ID_KAMAR" VARCHAR2(6), 
	"ID_JENIS" VARCHAR2(6), 
	"ID_WISMA" VARCHAR2(6), 
	"STATUS_KAMAR" VARCHAR2(10)
   ) ;
--------------------------------------------------------
--  DDL for Table LOG_TRANSAKSI
--------------------------------------------------------

  CREATE TABLE "LOG_TRANSAKSI" 
   (	"ID_LOG" VARCHAR2(6), 
	"ID_TRANSAKSI" VARCHAR2(6), 
	"TGL_TRANSAKSI" TIMESTAMP (6), 
	"OPERASI" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  CREATE TABLE "MD_ADDITIONAL_PROPERTIES" 
   (	"ID" NUMBER(*,0), 
	"CONNECTION_ID_FK" NUMBER(*,0), 
	"REF_ID_FK" NUMBER(*,0), 
	"REF_TYPE" VARCHAR2(4000), 
	"PROPERTY_ORDER" NUMBER(*,0), 
	"PROP_KEY" VARCHAR2(4000), 
	"VALUE" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_ADDITIONAL_PROPERTIES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_ADDITIONAL_PROPERTIES"."CONNECTION_ID_FK" IS 'Connection to which this belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_ADDITIONAL_PROPERTIES"."REF_ID_FK" IS 'The object to which this property blongs';
 
   COMMENT ON COLUMN "MD_ADDITIONAL_PROPERTIES"."REF_TYPE" IS 'Type of object that this property belongs to';
 
   COMMENT ON COLUMN "MD_ADDITIONAL_PROPERTIES"."PROPERTY_ORDER" IS 'This is to handle a situation where multiple properties have a relevant order, or multiple properties have multiple values';
 
   COMMENT ON COLUMN "MD_ADDITIONAL_PROPERTIES"."PROP_KEY" IS 'The keyname for this property';
 
   COMMENT ON COLUMN "MD_ADDITIONAL_PROPERTIES"."VALUE" IS 'The value for this property';
 
   COMMENT ON TABLE "MD_ADDITIONAL_PROPERTIES"  IS 'This table is used to store additional properties in key-value pairs.  It is designed to store "other information" that is not supported in the main database object table.';
--------------------------------------------------------
--  DDL for Table MD_CATALOGS
--------------------------------------------------------

  CREATE TABLE "MD_CATALOGS" 
   (	"ID" NUMBER(*,0), 
	"CONNECTION_ID_FK" NUMBER(*,0), 
	"CATALOG_NAME" VARCHAR2(4000), 
	"DUMMY_FLAG" CHAR(1) DEFAULT 'N', 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_CATALOGS"."CONNECTION_ID_FK" IS 'Foreign key into the connections table - Shows what connection this catalog belongs to //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_CATALOGS"."CATALOG_NAME" IS 'Name of the catalog //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_CATALOGS"."DUMMY_FLAG" IS 'Flag to show if this catalog is a "dummy" catalog which is used as a placeholder for those platforms that do not support catalogs.  ''N'' signifies that this is NOT a dummy catalog, while ''Y'' signifies that it is.';
 
   COMMENT ON COLUMN "MD_CATALOGS"."NATIVE_SQL" IS 'THe SQL used to create this catalog';
 
   COMMENT ON COLUMN "MD_CATALOGS"."NATIVE_KEY" IS 'A unique identifier used to identify the catalog at source.';
 
   COMMENT ON TABLE "MD_CATALOGS"  IS 'Store catalogs in this table.';
--------------------------------------------------------
--  DDL for Table MD_COLUMNS
--------------------------------------------------------

  CREATE TABLE "MD_COLUMNS" 
   (	"ID" NUMBER(*,0), 
	"TABLE_ID_FK" NUMBER(*,0), 
	"COLUMN_NAME" VARCHAR2(4000), 
	"COLUMN_ORDER" NUMBER(*,0), 
	"COLUMN_TYPE" VARCHAR2(4000), 
	"PRECISION" NUMBER(*,0), 
	"SCALE" NUMBER(*,0), 
	"NULLABLE" CHAR(1), 
	"DEFAULT_VALUE" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"DATATYPE_TRANSFORMED_FLAG" CHAR(1), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_BY" VARCHAR2(255), 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"LAST_UPDATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE
   ) ;
 

   COMMENT ON COLUMN "MD_COLUMNS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_COLUMNS"."TABLE_ID_FK" IS 'The table that this column is part of //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_COLUMNS"."COLUMN_NAME" IS 'The name of the column //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_COLUMNS"."COLUMN_ORDER" IS 'The order this appears in the table';
 
   COMMENT ON COLUMN "MD_COLUMNS"."COLUMN_TYPE" IS 'The type of the column';
 
   COMMENT ON COLUMN "MD_COLUMNS"."PRECISION" IS 'The precision on the column';
 
   COMMENT ON COLUMN "MD_COLUMNS"."SCALE" IS 'The scale of the column';
 
   COMMENT ON COLUMN "MD_COLUMNS"."NULLABLE" IS 'Yes or No.  Null signifies NO';
 
   COMMENT ON COLUMN "MD_COLUMNS"."DEFAULT_VALUE" IS 'Default value on the column';
 
   COMMENT ON COLUMN "MD_COLUMNS"."NATIVE_SQL" IS 'The SQL used to create this column at source';
 
   COMMENT ON COLUMN "MD_COLUMNS"."NATIVE_KEY" IS 'Unique identifier for this object at source';
 
   COMMENT ON COLUMN "MD_COLUMNS"."DATATYPE_TRANSFORMED_FLAG" IS 'This is set to ''Y'' to show if the data type was transformed.  This is useful so we don''t apply more than 1 datatype transformation to a column';
 
   COMMENT ON TABLE "MD_COLUMNS"  IS 'Column information is stored in this table.';
--------------------------------------------------------
--  DDL for Table MD_CONNECTIONS
--------------------------------------------------------

  CREATE TABLE "MD_CONNECTIONS" 
   (	"ID" NUMBER(*,0), 
	"PROJECT_ID_FK" NUMBER(*,0), 
	"TYPE" VARCHAR2(4000), 
	"HOST" VARCHAR2(4000), 
	"PORT" NUMBER(*,0), 
	"USERNAME" VARCHAR2(4000), 
	"PASSWORD" VARCHAR2(4000), 
	"DBURL" VARCHAR2(4000), 
	"NAME" VARCHAR2(255), 
	"NATIVE_SQL" CLOB, 
	"NUM_CATALOGS" NUMBER(*,0), 
	"NUM_COLUMNS" NUMBER(*,0), 
	"NUM_CONSTRAINTS" NUMBER(*,0), 
	"NUM_GROUPS" NUMBER(*,0), 
	"NUM_ROLES" NUMBER(*,0), 
	"NUM_INDEXES" NUMBER(*,0), 
	"NUM_OTHER_OBJECTS" NUMBER(*,0), 
	"NUM_PACKAGES" NUMBER(*,0), 
	"NUM_PRIVILEGES" NUMBER(*,0), 
	"NUM_SCHEMAS" NUMBER(*,0), 
	"NUM_SEQUENCES" NUMBER(*,0), 
	"NUM_STORED_PROGRAMS" NUMBER(*,0), 
	"NUM_SYNONYMS" NUMBER(*,0), 
	"NUM_TABLES" NUMBER(*,0), 
	"NUM_TABLESPACES" NUMBER(*,0), 
	"NUM_TRIGGERS" NUMBER(*,0), 
	"NUM_USER_DEFINED_DATA_TYPES" NUMBER(*,0), 
	"NUM_USERS" NUMBER(*,0), 
	"NUM_VIEWS" NUMBER(*,0), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_CONNECTIONS"."ID" IS 'Primary key';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."PROJECT_ID_FK" IS 'The project to which this connection belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."TYPE" IS 'The type of the connection - For example it could be used to store "ORACLE" or "MYSQL"';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."HOST" IS 'The host to which this connection connects.';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."PORT" IS 'The port to which this connection connects';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."USERNAME" IS 'The username used to make the connection';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."PASSWORD" IS 'The password used to make this connection';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."DBURL" IS 'The database url used to make this connection';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."NAME" IS '//OBJECTNAME';
 
   COMMENT ON COLUMN "MD_CONNECTIONS"."NATIVE_SQL" IS 'The native sql used to create this connection';
 
   COMMENT ON TABLE "MD_CONNECTIONS"  IS 'This table is used to store connection information.  For example, in migrations, we could be carrying out a consolidation which occurs across many connections.';
--------------------------------------------------------
--  DDL for Table MD_CONSTRAINTS
--------------------------------------------------------

  CREATE TABLE "MD_CONSTRAINTS" 
   (	"ID" NUMBER(*,0), 
	"DELETE_CLAUSE" VARCHAR2(4000), 
	"NAME" VARCHAR2(4000), 
	"CONSTRAINT_TYPE" VARCHAR2(4000), 
	"TABLE_ID_FK" NUMBER(*,0), 
	"REFTABLE_ID_FK" NUMBER(*,0), 
	"CONSTRAINT_TEXT" CLOB, 
	"LANGUAGE" VARCHAR2(40), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_CONSTRAINTS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_CONSTRAINTS"."DELETE_CLAUSE" IS 'delete option , can be either CASCADE, RESTRICT or NULL';
 
   COMMENT ON COLUMN "MD_CONSTRAINTS"."NAME" IS 'Name of the constraint //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_CONSTRAINTS"."CONSTRAINT_TYPE" IS 'Type of the constraint (e.g. CHECK)';
 
   COMMENT ON COLUMN "MD_CONSTRAINTS"."TABLE_ID_FK" IS 'Table on which this constraint exists //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_CONSTRAINTS"."REFTABLE_ID_FK" IS 'Used in foreign keys - this gives the table that we refer to.';
 
   COMMENT ON COLUMN "MD_CONSTRAINTS"."CONSTRAINT_TEXT" IS 'The text of the constraint';
 
   COMMENT ON COLUMN "MD_CONSTRAINTS"."LANGUAGE" IS '//PUBLIC';
 
   COMMENT ON TABLE "MD_CONSTRAINTS"  IS 'Table for storing information about a constraint';
--------------------------------------------------------
--  DDL for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  CREATE TABLE "MD_CONSTRAINT_DETAILS" 
   (	"ID" NUMBER(*,0), 
	"REF_FLAG" CHAR(1) DEFAULT 'N', 
	"CONSTRAINT_ID_FK" NUMBER(*,0), 
	"COLUMN_ID_FK" NUMBER(*,0), 
	"COLUMN_PORTION" NUMBER(*,0), 
	"CONSTRAINT_TEXT" CLOB, 
	"DETAIL_ORDER" NUMBER(*,0), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_CONSTRAINT_DETAILS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_CONSTRAINT_DETAILS"."REF_FLAG" IS '"N" or Null signify that this column is the colum that is used in the constraint.  A flag of Y signifies that the colum is a referenced column (i.e. part of a foreign key constraint)';
 
   COMMENT ON COLUMN "MD_CONSTRAINT_DETAILS"."CONSTRAINT_ID_FK" IS 'Constraint that this detail belongs to //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_CONSTRAINT_DETAILS"."COLUMN_PORTION" IS 'The portion of a column this detail belongs (e.g. for constrints on substrings)';
 
   COMMENT ON COLUMN "MD_CONSTRAINT_DETAILS"."CONSTRAINT_TEXT" IS 'The text of the constraint';
 
   COMMENT ON TABLE "MD_CONSTRAINT_DETAILS"  IS 'Constraint details show what columns are "involved" in a constraint.';
--------------------------------------------------------
--  DDL for Table MD_DERIVATIVES
--------------------------------------------------------

  CREATE TABLE "MD_DERIVATIVES" 
   (	"ID" NUMBER(*,0), 
	"SRC_ID" NUMBER(*,0), 
	"SRC_TYPE" VARCHAR2(4000), 
	"DERIVED_ID" NUMBER(*,0), 
	"DERIVED_TYPE" VARCHAR2(4000), 
	"DERIVED_CONNECTION_ID_FK" NUMBER(*,0), 
	"TRANSFORMED" CHAR(1), 
	"ORIGINAL_IDENTIFIER" VARCHAR2(4000), 
	"NEW_IDENTIFIER" VARCHAR2(4000), 
	"DERIVED_OBJECT_NAMESPACE" VARCHAR2(40), 
	"DERIVATIVE_REASON" VARCHAR2(10), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_DERIVATIVES"."TRANSFORMED" IS 'Set this field to ''Y'' if we carry out any sort of transformation on teh derived object.';
 
   COMMENT ON TABLE "MD_DERIVATIVES"  IS 'This table is used to store objects that are derived from each other.  For example in a migration an auto-increment column in a source model could be mapped to a primary key, and a sequence, and a trigger.  The MD_DERIVATIVES table would store the fact that these 3 objects are derived from the auto-increment column.';
--------------------------------------------------------
--  DDL for Table MD_GROUPS
--------------------------------------------------------

  CREATE TABLE "MD_GROUPS" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"GROUP_NAME" VARCHAR2(4000), 
	"GROUP_FLAG" CHAR(1), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_GROUPS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_GROUPS"."SCHEMA_ID_FK" IS 'Schema in which this object belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_GROUPS"."GROUP_NAME" IS 'Name of the group //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_GROUPS"."GROUP_FLAG" IS 'This is a flag to signify a group or a role.  If this is ''R'' it means the group is known as a Role.  Any other value means it is known as a group.';
 
   COMMENT ON COLUMN "MD_GROUPS"."NATIVE_SQL" IS 'SQL Used to generate this object at source';
 
   COMMENT ON COLUMN "MD_GROUPS"."NATIVE_KEY" IS 'Unique id for this object at source';
 
   COMMENT ON TABLE "MD_GROUPS"  IS 'Groups of users in a schema';
--------------------------------------------------------
--  DDL for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  CREATE TABLE "MD_GROUP_MEMBERS" 
   (	"ID" NUMBER(*,0), 
	"GROUP_ID_FK" NUMBER(*,0), 
	"USER_ID_FK" NUMBER(*,0), 
	"GROUP_MEMBER_ID_FK" NUMBER(*,0), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_GROUP_MEMBERS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_GROUP_MEMBERS"."USER_ID_FK" IS 'Id of member';
 
   COMMENT ON COLUMN "MD_GROUP_MEMBERS"."GROUP_MEMBER_ID_FK" IS 'groups can be members of groups';
 
   COMMENT ON TABLE "MD_GROUP_MEMBERS"  IS 'This table is used to store the members of a group.';
--------------------------------------------------------
--  DDL for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "MD_GROUP_PRIVILEGES" 
   (	"ID" NUMBER(*,0), 
	"GROUP_ID_FK" NUMBER(*,0), 
	"PRIVILEGE_ID_FK" NUMBER(*,0), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON TABLE "MD_GROUP_PRIVILEGES"  IS 'This table stores the privileges granted to a group (or role)';
--------------------------------------------------------
--  DDL for Table MD_INDEXES
--------------------------------------------------------

  CREATE TABLE "MD_INDEXES" 
   (	"ID" NUMBER(*,0), 
	"INDEX_TYPE" VARCHAR2(4000), 
	"TABLE_ID_FK" NUMBER(*,0), 
	"INDEX_NAME" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(4000)
   ) ;
 

   COMMENT ON COLUMN "MD_INDEXES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_INDEXES"."INDEX_TYPE" IS 'Type of the index e.g. PRIMARY';
 
   COMMENT ON COLUMN "MD_INDEXES"."TABLE_ID_FK" IS 'Table that this index is on //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_INDEXES"."INDEX_NAME" IS 'Name of the index //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_INDEXES"."NATIVE_SQL" IS 'SQL used to create the index at source';
 
   COMMENT ON COLUMN "MD_INDEXES"."NATIVE_KEY" IS 'A unique identifier for this object at the source';
 
   COMMENT ON TABLE "MD_INDEXES"  IS 'This table is used to store information about the indexes in a schema';
--------------------------------------------------------
--  DDL for Table MD_INDEX_DETAILS
--------------------------------------------------------

  CREATE TABLE "MD_INDEX_DETAILS" 
   (	"ID" NUMBER(*,0), 
	"INDEX_ID_FK" NUMBER(*,0), 
	"COLUMN_ID_FK" NUMBER(*,0), 
	"INDEX_PORTION" NUMBER(*,0), 
	"DETAIL_ORDER" NUMBER(*,0), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_INDEX_DETAILS"."INDEX_ID_FK" IS 'The index to which this detail belongs. //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_INDEX_DETAILS"."INDEX_PORTION" IS 'To support indexing on part of a field';
 
   COMMENT ON TABLE "MD_INDEX_DETAILS"  IS 'This table stores the details of an index.  It shows what columns are "part" of the index.';
--------------------------------------------------------
--  DDL for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  CREATE TABLE "MD_MIGR_DEPENDENCY" 
   (	"ID" NUMBER(*,0), 
	"CONNECTION_ID_FK" NUMBER(*,0), 
	"PARENT_ID" NUMBER(*,0), 
	"CHILD_ID" NUMBER(*,0), 
	"PARENT_OBJECT_TYPE" VARCHAR2(4000), 
	"CHILD_OBJECT_TYPE" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_MIGR_DEPENDENCY"."CONNECTION_ID_FK" IS 'The connection that this exists in //PARENTFIELD';
--------------------------------------------------------
--  DDL for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  CREATE TABLE "MD_MIGR_PARAMETER" 
   (	"ID" NUMBER(*,0), 
	"CONNECTION_ID_FK" NUMBER(*,0), 
	"OBJECT_ID" NUMBER(*,0), 
	"OBJECT_TYPE" VARCHAR2(4000), 
	"PARAM_EXISTING" NUMBER(*,0), 
	"PARAM_ORDER" NUMBER(*,0), 
	"PARAM_NAME" VARCHAR2(4000), 
	"PARAM_TYPE" VARCHAR2(4000), 
	"PARAM_DATA_TYPE" VARCHAR2(4000), 
	"PERCISION" NUMBER(*,0), 
	"SCALE" NUMBER(*,0), 
	"NULLABLE" CHAR(1), 
	"DEFAULT_VALUE" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_MIGR_PARAMETER"."CONNECTION_ID_FK" IS 'the connection in which this belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_MIGR_PARAMETER"."PARAM_EXISTING" IS '1 represents a new parameter for PL/SQL that was not present in the origional. 0 represents a n existing parameter that was present in the origional';
 
   COMMENT ON COLUMN "MD_MIGR_PARAMETER"."PARAM_ORDER" IS 'IF -1 THEN THIS PARAM IS A RETURN PARAMETER. 1 WILL BE THE FIRST PARAMETER IN THE PARAMETER LIST';
--------------------------------------------------------
--  DDL for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  CREATE TABLE "MD_MIGR_WEAKDEP" 
   (	"ID" NUMBER(*,0), 
	"CONNECTION_ID_FK" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"PARENT_ID" NUMBER(*,0), 
	"CHILD_NAME" VARCHAR2(4000), 
	"PARENT_TYPE" VARCHAR2(4000), 
	"CHILD_TYPE" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_MIGR_WEAKDEP"."CHILD_NAME" IS 'name of the child,  as weak dependencies dont have reference to child id';
 
   COMMENT ON COLUMN "MD_MIGR_WEAKDEP"."PARENT_TYPE" IS 'MD_<tablename>';
 
   COMMENT ON COLUMN "MD_MIGR_WEAKDEP"."CHILD_TYPE" IS 'Generic Type (not MD_<tablename>)';
--------------------------------------------------------
--  DDL for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  CREATE TABLE "MD_OTHER_OBJECTS" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"NAME" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_OTHER_OBJECTS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_OTHER_OBJECTS"."SCHEMA_ID_FK" IS 'Schema to which this object blongs. //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_OTHER_OBJECTS"."NAME" IS 'Name of this object //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_OTHER_OBJECTS"."NATIVE_SQL" IS 'The native SQL used to create this object';
 
   COMMENT ON COLUMN "MD_OTHER_OBJECTS"."NATIVE_KEY" IS 'A key that identifies this object at source.';
 
   COMMENT ON TABLE "MD_OTHER_OBJECTS"  IS 'For storing objects that don''t belong anywhere else';
--------------------------------------------------------
--  DDL for Table MD_PACKAGES
--------------------------------------------------------

  CREATE TABLE "MD_PACKAGES" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"NAME" VARCHAR2(4000), 
	"PACKAGE_HEADER" CLOB, 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"LANGUAGE" VARCHAR2(40), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_PACKAGES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_PACKAGES"."SCHEMA_ID_FK" IS 'the schema in which this package resides //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_PACKAGES"."NAME" IS 'Name of this package //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_PACKAGES"."NATIVE_SQL" IS 'The SQL used to create this package at source';
 
   COMMENT ON COLUMN "MD_PACKAGES"."NATIVE_KEY" IS 'A unique identifer for this object at source.';
 
   COMMENT ON COLUMN "MD_PACKAGES"."LANGUAGE" IS '//PUBLIC';
 
   COMMENT ON TABLE "MD_PACKAGES"  IS 'For storing packages';
--------------------------------------------------------
--  DDL for Table MD_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "MD_PRIVILEGES" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"PRIVILEGE_NAME" VARCHAR2(4000), 
	"PRIVELEGE_OBJECT_ID" NUMBER(*,0), 
	"PRIVELEGEOBJECTTYPE" VARCHAR2(4000), 
	"PRIVELEGE_TYPE" VARCHAR2(4000), 
	"ADMIN_OPTION" CHAR(1), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_PRIVILEGES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_PRIVILEGES"."SCHEMA_ID_FK" IS 'The schema to which this object belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_PRIVILEGES"."PRIVILEGE_NAME" IS 'The name of the privilege //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_PRIVILEGES"."PRIVELEGE_OBJECT_ID" IS 'This references the table, view, etc on which the privelege exists.  This can be NULL for things like system wide privileges';
 
   COMMENT ON COLUMN "MD_PRIVILEGES"."PRIVELEGEOBJECTTYPE" IS 'The type the privelege is on (e.g. INDEX)';
 
   COMMENT ON COLUMN "MD_PRIVILEGES"."PRIVELEGE_TYPE" IS 'e.g.select';
 
   COMMENT ON COLUMN "MD_PRIVILEGES"."ADMIN_OPTION" IS 'Flag to show if this was granted with admin option.  ''Y'' means it was granted with admin option ''N'' means it was NOT granted with admin option.  NULL means not applicable (e.g. not known, not supported by source platform, etc.)';
 
   COMMENT ON COLUMN "MD_PRIVILEGES"."NATIVE_SQL" IS 'The SQL used to create this privilege at source';
 
   COMMENT ON COLUMN "MD_PRIVILEGES"."NATIVE_KEY" IS 'An identifier for this object at source.';
 
   COMMENT ON TABLE "MD_PRIVILEGES"  IS 'This table stores privilege information';
--------------------------------------------------------
--  DDL for Table MD_PROJECTS
--------------------------------------------------------

  CREATE TABLE "MD_PROJECTS" 
   (	"ID" NUMBER(*,0), 
	"PROJECT_NAME" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_PROJECTS"."ID" IS 'Primary key';
 
   COMMENT ON COLUMN "MD_PROJECTS"."PROJECT_NAME" IS 'Name of the project //OBJECTNAME';
 
   COMMENT ON TABLE "MD_PROJECTS"  IS 'This is a top level container for a set of connections.';
--------------------------------------------------------
--  DDL for Table MD_REGISTRY
--------------------------------------------------------

  CREATE TABLE "MD_REGISTRY" 
   (	"OBJECT_TYPE" VARCHAR2(30), 
	"OBJECT_NAME" VARCHAR2(30)
   ) ;
 

   COMMENT ON TABLE "MD_REGISTRY"  IS 'Table to store information on the MD_ repository.  This lists the objects to be dropped if you wish to remove the repository';
--------------------------------------------------------
--  DDL for Table MD_REPOVERSIONS
--------------------------------------------------------

  CREATE TABLE "MD_REPOVERSIONS" 
   (	"REVISION" NUMBER(*,0)
   ) ;
 

   COMMENT ON TABLE "MD_REPOVERSIONS"  IS 'This table is used to version this schema for future requirements.';
--------------------------------------------------------
--  DDL for Table MD_SCHEMAS
--------------------------------------------------------

  CREATE TABLE "MD_SCHEMAS" 
   (	"ID" NUMBER(*,0), 
	"CATALOG_ID_FK" NUMBER(*,0), 
	"NAME" VARCHAR2(4000), 
	"TYPE" CHAR(1), 
	"CHARACTER_SET" VARCHAR2(4000), 
	"VERSION_TAG" VARCHAR2(40), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_SCHEMAS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_SCHEMAS"."CATALOG_ID_FK" IS 'Catalog to which this schema blongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_SCHEMAS"."NAME" IS 'Name of the schema //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_SCHEMAS"."TYPE" IS 'Type of this schema.  Eaxamples are ''CAPTURED'' OR ''CONVERTED''';
 
   COMMENT ON COLUMN "MD_SCHEMAS"."CHARACTER_SET" IS 'The characterset of this schema';
 
   COMMENT ON COLUMN "MD_SCHEMAS"."VERSION_TAG" IS 'A version string that can be used for tagging/baseling a schema';
 
   COMMENT ON COLUMN "MD_SCHEMAS"."NATIVE_SQL" IS 'The native SQL used to create this schema';
 
   COMMENT ON COLUMN "MD_SCHEMAS"."NATIVE_KEY" IS 'A unique identifier that this schema is known as in its source state.';
 
   COMMENT ON TABLE "MD_SCHEMAS"  IS 'This is the holder for schemas';
--------------------------------------------------------
--  DDL for Table MD_SEQUENCES
--------------------------------------------------------

  CREATE TABLE "MD_SEQUENCES" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"NAME" VARCHAR2(4000), 
	"SEQ_START" NUMBER, 
	"INCR" NUMBER DEFAULT 1, 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255) DEFAULT '0', 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_SEQUENCES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_SEQUENCES"."SCHEMA_ID_FK" IS 'The schema to which this object belongs. //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_SEQUENCES"."NAME" IS 'Name of this sequence //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_SEQUENCES"."SEQ_START" IS 'Starting point of the sequence';
 
   COMMENT ON COLUMN "MD_SEQUENCES"."INCR" IS 'Increment value of the sequence';
 
   COMMENT ON COLUMN "MD_SEQUENCES"."NATIVE_SQL" IS 'SQL used to create this object at source';
 
   COMMENT ON COLUMN "MD_SEQUENCES"."NATIVE_KEY" IS 'Identifier for this object at source.';
 
   COMMENT ON TABLE "MD_SEQUENCES"  IS 'For storing information on sequences.';
--------------------------------------------------------
--  DDL for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  CREATE TABLE "MD_STORED_PROGRAMS" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"PROGRAMTYPE" VARCHAR2(20), 
	"NAME" VARCHAR2(4000), 
	"PACKAGE_ID_FK" NUMBER(*,0), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"LANGUAGE" VARCHAR2(40), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_STORED_PROGRAMS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_STORED_PROGRAMS"."SCHEMA_ID_FK" IS 'Schema to which this object belongs.  Note that the PACKAGE_ID_FK (if present also leads us to the relevant schema), however a stored program may or may not belong in a package.  If it is in a package, then the SCHEMA_ID_FK and the SCHEME_ID_FK in the parent package should match //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_STORED_PROGRAMS"."PROGRAMTYPE" IS 'Java/TSQL/PLSQL, etc.';
 
   COMMENT ON COLUMN "MD_STORED_PROGRAMS"."NAME" IS 'Name of the stored program //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_STORED_PROGRAMS"."PACKAGE_ID_FK" IS 'The package to which this object belongs';
 
   COMMENT ON COLUMN "MD_STORED_PROGRAMS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
 
   COMMENT ON COLUMN "MD_STORED_PROGRAMS"."NATIVE_KEY" IS 'A unique indetifier for this object at source';
 
   COMMENT ON COLUMN "MD_STORED_PROGRAMS"."LANGUAGE" IS '//PUBLIC';
 
   COMMENT ON TABLE "MD_STORED_PROGRAMS"  IS 'Container for stored programs.';
--------------------------------------------------------
--  DDL for Table MD_SYNONYMS
--------------------------------------------------------

  CREATE TABLE "MD_SYNONYMS" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"NAME" VARCHAR2(4000), 
	"SYNONYM_FOR_ID" NUMBER(*,0), 
	"FOR_OBJECT_TYPE" VARCHAR2(4000), 
	"PRIVATE_VISIBILITY" CHAR(1), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_SYNONYMS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_SYNONYMS"."SCHEMA_ID_FK" IS 'The schema to which this object belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_SYNONYMS"."NAME" IS 'Synonym name //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_SYNONYMS"."SYNONYM_FOR_ID" IS 'What object this is a synonym for';
 
   COMMENT ON COLUMN "MD_SYNONYMS"."FOR_OBJECT_TYPE" IS 'The type this is a synonym for (e.g. INDEX)';
 
   COMMENT ON COLUMN "MD_SYNONYMS"."PRIVATE_VISIBILITY" IS 'Visibility - Private or Public.  If Private_visibility = ''Y'' means this is a private synonym.  Anything else means it is a public synonym';
 
   COMMENT ON COLUMN "MD_SYNONYMS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
 
   COMMENT ON COLUMN "MD_SYNONYMS"."NATIVE_KEY" IS 'An identifier for this object at source.';
 
   COMMENT ON TABLE "MD_SYNONYMS"  IS 'For storing synonym information.';
--------------------------------------------------------
--  DDL for Table MD_TABLES
--------------------------------------------------------

  CREATE TABLE "MD_TABLES" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"TABLE_NAME" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"QUALIFIED_NATIVE_NAME" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_TABLES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_TABLES"."SCHEMA_ID_FK" IS 'Schema in which this table resides //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_TABLES"."TABLE_NAME" IS 'Name of the table //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_TABLES"."NATIVE_SQL" IS 'SQL Used to create this table at soruce';
 
   COMMENT ON COLUMN "MD_TABLES"."NATIVE_KEY" IS 'Unique identifier for this table at source';
 
   COMMENT ON TABLE "MD_TABLES"  IS 'Table used to store information about tables.';
--------------------------------------------------------
--  DDL for Table MD_TABLESPACES
--------------------------------------------------------

  CREATE TABLE "MD_TABLESPACES" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"TABLESPACE_NAME" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_TABLESPACES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_TABLESPACES"."SCHEMA_ID_FK" IS 'Schema to which this tablespace belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_TABLESPACES"."TABLESPACE_NAME" IS 'Name of the table space //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_TABLESPACES"."NATIVE_SQL" IS 'The SQL used to create this tablespace';
 
   COMMENT ON COLUMN "MD_TABLESPACES"."NATIVE_KEY" IS 'A unique identifier for this object at source';
 
   COMMENT ON TABLE "MD_TABLESPACES"  IS 'For storing information about tablespaces.';
--------------------------------------------------------
--  DDL for Table MD_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "MD_TRIGGERS" 
   (	"ID" NUMBER(*,0), 
	"TABLE_OR_VIEW_ID_FK" NUMBER(*,0), 
	"TRIGGER_ON_FLAG" CHAR(1), 
	"TRIGGER_NAME" VARCHAR2(4000), 
	"TRIGGER_TIMING" VARCHAR2(4000), 
	"TRIGGER_OPERATION" VARCHAR2(4000), 
	"TRIGGER_EVENT" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"LANGUAGE" VARCHAR2(40), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_TRIGGERS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."TABLE_OR_VIEW_ID_FK" IS 'Table on which this trigger fires';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."TRIGGER_ON_FLAG" IS 'Flag to show iif the trigger is on a table or a view.  If it is a table this should be ''T''. If it is on a view this should be ''V''';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."TRIGGER_NAME" IS 'Name of the trigger //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."TRIGGER_TIMING" IS 'before, after ,etc.';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."TRIGGER_OPERATION" IS 'insert, delete, etc.';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."TRIGGER_EVENT" IS 'The actual trigger that gets fired ';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."NATIVE_SQL" IS 'The full definition ';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."NATIVE_KEY" IS 'UInique identifer for this object at source';
 
   COMMENT ON COLUMN "MD_TRIGGERS"."LANGUAGE" IS '//PUBLIC';
 
   COMMENT ON TABLE "MD_TRIGGERS"  IS 'For storing information about triggers.';
--------------------------------------------------------
--  DDL for Table MD_USERS
--------------------------------------------------------

  CREATE TABLE "MD_USERS" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"USERNAME" VARCHAR2(4000), 
	"PASSWORD" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_USERS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_USERS"."SCHEMA_ID_FK" IS 'Shema in which this object belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_USERS"."USERNAME" IS 'Username for login //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_USERS"."PASSWORD" IS 'Password for login';
 
   COMMENT ON COLUMN "MD_USERS"."NATIVE_SQL" IS 'SQL Used to create this object at source';
 
   COMMENT ON COLUMN "MD_USERS"."NATIVE_KEY" IS 'Unique identifier for this object at source.';
 
   COMMENT ON TABLE "MD_USERS"  IS 'User information.';
--------------------------------------------------------
--  DDL for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  CREATE TABLE "MD_USER_DEFINED_DATA_TYPES" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"DATA_TYPE_NAME" VARCHAR2(4000), 
	"DEFINITION" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_USER_DEFINED_DATA_TYPES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_USER_DEFINED_DATA_TYPES"."SCHEMA_ID_FK" IS 'Schema to which this object blongs. //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_USER_DEFINED_DATA_TYPES"."DATA_TYPE_NAME" IS 'The name of the data type //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_USER_DEFINED_DATA_TYPES"."DEFINITION" IS 'The definition of the data type';
 
   COMMENT ON COLUMN "MD_USER_DEFINED_DATA_TYPES"."NATIVE_SQL" IS 'The native SQL used to create this object';
 
   COMMENT ON COLUMN "MD_USER_DEFINED_DATA_TYPES"."NATIVE_KEY" IS 'An unique identifier for this object at source.';
 
   COMMENT ON TABLE "MD_USER_DEFINED_DATA_TYPES"  IS 'For sotring information on user defined data types.';
--------------------------------------------------------
--  DDL for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  CREATE TABLE "MD_USER_PRIVILEGES" 
   (	"ID" NUMBER(*,0), 
	"USER_ID_FK" NUMBER(*,0), 
	"PRIVILEGE_ID_FK" NUMBER(*,0), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UDPATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_USER_PRIVILEGES"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_USER_PRIVILEGES"."USER_ID_FK" IS 'User';
 
   COMMENT ON COLUMN "MD_USER_PRIVILEGES"."PRIVILEGE_ID_FK" IS 'Privilege';
 
   COMMENT ON TABLE "MD_USER_PRIVILEGES"  IS 'This table stores privileges granted to individual users';
--------------------------------------------------------
--  DDL for Table MD_VIEWS
--------------------------------------------------------

  CREATE TABLE "MD_VIEWS" 
   (	"ID" NUMBER(*,0), 
	"SCHEMA_ID_FK" NUMBER(*,0), 
	"VIEW_NAME" VARCHAR2(4000), 
	"NATIVE_SQL" CLOB, 
	"NATIVE_KEY" VARCHAR2(4000), 
	"LANGUAGE" VARCHAR2(40), 
	"COMMENTS" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MD_VIEWS"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MD_VIEWS"."SCHEMA_ID_FK" IS 'The schema to which this obect blongs. //PARENTFIELD';
 
   COMMENT ON COLUMN "MD_VIEWS"."VIEW_NAME" IS 'The name of the view //OBJECTNAME';
 
   COMMENT ON COLUMN "MD_VIEWS"."NATIVE_SQL" IS 'The SQL used to create this object at source';
 
   COMMENT ON COLUMN "MD_VIEWS"."NATIVE_KEY" IS 'An identifier for this object at source.';
 
   COMMENT ON COLUMN "MD_VIEWS"."LANGUAGE" IS '//PUBLIC';
 
   COMMENT ON TABLE "MD_VIEWS"  IS 'For storing information on views.';
--------------------------------------------------------
--  DDL for Table MENYEWA
--------------------------------------------------------

  CREATE TABLE "MENYEWA" 
   (	"ID_TRANSAKSI" VARCHAR2(6), 
	"ID_KAMAR" VARCHAR2(6)
   ) ;
--------------------------------------------------------
--  DDL for Table MIGRATION_RESERVED_WORDS
--------------------------------------------------------

  CREATE TABLE "MIGRATION_RESERVED_WORDS" 
   (	"KEYWORD" VARCHAR2(40)
   ) ;
--------------------------------------------------------
--  DDL for Table MIGRLOG
--------------------------------------------------------

  CREATE TABLE "MIGRLOG" 
   (	"ID" NUMBER(*,0), 
	"PARENT_LOG_ID" NUMBER(*,0), 
	"LOG_DATE" TIMESTAMP (6), 
	"SEVERITY" NUMBER(4,0), 
	"LOGTEXT" VARCHAR2(4000), 
	"PHASE" VARCHAR2(20), 
	"REF_OBJECT_ID" NUMBER(*,0), 
	"REF_OBJECT_TYPE" VARCHAR2(4000)
   ) ;
--------------------------------------------------------
--  DDL for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  CREATE TABLE "MIGR_DATATYPE_TRANSFORM_MAP" 
   (	"ID" NUMBER(*,0), 
	"PROJECT_ID_FK" NUMBER(*,0), 
	"MAP_NAME" VARCHAR2(4000), 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_MAP"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_MAP"."PROJECT_ID_FK" IS '//PARENTFIELD';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_MAP"."MAP_NAME" IS 'A name for the map';
 
   COMMENT ON TABLE "MIGR_DATATYPE_TRANSFORM_MAP"  IS 'Table for storing data type maps.  A map is simply a collection of rules';
--------------------------------------------------------
--  DDL for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  CREATE TABLE "MIGR_DATATYPE_TRANSFORM_RULE" 
   (	"ID" NUMBER(*,0), 
	"MAP_ID_FK" NUMBER(*,0), 
	"SOURCE_DATA_TYPE_NAME" VARCHAR2(4000), 
	"SOURCE_PRECISION" NUMBER, 
	"SOURCE_SCALE" NUMBER, 
	"TARGET_DATA_TYPE_NAME" VARCHAR2(4000), 
	"TARGET_PRECISION" NUMBER, 
	"TARGET_SCALE" NUMBER, 
	"SECURITY_GROUP_ID" NUMBER(*,0) DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255)
   ) ;
 

   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_RULE"."ID" IS 'Primary Key';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_RULE"."MAP_ID_FK" IS 'The map to which this rule belongs //PARENTFIELD';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_DATA_TYPE_NAME" IS 'Source data type';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_PRECISION" IS 'Precison to match';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_RULE"."SOURCE_SCALE" IS 'scale to match';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_DATA_TYPE_NAME" IS 'data type name to transform to';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_PRECISION" IS 'precision to map to ';
 
   COMMENT ON COLUMN "MIGR_DATATYPE_TRANSFORM_RULE"."TARGET_SCALE" IS 'scale to map to';
--------------------------------------------------------
--  DDL for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  CREATE TABLE "MIGR_GENERATION_ORDER" 
   (	"ID" NUMBER(*,0), 
	"CONNECTION_ID_FK" NUMBER(*,0), 
	"OBJECT_ID" NUMBER(*,0), 
	"OBJECT_TYPE" VARCHAR2(4000), 
	"GENERATION_ORDER" NUMBER(*,0)
   ) ;
 

   COMMENT ON COLUMN "MIGR_GENERATION_ORDER"."CONNECTION_ID_FK" IS '//PARENTFIELD';
--------------------------------------------------------
--  DDL for Table PETUGAS
--------------------------------------------------------

  CREATE TABLE "PETUGAS" 
   (	"ID_PETUGAS" VARCHAR2(6), 
	"NAMA_PETUGAS" VARCHAR2(50), 
	"ALAMAT_PETUGAS" VARCHAR2(50), 
	"TELEPON_PETUGAS" NUMBER(*,0), 
	"GAJI" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table TAMU
--------------------------------------------------------

  CREATE TABLE "TAMU" 
   (	"ID_TAMU" VARCHAR2(6), 
	"TELEPON_TAMU" NUMBER(*,0), 
	"NAMA_TAMU" VARCHAR2(100), 
	"ALAMAT_TAMU" VARCHAR2(200)
   ) ;
--------------------------------------------------------
--  DDL for Table TRANSAKSI_SEWAKAMAR
--------------------------------------------------------

  CREATE TABLE "TRANSAKSI_SEWAKAMAR" 
   (	"ID_TRANSAKSI" VARCHAR2(6), 
	"ID_TAMU" VARCHAR2(6), 
	"ID_PETUGAS" VARCHAR2(6), 
	"TGL_TRANSAKSI" TIMESTAMP (6), 
	"LAMA" NUMBER(*,0), 
	"TGL_CHECKIN" TIMESTAMP (6), 
	"TGL_CHECKOUT" TIMESTAMP (6), 
	"TGL_BAYAR" TIMESTAMP (6), 
	"DENDA" NUMBER(*,0), 
	"HARGA" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table WISMA
--------------------------------------------------------

  CREATE TABLE "WISMA" 
   (	"ID_WISMA" VARCHAR2(6), 
	"NAMA_WISMA" VARCHAR2(20), 
	"ALAMAT_WISMA" VARCHAR2(200)
   ) ;

---------------------------------------------------
--   DATA FOR TABLE FASILITAS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into FASILITAS
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA001','JK001','Spring Bed',2100000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA002','JK001','Kipas Angin',160000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA003','JK004','Kipas Angin',160000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA004','JK002','TV',2500000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA005','JK002','Spring Bed',2100000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA006','JK003','Spring Bed',2100000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA007','JK004','Spring Bed',2100000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA008','JK005','Spring Bed',2100000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA009','JK006','Spring Bed',2100000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA010','JK003','TV',2500000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA011','JK005','TV',2500000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA012','JK006','AC',3000000);
Insert into FASILITAS (ID_FASILITAS,ID_JENIS,NAMA_FASILITAS,HARGA_FASILITAS) values ('FA013','JK006','TV',2500000);

---------------------------------------------------
--   END DATA FOR TABLE FASILITAS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE JENIS_KAMAR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into JENIS_KAMAR
Insert into JENIS_KAMAR (ID_JENIS,NAMA_JENIS,HARGA,HARGA_AWAL) values ('JK001','Standar',126000,140000);
Insert into JENIS_KAMAR (ID_JENIS,NAMA_JENIS,HARGA,HARGA_AWAL) values ('JK002','Eksekutif',153000,170000);
Insert into JENIS_KAMAR (ID_JENIS,NAMA_JENIS,HARGA,HARGA_AWAL) values ('JK003','VIP',180000,200000);
Insert into JENIS_KAMAR (ID_JENIS,NAMA_JENIS,HARGA,HARGA_AWAL) values ('JK004','Standar',135000,150000);
Insert into JENIS_KAMAR (ID_JENIS,NAMA_JENIS,HARGA,HARGA_AWAL) values ('JK005','Eksekutif',162000,180000);
Insert into JENIS_KAMAR (ID_JENIS,NAMA_JENIS,HARGA,HARGA_AWAL) values ('JK006','Sewa rumah',270000,300000);

---------------------------------------------------
--   END DATA FOR TABLE JENIS_KAMAR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE KAMAR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into KAMAR
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM001','JK004','WM001','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM002','JK004','WM001','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM003','JK006','WM002','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM004','JK005','WM001','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM005','JK001','WM003','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM006','JK002','WM003','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM007','JK002','WM003','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM008','JK005','WM001','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM009','JK004','WM001','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM010','JK001','WM003','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM011','JK006','WM002','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM012','JK006','WM002','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM013','JK006','WM002','KOSONG');
Insert into KAMAR (ID_KAMAR,ID_JENIS,ID_WISMA,STATUS_KAMAR) values ('KM014','JK002','WM003','KOSONG');

---------------------------------------------------
--   END DATA FOR TABLE KAMAR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE LOG_TRANSAKSI
--   FILTER = none used
---------------------------------------------------
REM INSERTING into LOG_TRANSAKSI
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO002','TR026',to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO003','TR011',to_timestamp('10-OCT-15 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO008','TR027',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO009','TR029',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO038','TR055',null,'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO024','TR034',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO028','TR036',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO029','TR037',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO030','TR038',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO031','TR039',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO032','TR035',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO033','TR033',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO037','TR055',null,'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO039','TR040',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO004','TR027',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO005','TR028',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO006','TR029',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO007','TR030',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO011','TR031',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO012','TR032',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO013','TR033',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO014','TR034',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO015','TR035',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO016','TR036',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO017','TR037',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO018','TR038',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO019','TR039',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO021','TR040',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO022','TR040',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO023','TR040',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO034','TR042',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO035','TR042',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO036','TR042',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO010','TR028',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'delete');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO025','TR041',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'insert');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO026','TR041',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');
Insert into LOG_TRANSAKSI (ID_LOG,ID_TRANSAKSI,TGL_TRANSAKSI,OPERASI) values ('LO027','TR041',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'update');

---------------------------------------------------
--   END DATA FOR TABLE LOG_TRANSAKSI
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_ADDITIONAL_PROPERTIES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_ADDITIONAL_PROPERTIES

---------------------------------------------------
--   END DATA FOR TABLE MD_ADDITIONAL_PROPERTIES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_CATALOGS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_CATALOGS

---------------------------------------------------
--   END DATA FOR TABLE MD_CATALOGS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_COLUMNS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_COLUMNS

---------------------------------------------------
--   END DATA FOR TABLE MD_COLUMNS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_CONNECTIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_CONNECTIONS

---------------------------------------------------
--   END DATA FOR TABLE MD_CONNECTIONS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_CONSTRAINTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_CONSTRAINTS

---------------------------------------------------
--   END DATA FOR TABLE MD_CONSTRAINTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_CONSTRAINT_DETAILS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_CONSTRAINT_DETAILS

---------------------------------------------------
--   END DATA FOR TABLE MD_CONSTRAINT_DETAILS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_DERIVATIVES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_DERIVATIVES

---------------------------------------------------
--   END DATA FOR TABLE MD_DERIVATIVES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_GROUPS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_GROUPS

---------------------------------------------------
--   END DATA FOR TABLE MD_GROUPS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_GROUP_MEMBERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_GROUP_MEMBERS

---------------------------------------------------
--   END DATA FOR TABLE MD_GROUP_MEMBERS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_GROUP_PRIVILEGES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_GROUP_PRIVILEGES

---------------------------------------------------
--   END DATA FOR TABLE MD_GROUP_PRIVILEGES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_INDEXES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_INDEXES

---------------------------------------------------
--   END DATA FOR TABLE MD_INDEXES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_INDEX_DETAILS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_INDEX_DETAILS

---------------------------------------------------
--   END DATA FOR TABLE MD_INDEX_DETAILS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_MIGR_DEPENDENCY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_MIGR_DEPENDENCY

---------------------------------------------------
--   END DATA FOR TABLE MD_MIGR_DEPENDENCY
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_MIGR_PARAMETER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_MIGR_PARAMETER

---------------------------------------------------
--   END DATA FOR TABLE MD_MIGR_PARAMETER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_MIGR_WEAKDEP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_MIGR_WEAKDEP

---------------------------------------------------
--   END DATA FOR TABLE MD_MIGR_WEAKDEP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_OTHER_OBJECTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_OTHER_OBJECTS

---------------------------------------------------
--   END DATA FOR TABLE MD_OTHER_OBJECTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_PACKAGES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_PACKAGES

---------------------------------------------------
--   END DATA FOR TABLE MD_PACKAGES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_PRIVILEGES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_PRIVILEGES

---------------------------------------------------
--   END DATA FOR TABLE MD_PRIVILEGES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_PROJECTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_PROJECTS

---------------------------------------------------
--   END DATA FOR TABLE MD_PROJECTS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_REGISTRY
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_REGISTRY
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('PACKAGE','MD_META');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('PACKAGE','MIGRATION');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('PACKAGE','MIGRATION_REPORT');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('PACKAGE','MIGRATION_TRANSFORMER');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('SEQUENCE','DBOBJECTID_SEQUENCE');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_ADDITIONAL_PROPERTIES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_CATALOGS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_COLUMNS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_CONNECTIONS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_CONSTRAINTS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_CONSTRAINT_DETAILS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_DERIVATIVES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_GROUPS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_GROUP_MEMBERS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_GROUP_PRIVILEGES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_INDEXES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_INDEX_DETAILS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_MIGR_DEPENDENCY');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_MIGR_PARAMETER');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_MIGR_WEAKDEP');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_OTHER_OBJECTS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_PACKAGES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_PRIVILEGES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_PROJECTS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_REPOVERSIONS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_SCHEMAS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_SEQUENCES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_STORED_PROGRAMS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_SYNONYMS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_TABLES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_TABLESPACES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_TRIGGERS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_USERS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_USER_DEFINED_DATA_TYPES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_USER_PRIVILEGES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MD_VIEWS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MIGRATION_RESERVED_WORDS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MIGRLOG');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MIGR_DATATYPE_TRANSFORM_MAP');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MIGR_DATATYPE_TRANSFORM_RULE');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TABLE','MIGR_GENERATION_ORDER');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','MIGR_FILTER');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','MIGR_FILTER_SET');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','MIGR_REPORT_DETAIL_ROW');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','MIGR_REPORT_DETAIL_TABLE');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','MIGR_REPORT_SUM_ROW');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','MIGR_REPORT_SUM_TABLE');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','NAMELIST');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','NAME_AND_COUNT_ARRAY');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','NAME_AND_COUNT_T');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('TYPE','OBJECTIDLIST');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('VIEW','MGV_ALL_CATALOGS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('VIEW','MGV_ALL_CONNECTIONS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('VIEW','MGV_ALL_SCHEMA');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('VIEW','MGV_ALL_STORED_PROGRAMS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('VIEW','MGV_ALL_TABLES');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('VIEW','MGV_ALL_TABLE_TRIGGERS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('VIEW','MGV_ALL_VIEWS');
Insert into MD_REGISTRY (OBJECT_TYPE,OBJECT_NAME) values ('VIEW','MGV_ALL_VIEW_TRIGGERS');

---------------------------------------------------
--   END DATA FOR TABLE MD_REGISTRY
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_REPOVERSIONS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_REPOVERSIONS
Insert into MD_REPOVERSIONS (REVISION) values (20);

---------------------------------------------------
--   END DATA FOR TABLE MD_REPOVERSIONS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_SCHEMAS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_SCHEMAS

---------------------------------------------------
--   END DATA FOR TABLE MD_SCHEMAS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_SEQUENCES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_SEQUENCES

---------------------------------------------------
--   END DATA FOR TABLE MD_SEQUENCES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_STORED_PROGRAMS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_STORED_PROGRAMS

---------------------------------------------------
--   END DATA FOR TABLE MD_STORED_PROGRAMS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_SYNONYMS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_SYNONYMS

---------------------------------------------------
--   END DATA FOR TABLE MD_SYNONYMS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_TABLES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_TABLES

---------------------------------------------------
--   END DATA FOR TABLE MD_TABLES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_TABLESPACES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_TABLESPACES

---------------------------------------------------
--   END DATA FOR TABLE MD_TABLESPACES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_TRIGGERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_TRIGGERS

---------------------------------------------------
--   END DATA FOR TABLE MD_TRIGGERS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_USERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_USERS

---------------------------------------------------
--   END DATA FOR TABLE MD_USERS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_USER_DEFINED_DATA_TYPES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_USER_DEFINED_DATA_TYPES

---------------------------------------------------
--   END DATA FOR TABLE MD_USER_DEFINED_DATA_TYPES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_USER_PRIVILEGES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_USER_PRIVILEGES

---------------------------------------------------
--   END DATA FOR TABLE MD_USER_PRIVILEGES
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MD_VIEWS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MD_VIEWS

---------------------------------------------------
--   END DATA FOR TABLE MD_VIEWS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MENYEWA
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MENYEWA
Insert into MENYEWA (ID_TRANSAKSI,ID_KAMAR) values ('TR030','KM006');
Insert into MENYEWA (ID_TRANSAKSI,ID_KAMAR) values ('TR031','KM014');
Insert into MENYEWA (ID_TRANSAKSI,ID_KAMAR) values ('TR032','KM010');
Insert into MENYEWA (ID_TRANSAKSI,ID_KAMAR) values ('TR033','KM007');
Insert into MENYEWA (ID_TRANSAKSI,ID_KAMAR) values ('TR035','KM005');
Insert into MENYEWA (ID_TRANSAKSI,ID_KAMAR) values ('TR040','KM004');
Insert into MENYEWA (ID_TRANSAKSI,ID_KAMAR) values ('TR041','KM001');
Insert into MENYEWA (ID_TRANSAKSI,ID_KAMAR) values ('TR042','KM003');

---------------------------------------------------
--   END DATA FOR TABLE MENYEWA
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MIGRATION_RESERVED_WORDS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MIGRATION_RESERVED_WORDS
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('SHARE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('RAW');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('DROP');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('BETWEEN');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('FROM');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('DESC');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('OPTION');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('PRIOR');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('LONG');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('THEN');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('DEFAULT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ALTER');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('IS');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('INTO');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('MINUS');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('INTEGER');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('NUMBER');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('GRANT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('IDENTIFIED');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ALL');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('TO');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ORDER');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ON');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('FLOAT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('DATE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('HAVING');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('CLUSTER');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('NOWAIT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('RESOURCE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ANY');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('TABLE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('INDEX');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('FOR');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('UPDATE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('WHERE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('CHECK');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('SMALLINT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('WITH');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('DELETE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('BY');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ASC');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('REVOKE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('LIKE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('SIZE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('RENAME');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('NOCOMPRESS');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('NULL');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('GROUP');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('VALUES');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('AS');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('IN');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('VIEW');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('EXCLUSIVE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('COMPRESS');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('SYNONYM');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('SELECT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('INSERT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('EXISTS');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('NOT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('TRIGGER');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ELSE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('CREATE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('INTERSECT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('PCTFREE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('DISTINCT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('CONNECT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('SET');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('MODE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('OF');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('UNIQUE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('VARCHAR2');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('VARCHAR');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('LOCK');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('OR');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('CHAR');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('DECIMAL');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('UNION');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('PUBLIC');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('AND');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('START');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('USER');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('VALIDATE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('COMMENT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('UID');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('YEAR');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ROWNUM');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('AUDIT');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('ACCESS');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('FILE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('OFFLINE');
Insert into MIGRATION_RESERVED_WORDS (KEYWORD) values ('SESSION');

---------------------------------------------------
--   END DATA FOR TABLE MIGRATION_RESERVED_WORDS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MIGRLOG
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MIGRLOG

---------------------------------------------------
--   END DATA FOR TABLE MIGRLOG
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MIGR_DATATYPE_TRANSFORM_MAP
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MIGR_DATATYPE_TRANSFORM_MAP

---------------------------------------------------
--   END DATA FOR TABLE MIGR_DATATYPE_TRANSFORM_MAP
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MIGR_DATATYPE_TRANSFORM_RULE
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MIGR_DATATYPE_TRANSFORM_RULE

---------------------------------------------------
--   END DATA FOR TABLE MIGR_DATATYPE_TRANSFORM_RULE
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE MIGR_GENERATION_ORDER
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MIGR_GENERATION_ORDER

---------------------------------------------------
--   END DATA FOR TABLE MIGR_GENERATION_ORDER
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE PETUGAS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into PETUGAS
Insert into PETUGAS (ID_PETUGAS,NAMA_PETUGAS,ALAMAT_PETUGAS,TELEPON_PETUGAS,GAJI) values ('PE001','Habibur','Dian Park Regency, Surabaya',89761432745,null);
Insert into PETUGAS (ID_PETUGAS,NAMA_PETUGAS,ALAMAT_PETUGAS,TELEPON_PETUGAS,GAJI) values ('PE002','Rilo','Keputih, Sukolilo, Surabaya',81763222998,null);
Insert into PETUGAS (ID_PETUGAS,NAMA_PETUGAS,ALAMAT_PETUGAS,TELEPON_PETUGAS,GAJI) values ('PE003','Ahmad','Perum Mengunggul Jaya No E1, Surabaya',85673913753,null);

---------------------------------------------------
--   END DATA FOR TABLE PETUGAS
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE TAMU
--   FILTER = none used
---------------------------------------------------
REM INSERTING into TAMU
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA001',85736760330,'Andreas','Blitar, Jawa Timur');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA002',85123765890,'Yudhis','Surabaya, Jawa Timur');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA003',85098123765,'Habibur','Gresik, Jawa Timur');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA004',85456789123,'Rilo','Sidoarjo, Jawa Timur');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA005',85654987431,'Rifail','Surabaya, Jawa Timur');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA011',23423,'asd','asdas');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA012',213,'asda','asdasd');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA013',213,'asda','asdasd');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA014',12312,'sadas','asdasd');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA015',1293081,'uyhnjkm','kjdsfnsdf');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA016',123123,'asdasd','sfdsfsdf');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA017',32423,'asdas','dsfsdf');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA018',32423,'asdas','dsfsdf');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA019',23423,'asdas','sdvdf');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA020',21312,'asdas','sfsdf');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA021',23423,'sdfsd','fsds');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA022',23423,'dsfsd','wfdsdf');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA023',23423,'asda','fsdcsd');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA024',812371278,'Fatih','Malang');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA026',247234,'Syukron','SBY');
Insert into TAMU (ID_TAMU,TELEPON_TAMU,NAMA_TAMU,ALAMAT_TAMU) values ('TA025',8491237,'Fatih','Malang');

---------------------------------------------------
--   END DATA FOR TABLE TAMU
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE TRANSAKSI_SEWAKAMAR
--   FILTER = none used
---------------------------------------------------
REM INSERTING into TRANSAKSI_SEWAKAMAR
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR012','TA001','PE002',to_timestamp('10-OCT-15 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),3,to_timestamp('11-OCT-15 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('14-OCT-15 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('11-OCT-15 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR013','TA003','PE002',to_timestamp('11-FEB-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('11-FEB-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('12-FEB-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('12-FEB-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR014','TA004','PE003',to_timestamp('08-AUG-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),2,to_timestamp('08-AUG-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('10-AUG-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('10-AUG-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR015','TA005','PE003',to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR016','TA002','PE001',to_timestamp('29-JAN-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),4,to_timestamp('29-JAN-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('02-FEB-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('29-JAN-14 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR020','TA005','PE003',to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR023','TA005','PE003',to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR024','TA005','PE003',to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR026','TA005','PE003',to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('17-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('18-JUL-13 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),0,0);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR031','TA015','PE001',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),6,to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),null,null,null);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR032','TA016','PE001',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),5,to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('30-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),null,null,null);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR033','TA017','PE001',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('26-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),null,null,153000);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR030','TA014','PE001',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),6,to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('31-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),null,null,null);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR042','TA026','PE001',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('26-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('27-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),null,null,270000);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR035','TA019','PE001',to_timestamp('24-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('26-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),null,null,153000);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR040','TA024','PE001',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('06-OCT-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('07-OCT-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),null,4000,108000);
Insert into TRANSAKSI_SEWAKAMAR (ID_TRANSAKSI,ID_TAMU,ID_PETUGAS,TGL_TRANSAKSI,LAMA,TGL_CHECKIN,TGL_CHECKOUT,TGL_BAYAR,DENDA,HARGA) values ('TR041','TA025','PE001',to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),1,to_timestamp('25-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),to_timestamp('26-MAY-16 12.00.00.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),null,null,90000);

---------------------------------------------------
--   END DATA FOR TABLE TRANSAKSI_SEWAKAMAR
---------------------------------------------------

---------------------------------------------------
--   DATA FOR TABLE WISMA
--   FILTER = none used
---------------------------------------------------
REM INSERTING into WISMA
Insert into WISMA (ID_WISMA,NAMA_WISMA,ALAMAT_WISMA) values ('WM001','Bougenville','Jl. Teknik Arsitektur Blok H 8, Perumdos Kampus ITS, Keputih- Sukolilo, Surabaya');
Insert into WISMA (ID_WISMA,NAMA_WISMA,ALAMAT_WISMA) values ('WM002','Jasmine','Jl. Teknik Sipil Blok I-19, Perumdos Kampus ITS, Keputih-Sukolilo, Surabaya');
Insert into WISMA (ID_WISMA,NAMA_WISMA,ALAMAT_WISMA) values ('WM003','Flamboyan','Jl. Hidrodinamika No.1 Perum ITS');

---------------------------------------------------
--   END DATA FOR TABLE WISMA
---------------------------------------------------
--------------------------------------------------------
--  Constraints for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  ALTER TABLE "MD_STORED_PROGRAMS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_STORED_PROGRAMS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_STORED_PROGRAMS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_STORED_PROGRAMS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_STORED_PROGRAMS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "MD_TRIGGERS" ADD CONSTRAINT "MD_TRIGGERS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_TRIGGERS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TRIGGERS" MODIFY ("TABLE_OR_VIEW_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TRIGGERS" MODIFY ("TRIGGER_ON_FLAG" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TRIGGERS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TRIGGERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TRIGGERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  ALTER TABLE "MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUP_MEMBERS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_GROUP_MEMBERS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUP_MEMBERS" MODIFY ("GROUP_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUP_MEMBERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUP_MEMBERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  ALTER TABLE "MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_CONSTRAINT_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONSTRAINT_DETAILS" MODIFY ("CONSTRAINT_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONSTRAINT_DETAILS" MODIFY ("DETAIL_ORDER" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONSTRAINT_DETAILS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONSTRAINT_DETAILS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_RULE" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_R_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("MAP_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("SOURCE_DATA_TYPE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("TARGET_DATA_TYPE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_RULE" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  ALTER TABLE "MD_MIGR_PARAMETER" ADD CONSTRAINT "MIGR_PARAMETER_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("PARAM_EXISTING" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("PARAM_ORDER" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("PARAM_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("PARAM_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("PARAM_DATA_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("NULLABLE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_PARAMETER" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_PROJECTS
--------------------------------------------------------

  ALTER TABLE "MD_PROJECTS" ADD CONSTRAINT "MD_PROJECTS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_PROJECTS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PROJECTS" MODIFY ("PROJECT_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PROJECTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PROJECTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_MAP" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_M_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("PROJECT_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_MAP" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  ALTER TABLE "MIGR_GENERATION_ORDER" ADD CONSTRAINT "MIGR_GENERATION_ORDER_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MIGR_GENERATION_ORDER" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_GENERATION_ORDER" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_GENERATION_ORDER" MODIFY ("OBJECT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_GENERATION_ORDER" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MIGR_GENERATION_ORDER" MODIFY ("GENERATION_ORDER" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIGRATION_RESERVED_WORDS
--------------------------------------------------------

  ALTER TABLE "MIGRATION_RESERVED_WORDS" MODIFY ("KEYWORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  ALTER TABLE "MD_OTHER_OBJECTS" ADD CONSTRAINT "MD_OTHER_OBJECTS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_OTHER_OBJECTS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_OTHER_OBJECTS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_OTHER_OBJECTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_OTHER_OBJECTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_SEQUENCES
--------------------------------------------------------

  ALTER TABLE "MD_SEQUENCES" ADD CONSTRAINT "MD_SEQUENCES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_SEQUENCES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SEQUENCES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SEQUENCES" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SEQUENCES" MODIFY ("SEQ_START" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SEQUENCES" MODIFY ("INCR" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SEQUENCES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SEQUENCES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SEQUENCES" MODIFY ("CREATED_BY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_SYNONYMS
--------------------------------------------------------

  ALTER TABLE "MD_SYNONYMS" ADD CONSTRAINT "MD_SYNONYMS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_SYNONYMS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SYNONYMS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SYNONYMS" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SYNONYMS" MODIFY ("SYNONYM_FOR_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SYNONYMS" MODIFY ("FOR_OBJECT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SYNONYMS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SYNONYMS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRANSAKSI_SEWAKAMAR
--------------------------------------------------------

  ALTER TABLE "TRANSAKSI_SEWAKAMAR" ADD CONSTRAINT "ID_TRANSAKSI_PK" PRIMARY KEY ("ID_TRANSAKSI") ENABLE;
 
  ALTER TABLE "TRANSAKSI_SEWAKAMAR" MODIFY ("ID_TRANSAKSI" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PETUGAS
--------------------------------------------------------

  ALTER TABLE "PETUGAS" ADD CONSTRAINT "ID_PETUGAS_PK" PRIMARY KEY ("ID_PETUGAS") ENABLE;
 
  ALTER TABLE "PETUGAS" MODIFY ("ID_PETUGAS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOG_TRANSAKSI
--------------------------------------------------------

  ALTER TABLE "LOG_TRANSAKSI" MODIFY ("ID_LOG" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_VIEWS
--------------------------------------------------------

  ALTER TABLE "MD_VIEWS" ADD CONSTRAINT "MD_VIEWS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_VIEWS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_VIEWS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_VIEWS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_VIEWS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_VIEWS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MIGRLOG
--------------------------------------------------------

  ALTER TABLE "MIGRLOG" ADD CONSTRAINT "MIGRLOG_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MIGRLOG" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MIGRLOG" MODIFY ("LOG_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "MIGRLOG" MODIFY ("SEVERITY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_INDEXES
--------------------------------------------------------

  ALTER TABLE "MD_INDEXES" ADD CONSTRAINT "MD_INDEXES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_INDEXES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_INDEXES" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_INDEXES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_INDEXES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_GROUP_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUP_PRIVILEGES" MODIFY ("GROUP_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUP_PRIVILEGES" MODIFY ("PRIVILEGE_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUP_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUP_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" ADD CONSTRAINT "MD_USER_DEFINED_DATA_TYPES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" MODIFY ("DATA_TYPE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" MODIFY ("DEFINITION" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" MODIFY ("NATIVE_SQL" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_PACKAGES
--------------------------------------------------------

  ALTER TABLE "MD_PACKAGES" ADD CONSTRAINT "MD_PACKAGES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_PACKAGES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PACKAGES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PACKAGES" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PACKAGES" MODIFY ("LANGUAGE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PACKAGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PACKAGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TAMU
--------------------------------------------------------

  ALTER TABLE "TAMU" ADD CONSTRAINT "ID_TAMU_PK" PRIMARY KEY ("ID_TAMU") ENABLE;
 
  ALTER TABLE "TAMU" MODIFY ("ID_TAMU" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_CONNECTIONS
--------------------------------------------------------

  ALTER TABLE "MD_CONNECTIONS" ADD CONSTRAINT "MD_CONNECTIONS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_CONNECTIONS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONNECTIONS" MODIFY ("PROJECT_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONNECTIONS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONNECTIONS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_COLUMNS
--------------------------------------------------------

  ALTER TABLE "MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_COLUMNS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_COLUMNS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_COLUMNS" MODIFY ("COLUMN_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_COLUMNS" MODIFY ("COLUMN_ORDER" NOT NULL ENABLE);
 
  ALTER TABLE "MD_COLUMNS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_COLUMNS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_REPOVERSIONS
--------------------------------------------------------

  ALTER TABLE "MD_REPOVERSIONS" MODIFY ("REVISION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FASILITAS
--------------------------------------------------------

  ALTER TABLE "FASILITAS" ADD CONSTRAINT "ID_FASILITAS_PK" PRIMARY KEY ("ID_FASILITAS") ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" ADD CONSTRAINT "MD_ADDITIONAL_PROPERTIES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" MODIFY ("REF_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" MODIFY ("REF_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" MODIFY ("PROP_KEY" NOT NULL ENABLE);
 
  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "MD_PRIVILEGES" ADD CONSTRAINT "MD_PRIVILEGES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PRIVILEGES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PRIVILEGES" MODIFY ("PRIVILEGE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PRIVILEGES" MODIFY ("PRIVELEGEOBJECTTYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PRIVILEGES" MODIFY ("PRIVELEGE_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PRIVILEGES" MODIFY ("NATIVE_SQL" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_CONSTRAINTS
--------------------------------------------------------

  ALTER TABLE "MD_CONSTRAINTS" ADD CONSTRAINT "MD_CONSTRAINTS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_CONSTRAINTS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONSTRAINTS" MODIFY ("TABLE_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONSTRAINTS" MODIFY ("LANGUAGE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONSTRAINTS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CONSTRAINTS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_GROUPS
--------------------------------------------------------

  ALTER TABLE "MD_GROUPS" ADD CONSTRAINT "MD_GROUPS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_GROUPS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUPS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUPS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_GROUPS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MENYEWA
--------------------------------------------------------

  ALTER TABLE "MENYEWA" ADD CONSTRAINT "ID_PRIMARY_PK" PRIMARY KEY ("ID_TRANSAKSI", "ID_KAMAR") ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_CATALOGS
--------------------------------------------------------

  ALTER TABLE "MD_CATALOGS" ADD CONSTRAINT "MD_CATALOGS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_CATALOGS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CATALOGS" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CATALOGS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_CATALOGS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JENIS_KAMAR
--------------------------------------------------------

  ALTER TABLE "JENIS_KAMAR" ADD CONSTRAINT "ID_JENIS_PK" PRIMARY KEY ("ID_JENIS") ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  ALTER TABLE "MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("PARENT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("CHILD_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("PARENT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("CHILD_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_WEAKDEP" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_DERIVATIVES
--------------------------------------------------------

  ALTER TABLE "MD_DERIVATIVES" ADD CONSTRAINT "MIGRDREIVATIVES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_DERIVATIVES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_DERIVATIVES" MODIFY ("SRC_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_DERIVATIVES" MODIFY ("DERIVED_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_DERIVATIVES" MODIFY ("DERIVED_CONNECTION_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_DERIVATIVES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_DERIVATIVES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_USERS
--------------------------------------------------------

  ALTER TABLE "MD_USERS" ADD CONSTRAINT "MD_USERS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_USERS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USERS" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USERS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USERS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_INDEX_DETAILS
--------------------------------------------------------

  ALTER TABLE "MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_INDEX_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_INDEX_DETAILS" MODIFY ("INDEX_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_INDEX_DETAILS" MODIFY ("COLUMN_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_INDEX_DETAILS" MODIFY ("DETAIL_ORDER" NOT NULL ENABLE);
 
  ALTER TABLE "MD_INDEX_DETAILS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_INDEX_DETAILS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  ALTER TABLE "MD_MIGR_DEPENDENCY" ADD CONSTRAINT "MIGR_DEPENDENCY_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_MIGR_DEPENDENCY" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_DEPENDENCY" MODIFY ("CONNECTION_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_DEPENDENCY" MODIFY ("PARENT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_DEPENDENCY" MODIFY ("CHILD_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_DEPENDENCY" MODIFY ("PARENT_OBJECT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_DEPENDENCY" MODIFY ("CHILD_OBJECT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_DEPENDENCY" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_MIGR_DEPENDENCY" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KAMAR
--------------------------------------------------------

  ALTER TABLE "KAMAR" ADD CONSTRAINT "ID_KAMAR_PK" PRIMARY KEY ("ID_KAMAR") ENABLE;
--------------------------------------------------------
--  Constraints for Table MD_TABLES
--------------------------------------------------------

  ALTER TABLE "MD_TABLES" ADD CONSTRAINT "MD_TABLES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_TABLES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TABLES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TABLES" MODIFY ("TABLE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TABLES" MODIFY ("QUALIFIED_NATIVE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TABLES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TABLES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_REGISTRY
--------------------------------------------------------

  ALTER TABLE "MD_REGISTRY" ADD CONSTRAINT "MD_REGISTRY_PK" PRIMARY KEY ("OBJECT_TYPE", "OBJECT_NAME") ENABLE;
 
  ALTER TABLE "MD_REGISTRY" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MD_REGISTRY" MODIFY ("OBJECT_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_SCHEMAS
--------------------------------------------------------

  ALTER TABLE "MD_SCHEMAS" ADD CONSTRAINT "MD_SCHEMAS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_SCHEMAS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SCHEMAS" MODIFY ("CATALOG_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SCHEMAS" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_SCHEMAS" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_USER_PRIVILEGES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_PRIVILEGES" MODIFY ("USER_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_PRIVILEGES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_USER_PRIVILEGES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WISMA
--------------------------------------------------------

  ALTER TABLE "WISMA" ADD CONSTRAINT "ID_WISMA_PK" PRIMARY KEY ("ID_WISMA") ENABLE;
 
  ALTER TABLE "WISMA" MODIFY ("ID_WISMA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MD_TABLESPACES
--------------------------------------------------------

  ALTER TABLE "MD_TABLESPACES" ADD CONSTRAINT "MD_TABLESPACES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "MD_TABLESPACES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TABLESPACES" MODIFY ("SCHEMA_ID_FK" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TABLESPACES" MODIFY ("SECURITY_GROUP_ID" NOT NULL ENABLE);
 
  ALTER TABLE "MD_TABLESPACES" MODIFY ("CREATED_ON" NOT NULL ENABLE);
--------------------------------------------------------
--  DDL for Index MD_USER_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_USER_PRIVILEGES_PK" ON "MD_USER_PRIVILEGES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_SEQUENCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_SEQUENCES_PK" ON "MD_SEQUENCES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_PROJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_PROJECTS_PK" ON "MD_PROJECTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_CONNECTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_CONNECTIONS_PK" ON "MD_CONNECTIONS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_GROUPS_PK" ON "MD_GROUPS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_GROUP_MEMBERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_GROUP_MEMBERS_PK" ON "MD_GROUP_MEMBERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_INDEXES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_INDEXES_PK" ON "MD_INDEXES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_ADDITIONAL_PROPERTIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_ADDITIONAL_PROPERTIES_PK" ON "MD_ADDITIONAL_PROPERTIES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_INDEX_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_INDEX_DETAILS_PK" ON "MD_INDEX_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_CATALOGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_CATALOGS_PK" ON "MD_CATALOGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MIGR_DEPENDENCY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MIGR_DEPENDENCY_PK" ON "MD_MIGR_DEPENDENCY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MIGRLOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MIGRLOG_PK" ON "MIGRLOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MIGRDREIVATIVES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MIGRDREIVATIVES_PK" ON "MD_DERIVATIVES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLES_PK" ON "MD_TABLES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ID_PETUGAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_PETUGAS_PK" ON "PETUGAS" ("ID_PETUGAS") 
  ;
--------------------------------------------------------
--  DDL for Index ID_KAMAR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_KAMAR_PK" ON "KAMAR" ("ID_KAMAR") 
  ;
--------------------------------------------------------
--  DDL for Index MD_VIEWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_VIEWS_PK" ON "MD_VIEWS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MIGR_GENERATION_ORDER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MIGR_GENERATION_ORDER_PK" ON "MIGR_GENERATION_ORDER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_SCHEMAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_SCHEMAS_PK" ON "MD_SCHEMAS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ID_FASILITAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_FASILITAS_PK" ON "FASILITAS" ("ID_FASILITAS") 
  ;
--------------------------------------------------------
--  DDL for Index MD_REGISTRY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_REGISTRY_PK" ON "MD_REGISTRY" ("OBJECT_TYPE", "OBJECT_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index ID_TAMU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_TAMU_PK" ON "TAMU" ("ID_TAMU") 
  ;
--------------------------------------------------------
--  DDL for Index MD_OTHER_OBJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_OTHER_OBJECTS_PK" ON "MD_OTHER_OBJECTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_USER_DEFINED_DATA_TYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_USER_DEFINED_DATA_TYPES_PK" ON "MD_USER_DEFINED_DATA_TYPES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MIGR_WEAKDEP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MIGR_WEAKDEP_PK" ON "MD_MIGR_WEAKDEP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_PRIVILEGES_PK" ON "MD_PRIVILEGES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ID_PRIMARY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_PRIMARY_PK" ON "MENYEWA" ("ID_TRANSAKSI", "ID_KAMAR") 
  ;
--------------------------------------------------------
--  DDL for Index MIGR_DATATYPE_TRANSFORM_M_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MIGR_DATATYPE_TRANSFORM_M_PK" ON "MIGR_DATATYPE_TRANSFORM_MAP" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index NAMA_TAMUX
--------------------------------------------------------

  CREATE INDEX "NAMA_TAMUX" ON "TRANSAKSI_SEWAKAMAR" ("ID_TAMU") 
  ;
--------------------------------------------------------
--  DDL for Index MD_GROUP_PRIVILEGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_GROUP_PRIVILEGES_PK" ON "MD_GROUP_PRIVILEGES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_USERS_PK" ON "MD_USERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_PACKAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_PACKAGES_PK" ON "MD_PACKAGES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MIGR_PARAMETER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MIGR_PARAMETER_PK" ON "MD_MIGR_PARAMETER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TRIGGERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TRIGGERS_PK" ON "MD_TRIGGERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_TABLESPACES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_TABLESPACES_PK" ON "MD_TABLESPACES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index TRX_IDX
--------------------------------------------------------

  CREATE INDEX "TRX_IDX" ON "TRANSAKSI_SEWAKAMAR" (EXTRACT(MONTH FROM "TGL_TRANSAKSI")) 
  ;
--------------------------------------------------------
--  DDL for Index MD_SYNONYMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_SYNONYMS_PK" ON "MD_SYNONYMS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ID_JENIS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_JENIS_PK" ON "JENIS_KAMAR" ("ID_JENIS") 
  ;
--------------------------------------------------------
--  DDL for Index ID_WISMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_WISMA_PK" ON "WISMA" ("ID_WISMA") 
  ;
--------------------------------------------------------
--  DDL for Index MD_CONSTRAINTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_CONSTRAINTS_PK" ON "MD_CONSTRAINTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_COLUMNS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_COLUMNS_PK" ON "MD_COLUMNS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MIGR_DATATYPE_TRANSFORM_R_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MIGR_DATATYPE_TRANSFORM_R_PK" ON "MIGR_DATATYPE_TRANSFORM_RULE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MD_CONSTRAINT_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MD_CONSTRAINT_DETAILS_PK" ON "MD_CONSTRAINT_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ID_TRANSAKSI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ID_TRANSAKSI_PK" ON "TRANSAKSI_SEWAKAMAR" ("ID_TRANSAKSI") 
  ;
--------------------------------------------------------
--  Ref Constraints for Table FASILITAS
--------------------------------------------------------

  ALTER TABLE "FASILITAS" ADD CONSTRAINT "ID_JENIS_FK1" FOREIGN KEY ("ID_JENIS")
	  REFERENCES "JENIS_KAMAR" ("ID_JENIS") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KAMAR
--------------------------------------------------------

  ALTER TABLE "KAMAR" ADD CONSTRAINT "ID_JENIS1_FK" FOREIGN KEY ("ID_JENIS")
	  REFERENCES "JENIS_KAMAR" ("ID_JENIS") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "KAMAR" ADD CONSTRAINT "ID_WISMA_FK" FOREIGN KEY ("ID_WISMA")
	  REFERENCES "WISMA" ("ID_WISMA") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_ADDITIONAL_PROPERTIES
--------------------------------------------------------

  ALTER TABLE "MD_ADDITIONAL_PROPERTIES" ADD CONSTRAINT "MD_ADDITIONAL_PROPERTIES__FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CATALOGS
--------------------------------------------------------

  ALTER TABLE "MD_CATALOGS" ADD CONSTRAINT "MD_CATALOGS_MD_CONNECTION_FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_COLUMNS
--------------------------------------------------------

  ALTER TABLE "MD_COLUMNS" ADD CONSTRAINT "MD_COLUMNS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONNECTIONS
--------------------------------------------------------

  ALTER TABLE "MD_CONNECTIONS" ADD CONSTRAINT "MD_CONNECTIONS_MD_PROJECT_FK1" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONSTRAINTS
--------------------------------------------------------

  ALTER TABLE "MD_CONSTRAINTS" ADD CONSTRAINT "MD_CONSTRAINTS_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_CONSTRAINT_DETAILS
--------------------------------------------------------

  ALTER TABLE "MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_MD__FK1" FOREIGN KEY ("CONSTRAINT_ID_FK")
	  REFERENCES "MD_CONSTRAINTS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MD_CONSTRAINT_DETAILS" ADD CONSTRAINT "MD_CONSTRAINT_DETAILS_MD__FK2" FOREIGN KEY ("COLUMN_ID_FK")
	  REFERENCES "MD_COLUMNS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_DERIVATIVES
--------------------------------------------------------

  ALTER TABLE "MD_DERIVATIVES" ADD CONSTRAINT "MD_DERIVATIVES_MD_CONNECT_FK1" FOREIGN KEY ("DERIVED_CONNECTION_ID_FK")
	  REFERENCES "MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUPS
--------------------------------------------------------

  ALTER TABLE "MD_GROUPS" ADD CONSTRAINT "MD_GROUPS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUP_MEMBERS
--------------------------------------------------------

  ALTER TABLE "MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_GROUPS_FK1" FOREIGN KEY ("GROUP_ID_FK")
	  REFERENCES "MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_GROUPS_FK2" FOREIGN KEY ("GROUP_MEMBER_ID_FK")
	  REFERENCES "MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MD_GROUP_MEMBERS" ADD CONSTRAINT "MD_GROUPMEMBERS_MD_USERS_FK1" FOREIGN KEY ("USER_ID_FK")
	  REFERENCES "MD_USERS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_GROUP_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_MD_GR_FK1" FOREIGN KEY ("GROUP_ID_FK")
	  REFERENCES "MD_GROUPS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MD_GROUP_PRIVILEGES" ADD CONSTRAINT "MD_GROUP_PRIVILEGES_MD_PR_FK1" FOREIGN KEY ("PRIVILEGE_ID_FK")
	  REFERENCES "MD_PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_INDEXES
--------------------------------------------------------

  ALTER TABLE "MD_INDEXES" ADD CONSTRAINT "MD_INDEXES_MD_TABLES_FK1" FOREIGN KEY ("TABLE_ID_FK")
	  REFERENCES "MD_TABLES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_INDEX_DETAILS
--------------------------------------------------------

  ALTER TABLE "MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_MD_COLUM_FK1" FOREIGN KEY ("COLUMN_ID_FK")
	  REFERENCES "MD_COLUMNS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MD_INDEX_DETAILS" ADD CONSTRAINT "MD_INDEX_DETAILS_MD_INDEX_FK1" FOREIGN KEY ("INDEX_ID_FK")
	  REFERENCES "MD_INDEXES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_DEPENDENCY
--------------------------------------------------------

  ALTER TABLE "MD_MIGR_DEPENDENCY" ADD CONSTRAINT "MIGR_DEPENDENCY_FK" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_PARAMETER
--------------------------------------------------------

  ALTER TABLE "MD_MIGR_PARAMETER" ADD CONSTRAINT "MIGR_PARAMETER_FK" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_MIGR_WEAKDEP
--------------------------------------------------------

  ALTER TABLE "MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MD_MIGR_WEAKDEP" ADD CONSTRAINT "MIGR_WEAKDEP_FK2" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_OTHER_OBJECTS
--------------------------------------------------------

  ALTER TABLE "MD_OTHER_OBJECTS" ADD CONSTRAINT "MD_OTHER_OBJECTS_MD_SCHEM_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_PACKAGES
--------------------------------------------------------

  ALTER TABLE "MD_PACKAGES" ADD CONSTRAINT "MD_PACKAGES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "MD_PRIVILEGES" ADD CONSTRAINT "MD_PRIVILEGES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SCHEMAS
--------------------------------------------------------

  ALTER TABLE "MD_SCHEMAS" ADD CONSTRAINT "MD_SCHEMAS_MD_CATALOGS_FK1" FOREIGN KEY ("CATALOG_ID_FK")
	  REFERENCES "MD_CATALOGS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SEQUENCES
--------------------------------------------------------

  ALTER TABLE "MD_SEQUENCES" ADD CONSTRAINT "MD_SEQUENCES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_STORED_PROGRAMS
--------------------------------------------------------

  ALTER TABLE "MD_STORED_PROGRAMS" ADD CONSTRAINT "MD_STORED_PROGRAMS_MD_PAC_FK1" FOREIGN KEY ("PACKAGE_ID_FK")
	  REFERENCES "MD_PACKAGES" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MD_STORED_PROGRAMS" ADD CONSTRAINT "MD_STORED_PROGRAMS_MD_SCH_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_SYNONYMS
--------------------------------------------------------

  ALTER TABLE "MD_SYNONYMS" ADD CONSTRAINT "MD_SYNONYMS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_TABLES
--------------------------------------------------------

  ALTER TABLE "MD_TABLES" ADD CONSTRAINT "MD_TABLES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_TABLESPACES
--------------------------------------------------------

  ALTER TABLE "MD_TABLESPACES" ADD CONSTRAINT "MD_TABLESPACES_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USERS
--------------------------------------------------------

  ALTER TABLE "MD_USERS" ADD CONSTRAINT "MD_USERS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USER_DEFINED_DATA_TYPES
--------------------------------------------------------

  ALTER TABLE "MD_USER_DEFINED_DATA_TYPES" ADD CONSTRAINT "MD_USER_DEFINED_DATA_TYPE_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_USER_PRIVILEGES
--------------------------------------------------------

  ALTER TABLE "MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_MD_PRI_FK1" FOREIGN KEY ("PRIVILEGE_ID_FK")
	  REFERENCES "MD_PRIVILEGES" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MD_USER_PRIVILEGES" ADD CONSTRAINT "MD_USER_PRIVILEGES_MD_USE_FK1" FOREIGN KEY ("USER_ID_FK")
	  REFERENCES "MD_USERS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MD_VIEWS
--------------------------------------------------------

  ALTER TABLE "MD_VIEWS" ADD CONSTRAINT "MD_VIEWS_MD_SCHEMAS_FK1" FOREIGN KEY ("SCHEMA_ID_FK")
	  REFERENCES "MD_SCHEMAS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MENYEWA
--------------------------------------------------------

  ALTER TABLE "MENYEWA" ADD CONSTRAINT "ID_KAMAR_FK" FOREIGN KEY ("ID_KAMAR")
	  REFERENCES "KAMAR" ("ID_KAMAR") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "MENYEWA" ADD CONSTRAINT "ID_TRANSAKSI_FK1" FOREIGN KEY ("ID_TRANSAKSI")
	  REFERENCES "TRANSAKSI_SEWAKAMAR" ("ID_TRANSAKSI") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGRLOG
--------------------------------------------------------

  ALTER TABLE "MIGRLOG" ADD CONSTRAINT "MIGR_MIGRLOG_FK" FOREIGN KEY ("PARENT_LOG_ID")
	  REFERENCES "MIGRLOG" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_MAP" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_M_FK1" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  ALTER TABLE "MIGR_DATATYPE_TRANSFORM_RULE" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_R_FK1" FOREIGN KEY ("MAP_ID_FK")
	  REFERENCES "MIGR_DATATYPE_TRANSFORM_MAP" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MIGR_GENERATION_ORDER
--------------------------------------------------------

  ALTER TABLE "MIGR_GENERATION_ORDER" ADD CONSTRAINT "MIGR_GENERATION_ORDER_MD__FK1" FOREIGN KEY ("CONNECTION_ID_FK")
	  REFERENCES "MD_CONNECTIONS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRANSAKSI_SEWAKAMAR
--------------------------------------------------------

  ALTER TABLE "TRANSAKSI_SEWAKAMAR" ADD CONSTRAINT "ID_PETUGAS_FK" FOREIGN KEY ("ID_PETUGAS")
	  REFERENCES "PETUGAS" ("ID_PETUGAS") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "TRANSAKSI_SEWAKAMAR" ADD CONSTRAINT "ID_TAMU_FK" FOREIGN KEY ("ID_TAMU")
	  REFERENCES "TAMU" ("ID_TAMU") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  DDL for Trigger CATAT_UPDATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CATAT_UPDATE" AFTER UPDATE ON transaksi_sewakamar FOR EACH ROW
BEGIN
  INSERT INTO log_transaksi
  VALUES (
    'LO'||to_char(log_seq.nextval,'FM000'), :old.id_transaksi, :old.tgl_transaksi, 'update'
  );
END;
/
ALTER TRIGGER "CATAT_UPDATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEL_MD_TRIGGERS_T_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DEL_MD_TRIGGERS_T_TRG" AFTER DELETE ON MD_TABLES 
FOR EACH ROW 
BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = 'T';
END;
/
ALTER TRIGGER "DEL_MD_TRIGGERS_T_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEL_MD_TRIGGERS_V_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "DEL_MD_TRIGGERS_V_TRG" AFTER DELETE ON MD_VIEWS
FOR EACH ROW 
BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = 'V';
END;
/
ALTER TRIGGER "DEL_MD_TRIGGERS_V_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOG_INSERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "LOG_INSERT" 
AFTER INSERT
  ON transaksi_sewakamar
  FOR EACH ROW
DECLARE
BEGIN
  INSERT INTO log_transaksi VALUES (
    'LO'||to_char(log_seq.nextval,'FM000'), 
    :new.id_transaksi,
    :new.tgl_transaksi,
    'insert');
END;
/
ALTER TRIGGER "LOG_INSERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_ADDITIONAL_PROPERTY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_ADDITIONAL_PROPERTY_TRG" BEFORE INSERT OR UPDATE ON MD_ADDITIONAL_PROPERTIES 
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_ADDITIONAL_PROPERTY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_CATALOGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_CATALOGS_TRG" BEFORE INSERT OR UPDATE ON MD_CATALOGS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_CATALOGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_COLUMNS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_COLUMNS_TRG" BEFORE INSERT OR UPDATE ON MD_COLUMNS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_COLUMNS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_CONNECTIONS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_CONNECTIONS_TRG" BEFORE INSERT OR UPDATE ON MD_CONNECTIONS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_CONNECTIONS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_CONSTRAINTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_CONSTRAINTS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINTS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_CONSTRAINTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_CONSTRAINT_DETAILS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_CONSTRAINT_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINT_DETAILS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_CONSTRAINT_DETAILS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_DERIVATIVES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_DERIVATIVES_TRG" BEFORE INSERT OR UPDATE ON MD_DERIVATIVES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_DERIVATIVES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_GROUPS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_GROUPS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUPS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_GROUPS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_GROUP_MEMBERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_GROUP_MEMBERS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_MEMBERS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_GROUP_MEMBERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_GROUP_PRIVILEGES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_GROUP_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_PRIVILEGES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_GROUP_PRIVILEGES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_INDEXES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_INDEXES_TRG" BEFORE INSERT OR UPDATE ON MD_INDEXES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_INDEXES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_INDEX_DETAILS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_INDEX_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_INDEX_DETAILS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_INDEX_DETAILS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_MIGR_DEPENDENCY_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_MIGR_DEPENDENCY_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_DEPENDENCY
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_MIGR_DEPENDENCY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_MIGR_PARAMETER_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_MIGR_PARAMETER_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_PARAMETER
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_MIGR_PARAMETER_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_MIGR_WEAKDEP_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_MIGR_WEAKDEP_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_WEAKDEP
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_MIGR_WEAKDEP_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_OTHER_OBJECTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_OTHER_OBJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_OTHER_OBJECTS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_OTHER_OBJECTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_PACKAGES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_PACKAGES_TRG" BEFORE INSERT OR UPDATE ON MD_PACKAGES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_PACKAGES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_PRIVILEGES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_PRIVILEGES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_PRIVILEGES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_PROJECTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_PROJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_PROJECTS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_PROJECTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_SCHEMAS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_SCHEMAS_TRG" BEFORE INSERT OR UPDATE ON MD_SCHEMAS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_SCHEMAS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_SEQUENCES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_SEQUENCES_TRG" BEFORE INSERT OR UPDATE ON MD_SEQUENCES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_SEQUENCES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_STORED_PROGRAMS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_STORED_PROGRAMS_TRG" BEFORE INSERT OR UPDATE ON MD_STORED_PROGRAMS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_STORED_PROGRAMS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_SYNONYMS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_SYNONYMS_TRG" BEFORE INSERT OR UPDATE ON MD_SYNONYMS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_SYNONYMS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_TABLESPACES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_TABLESPACES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLESPACES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_TABLESPACES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_TABLES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_TABLES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_TABLES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_TRIGGERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_TRIGGERS_TRG" BEFORE INSERT OR UPDATE ON MD_TRIGGERS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_TRIGGERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_USERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_USERS_TRG" BEFORE INSERT OR UPDATE ON MD_USERS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_USERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_USER_DEFINED_DATA_TYPES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_USER_DEFINED_DATA_TYPES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_DEFINED_DATA_TYPES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_USER_DEFINED_DATA_TYPES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_USER_PRIVILEGES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_USER_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_PRIVILEGES
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_USER_PRIVILEGES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MD_VIEWS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MD_VIEWS_TRG" BEFORE INSERT OR UPDATE ON MD_VIEWS
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MD_VIEWS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MIGRLOG_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MIGRLOG_TRG" BEFORE INSERT OR UPDATE ON MIGRLOG
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MIGRLOG_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MIGR_DATATYPE_MAP_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MIGR_DATATYPE_MAP_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_MAP
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MIGR_DATATYPE_MAP_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MIGR_DATATYPE_RULE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MIGR_DATATYPE_RULE_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_RULE
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MIGR_DATATYPE_RULE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MIGR_GENERATION_ORDER_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "MIGR_GENERATION_ORDER_TRG" BEFORE INSERT OR UPDATE ON MIGR_GENERATION_ORDER
FOR EACH ROW
BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
/
ALTER TRIGGER "MIGR_GENERATION_ORDER_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TDELETE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TDELETE" before delete on transaksi_sewakamar
  for each row
begin
  insert into log_transaksi values(
    'LO'||to_char(log_seq.nextval,'FM000'), 
    :old.id_transaksi,
    :old.tgl_transaksi, 
    'delete');
end; 

/
ALTER TRIGGER "TDELETE" ENABLE;
--------------------------------------------------------
--  DDL for View MGV_ALL_CAPTURED_SQL
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_CAPTURED_SQL" ("ID", "OBJTYPE", "OBJECTNAME", "NATIVE_SQL") AS 
  WITH
captured_schema AS
(SELECT SCHEMA_ID
   FROM mgv_all_schema
  WHERE connection_id IN
  (SELECT ID FROM md_connections WHERE NVL(type,'Captured') != 'CONVERTED')),
captured_connections AS
(SELECT ID FROM md_connections WHERE NVL(type,'Captured') != 'CONVERTED') ,
captured_view_trigger AS
(SELECT v.trigger_id vt
   FROM mgv_all_view_triggers v
  WHERE v.connection_id IN
  (SELECT * FROM captured_connections)) ,
captured_table_trigger AS
(SELECT t.trigger_id tt
   FROM mgv_all_table_triggers t
  WHERE t.connection_id IN
  (SELECT * FROM captured_connections))
SELECT ID,'md_stored_programs' ObjType, Name objectName, native_sql
 FROM md_stored_programs,
captured_schema
WHERE language = 'MSTSQL'
  AND SCHEMA_ID_FK = captured_schema.schema_id
UNION ALL
SELECT ID,'md_views' ObjType, view_Name objectName, native_sql
 FROM md_views,
captured_schema
WHERE language = 'MSTSQL'
  AND SCHEMA_ID_FK = captured_schema.schema_id
UNION ALL
SELECT ID,'md_triggers' ObjType, trigger_Name objectName, native_sql
 FROM md_triggers
WHERE language = 'MSTSQL'
  AND (md_triggers.id in (select vt from captured_view_trigger union select tt from captured_table_trigger  ));
--------------------------------------------------------
--  DDL for View MGV_ALL_CATALOGS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_CATALOGS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "DBURL", "CATALOG_ID", "CATALOG_NAME") AS 
  SELECT  md_projects.id project_id            ,
                md_projects.project_name project_name,
                md_connections.id connection_id      ,
                md_connections.host host             ,
                md_connections.port port             ,
                md_connections.username username     ,
                md_connections.dburl dburl           ,
                md_catalogs.id catalog_id            ,
                md_catalogs.catalog_name catalog_name
        FROM    md_projects   ,
                md_connections,
                md_catalogs
        WHERE   md_catalogs.connection_id_fk = md_connections.id
            AND md_connections.project_id_fk = md_projects.id WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_CONNECTIONS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_CONNECTIONS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "DBURL") AS 
  SELECT  md_projects.id project_id            ,
                md_projects.project_name project_name,
                md_connections.id connection_id      ,
                md_connections.host host             ,
                md_connections.port port             ,
                md_connections.username username     ,
                md_connections.dburl dburl
        FROM    md_projects,
                md_connections
        WHERE   md_connections.project_id_fk = md_projects.id WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_SCHEMA
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_SCHEMA" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME") AS 
  SELECT  md_projects.id project_id            ,
                md_projects.project_name project_name,
                md_connections.id connection_id      ,
                md_connections.host host             ,
                md_connections.port port             ,
                md_connections.username username     ,
                md_catalogs.id catalog_id            ,
                md_catalogs.catalog_name catalog_name,
                md_schemas.id schema_id              ,
                md_schemas.name schema_name
        FROM    md_connections,
                md_catalogs   ,
                md_schemas    ,
                md_projects
        WHERE   md_schemas.catalog_id_fk     = md_catalogs.id
            AND md_catalogs.connection_id_fk = md_connections.id
            AND md_connections.project_id_fk = md_projects.id WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_STORED_PROGRAMS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_STORED_PROGRAMS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME", "STORED_PROGRAM_ID", "PROGRAMTYPE", "STORED_PROGRAM_NAME", "PACKAGE_ID_FK") AS 
  SELECT  md_projects.id project_id                  ,
                md_projects.project_name project_name      ,
                md_connections.id connection_id            ,
                md_connections.host host                   ,
                md_connections.port port                   ,
                md_connections.username username           ,
                md_catalogs.id catalog_id                  ,
                md_catalogs.catalog_name catalog_name      ,
                md_schemas.id schema_id                    ,
                md_schemas.name schema_name                ,
                md_stored_programs.id stored_program_id    ,
                md_stored_programs.programtype programtype ,
                md_stored_programs.name stored_program_name,
                md_stored_programs.package_id_fk package_id_fk
        FROM    md_projects   ,
                md_connections,
                md_catalogs   ,
                md_schemas    ,
                md_stored_programs
        WHERE   md_stored_programs.schema_id_fk = md_schemas.id
            AND md_schemas.catalog_id_fk        = md_catalogs.id
            AND md_catalogs.connection_id_fk    = md_connections.id
            AND md_connections.project_id_fk    = md_projects.id;
--------------------------------------------------------
--  DDL for View MGV_ALL_TABLES
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_TABLES" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "DBURL", "CATALOG_ID", "CATALOG_NAME", "SCHEMA_ID", "SCHEMA_NAME", "TABLE_ID", "TABLE_NAME") AS 
  SELECT  md_projects.id project_id            ,
                md_projects.project_name project_name,
                md_connections.id connection_id      ,
                md_connections.host host             ,
                md_connections.port port             ,
                md_connections.username username     ,
                md_connections.dburl dburl           ,
                md_catalogs.id catalog_id            ,
                md_catalogs.catalog_name catalog_name,
                md_schemas.id schema_id              ,
                md_schemas.name schema_name          ,
                md_tables.id table_id                ,
                md_tables.TABLE_NAME TABLE_NAME
        FROM    md_connections,
                md_catalogs   ,
                md_schemas    ,
                md_tables     ,
                md_projects
        WHERE   md_tables.schema_id_fk       = md_schemas.id
            AND md_schemas.catalog_id_fk     = md_catalogs.id
            AND md_catalogs.connection_id_fk = md_connections.id
            AND md_connections.project_id_fk = md_projects.id WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_TABLE_TRIGGERS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_TABLE_TRIGGERS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "TABLE_ID", "TABLE_NAME", "TRIGGER_ID", "TRIGGER_NAME") AS 
  SELECT  md_projects.id project_id            ,
                md_projects.project_name project_name,
                md_connections.id connection_id      ,
                md_connections.host host             ,
                md_connections.port port             ,
                md_connections.username username     ,
                md_catalogs.id catalog_id            ,
                md_catalogs.catalog_name catalog_name,
                md_catalogs.dummy_flag dummy_flag    ,
                md_schemas.id schema_id              ,
                md_schemas.name schema_name          ,
                md_tables.id table_id                ,
                md_tables.TABLE_NAME TABLE_NAME      ,
                md_triggers.id trigger_id            ,
                md_triggers.trigger_name trigger_name
        FROM    md_projects   ,
                md_connections,
                md_catalogs   ,
                md_schemas    ,
                md_tables     ,
                md_triggers
        WHERE   md_triggers.table_or_view_id_fk = md_tables.id
            AND md_tables.schema_id_fk          = md_schemas.id
            AND md_schemas.catalog_id_fk        = md_catalogs.id
            AND md_catalogs.connection_id_fk    = md_connections.id
            AND md_connections.project_id_fk    = md_projects.id;
--------------------------------------------------------
--  DDL for View MGV_ALL_VIEWS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_VIEWS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "VIEW_ID", "VIEW_NAME") AS 
  SELECT  md_projects.id project_id            ,
                md_projects.project_name project_name,
                md_connections.id connection_id      ,
                md_connections.host host             ,
                md_connections.port port             ,
                username username                    ,
                md_catalogs.id catalog_id            ,
                md_catalogs.catalog_name catalog_name,
                md_catalogs.dummy_flag dummy_flag    ,
                md_schemas.id schema_id              ,
                md_schemas.name schema_name          ,
                md_views.id view_id                  ,
                md_views.view_name view_name
        FROM    md_projects   ,
                md_connections,
                md_catalogs   ,
                md_schemas    ,
                md_views
        WHERE   md_views.schema_id_fk        = md_schemas.id
            AND md_schemas.catalog_id_fk     = md_catalogs.id
            AND md_catalogs.connection_id_fk = md_connections.id
            AND md_connections.project_id_fk = md_projects.id WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MGV_ALL_VIEW_TRIGGERS
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MGV_ALL_VIEW_TRIGGERS" ("PROJECT_ID", "PROJECT_NAME", "CONNECTION_ID", "HOST", "PORT", "USERNAME", "CATALOG_ID", "CATALOG_NAME", "DUMMY_FLAG", "SCHEMA_ID", "SCHEMA_NAME", "VIEW_ID", "VIEW_NAME", "TRIGGER_ID", "TRIGGER_NAME") AS 
  SELECT  md_projects.id project_id            ,
                md_projects.project_name project_name,
                md_connections.id connection_id      ,
                md_connections.host host             ,
                md_connections.port port             ,
                md_connections.username username     ,
                md_catalogs.id catalog_id            ,
                md_catalogs.catalog_name catalog_name,
                md_catalogs.dummy_flag dummy_flag    ,
                md_schemas.id schema_id              ,
                md_schemas.name schema_name          ,
                md_views.id view_id                  ,
                md_views.view_name view_name         ,
                md_triggers.id trigger_id            ,
                md_triggers.trigger_name trigger_name
        FROM    md_projects   ,
                md_connections,
                md_catalogs   ,
                md_schemas    ,
                md_views      ,
                md_triggers
        WHERE   md_triggers.table_or_view_id_fk = md_views.id
            AND md_views.schema_id_fk           = md_schemas.id
            AND md_schemas.catalog_id_fk        = md_catalogs.id
            AND md_catalogs.connection_id_fk    = md_connections.id
            AND md_connections.project_id_fk    = md_projects.id;
--------------------------------------------------------
--  DDL for Function COUNT_TAMU
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "COUNT_TAMU" (bln NUMBER, kelas VARCHAR2) RETURN NUMBER
AS x NUMBER;
BEGIN
  SELECT COUNT(baru."Bulan") INTO x
  FROM ( SELECT transaksi_sewakamar.id_transaksi, nama_jenis, EXTRACT(MONTH FROM tgl_transaksi) "Bulan"
          FROM transaksi_sewakamar
          LEFT JOIN menyewa
          ON transaksi_sewakamar.id_transaksi=menyewa.id_transaksi
          LEFT JOIN kamar
          ON menyewa.id_kamar=kamar.id_kamar  
          LEFT JOIN jenis_kamar
          ON kamar.id_jenis=jenis_kamar.id_jenis
          WHERE EXTRACT(MONTH FROM tgl_transaksi)=bln AND nama_jenis=kelas
  ) baru
  GROUP BY baru."Bulan";
  RETURN x;
END;

/

--------------------------------------------------------
--  DDL for Function PEMASUKAN
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "PEMASUKAN" (i varchar) return numeric as
harga_temp numeric;
total numeric;
jumlah numeric;
begin
harga_temp:=0;
total:=0;
jumlah:=0;
select sum(harga) into harga_temp from jenis_kamar, wisma where id_wisma=i and id_jenis in
(
  select id_jenis
  from kamar
  where id_wisma in
  (
   select id_wisma
   from wisma
  )
);
select count(*) into jumlah from transaksi_sewakamar, wisma where id_wisma=i;

total:=harga_temp*jumlah;
return total;

end;

/

--------------------------------------------------------
--  DDL for Function SETHARGA
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "SETHARGA" 
( id_tr IN VARCHAR2)
  RETURN number
IS
  res number;
  lama number;
  harga number;
  
  cursor clama is
    SELECT lama
    FROM transaksi_sewakamar
    WHERE id_transaksi=id_tr;
  
  cursor charga is
    SELECT harga
    FROM jenis_kamar j, 
      (SELECT id_jenis
      FROM kamar km, 
        (SELECT DISTINCT id_kamar
        FROM menyewa
        WHERE id_transaksi=id_tr) id_km
      WHERE id_km.id_kamar=km.id_kamar
      ) id_je
    WHERE id_je.id_jenis=j.id_jenis;
BEGIN
  open clama;
  open charga;
  
  fetch charga into harga;
  fetch clama into lama;
  res := lama * harga;
  return harga;
END;

/

--------------------------------------------------------
--  DDL for Package MD_META
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MD_META" 
AS
FUNCTION get_next_id RETURN NUMBER;
-- Following code taken directly from wwv_flow_random from APEX
--
-- seed random function
procedure srand( new_seed in number );

function rand return number;
pragma restrict_references( rand, WNDS  );

procedure get_rand( r OUT number );

function rand_max( n IN number ) return number;
pragma restrict_references( rand_max, WNDS);

procedure get_rand_max( r OUT number, n IN number );

END;

/

--------------------------------------------------------
--  DDL for Package MIGRATION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MIGRATION" 
AS

-- Public functions
FUNCTION copy_connection_cascade(p_connectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER;
FUNCTION transform_all_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE, p_prefixName VARCHAR2) RETURN NAME_AND_COUNT_ARRAY;
FUNCTION transform_datatypes(p_connectionid MD_CONNECTIONS.ID%TYPE, p_mapid MIGR_DATATYPE_TRANSFORM_MAP.ID%TYPE, p_numbytesperchar INTEGER) RETURN NUMBER;
FUNCTION transform_identity_columns(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER;
FUNCTION transform_rewrite_trigger(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER;
FUNCTION gatherConnectionStats(p_connectionId MD_CONNECTIONS.ID%TYPE) RETURN NUMBER;
PROCEDURE transform_clashes(p_connectionid MD_CONNECTIONS.ID%TYPE);
END;

/

--------------------------------------------------------
--  DDL for Package MIGRATION_REPORT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MIGRATION_REPORT" AS 
--get status
  FUNCTION getCaptureStatus(srcid IN NUMBER)  RETURN VARCHAR2;
  FUNCTION getConvertStatus(srcid IN NUMBER,convert_conn_id IN NUMBER)  RETURN VARCHAR2;
  FUNCTION getGenerateStatus(srcid IN NUMBER,convert_conn_id IN NUMBER)  RETURN VARCHAR2;
--migration details
  FUNCTION getDetails(capture_conn_id IN NUMBER,convert_conn_id IN NUMBER) RETURN MIGR_REPORT_DETAIL_TABLE PIPELINED; 
--migration summary
   FUNCTION getSum(capture_conn_id IN NUMBER,convert_conn_id IN NUMBER) RETURN MIGR_REPORT_SUM_TABLE PIPELINED;
END MIGRATION_REPORT;

/

--------------------------------------------------------
--  DDL for Package MIGRATION_TRANSFORMER
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "MIGRATION_TRANSFORMER" AS
FUNCTION check_identifier_length(p_ident VARCHAR2) RETURN VARCHAR2;
FUNCTION add_suffix(p_work VARCHAR2, p_suffix VARCHAR2, p_maxlen NUMBER) RETURN VARCHAR2;
FUNCTION check_reserved_word(p_work VARCHAR2) RETURN VARCHAR2;
FUNCTION sys_check(p_work VARCHAR2) RETURN VARCHAR2;
FUNCTION check_allowed_chars(p_work NVARCHAR2) RETURN NVARCHAR2;
FUNCTION transform_identifier(p_identifier NVARCHAR2)  RETURN NVARCHAR2;
END;

/

--------------------------------------------------------
--  DDL for Package Body MD_META
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MD_META" AS

    multiplier constant number  := 22695477;
    increment  constant number  := 1;
    "2^32"     constant number  := 2 ** 32;
    "2^16"     constant number  := 2 ** 16;
    "0x7fff"   constant number  := 32767;
    Seed       number := 1;
    g_curr_val NUMBER DEFAULT NULL;
/*
 * Get the next available id for objectids.
 * @return the next id that can be used in objectid fields
 * This code is taken from wwv_flows
 */
FUNCTION get_next_id RETURN NUMBER
IS
BEGIN
/*
	select  to_number(
                 to_char(dbobjectid_sequence.nextval) ||
                      lpad( substr( abs(rand), 1, 5 ),5, '0' ) ||
                   ltrim(to_char(mod(abs(hsecs),1000000),'000000')))
    into    g_curr_val
    from   sys.v_$timer;
*/
	select to_number(
				to_char(dbobjectid_sequence.nextval) ||
					lpad( substr( abs(rand), 1, 5 ), 5, '0') ||
				ltrim(to_char(mod(dbms_random.value(100000000000, 999999999999),1000000),'000000')))
    into    g_curr_val
	from dual;				

    return g_curr_val;
END get_next_id;
-- Following code taken from wwv_flows_random 
 procedure srand( new_seed in number ) is
 begin
  Seed := new_seed;
 end srand;
--
  function rand return number is
    s number;
  begin
    seed := mod( multiplier * seed + increment, "2^32" );
    begin
       return bitand( seed/"2^16", "0x7fff" );
    --mhichwa
    exception when others then
       select dbobjectid_sequence.nextval into s from dual;
       return s||to_char(sysdate,'HH24MISS');
    end;
  end rand;
--
  procedure get_rand( r OUT number ) is
  begin
    r := rand;
  end get_rand;
--
  function rand_max( n IN number ) return number is
  begin
    return mod( rand, n ) + 1;
  end rand_max;
--
  procedure get_rand_max( r OUT number, n IN number )  is
  begin
    r := rand_max( n );
  end get_rand_max;
--
-- One time initialisation
begin
  select to_char(sysdate,'JSSSSS')
    into seed
    from dual;
end;

/

--------------------------------------------------------
--  DDL for Package Body MIGRATION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MIGRATION" AS
/**
 * The migration package contains all of the PL/SQL Procedures and functions required by the migration
 * system.
 * @author Barry McGillin
 * @author Dermot Daly.
 */
v_prefixName VARCHAR2(4) :=''; --text to prefix objects with ,set using transform_all_identifiers
-- Constants that are used throughout the package body.
C_CONNECTIONTYPE_CONVERTED   CONSTANT MD_CONNECTIONS.TYPE%TYPE := 'CONVERTED';
-- Supported object types.
C_OBJECTTYPE_CONNECTIONS     CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_CONNECTIONS';
C_OBJECTTYPE_CATALOGS        CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_CATALOGS';
C_OBJECTTYPE_SCHEMAS         CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_SCHEMAS';
C_OBJECTTYPE_TABLES          CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_TABLES';
C_OBJECTTYPE_COLUMNS         CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_COLUMNS';
C_OBJECTTYPE_CNSTRNT_DETAILS CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_CONSTRAINT_DETAILS';
C_OBJECTTYPE_CONSTRAINTS     CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_CONSTRAINTS';
C_OBJECTTYPE_INDEX_DETAILS   CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_INDEX_DETAILS';
C_OBJECTTYPE_INDEXES         CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_INDEXES';
C_OBJECTTYPE_TRIGGERS        CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_TRIGGERS';
C_OBJECTTYPE_VIEWS           CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_VIEWS';
C_OBJECTTYPE_USERS           CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_USERS';
C_OBJECTTYPE_GROUP_MEMBERS   CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_GROUPMEMBERS';
C_OBJECTTYPE_GROUPS          CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_GROUPS';
C_OBJECTTYPE_OTHER_OBJECTS   CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_OTHER_OBJECTS';
C_OBJECTTYPE_TABLESPACES     CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_TABLESPACES';
C_OBJECTTYPE_UDDT            CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_USER_DEFINED_DATA_TYPES';
C_OBJECTTYPE_STORED_PROGRAMS CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_STORED_PROGRAMS';
C_OBJECTTYPE_PACKAGES        CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_PACKAGES';
C_OBJECTTYPE_SYNONYMS        CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_SYNONYMS';
C_OBJECTTYPE_SEQUENCES       CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_SEQUENCES';
C_OBJECTTYPE_PRIVILEGES      CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_PRIVILEGES';
C_OBJECTTYPE_USER_PRIVILEGES CONSTANT MD_DERIVATIVES.SRC_TYPE%TYPE := 'MD_USER_PRIVILEGES';
-- Dummy flag for a dummy catalog.
C_DUMMYFLAG_TRUE             CONSTANT MD_CATALOGS.DUMMY_FLAG%TYPE := 'Y';
-- Flag in MD_DERIVATIVES to show if something has been transformed
C_TRANSFORMED_TRUE           CONSTANT MD_DERIVATIVES.TRANSFORMED%TYPE := 'Y';
-- Flag in MD_SYNONYMS.PRIVATE_VISIBILITY to highlight that a synonym is marked as private
C_SYNONYM_PRIVATE            CONSTANT MD_SYNONYMS.PRIVATE_VISIBILITY%TYPE := 'Y';
-- Flag in MD_GROUPS.GROUP_FLAG to show this is a role
C_ROLE_FLAG                  CONSTANT MD_GROUPS.GROUP_FLAG%TYPE := 'R';
-- Flag in MD_COLUMNS TO SHOW A COLUMN IS NULLABLE
C_NULLABLE_YES               CONSTANT MD_COLUMNS.NULLABLE%TYPE := 'Y';
-- Special defined additional properties.
C_PROPKEY_SEEDVALUE          CONSTANT MD_ADDITIONAL_PROPERTIES.PROP_KEY%TYPE := 'SEEDVALUE';
C_PROPKEY_INCREMENT          CONSTANT MD_ADDITIONAL_PROPERTIES.PROP_KEY%TYPE := 'INCREMENT';
C_PROPKEY_LASTVALUE          CONSTANT MD_ADDITIONAL_PROPERTIES.PROP_KEY%TYPE := 'LASTVALUE';
C_PROPKEY_EXTENDEDINDEXTYPE	 CONSTANT MD_ADDITIONAL_PROPERTIES.PROP_KEY%TYPE := 'EXTENDEDINDEXTYPE';
C_PROPKEY_SEQUENCEID	       CONSTANT MD_ADDITIONAL_PROPERTIES.PROP_KEY%TYPE := 'SEQUENCEID';
C_PROPKEY_TRIGGER_REWRITE	   CONSTANT MD_ADDITIONAL_PROPERTIES.PROP_KEY%TYPE := 'TRIGGER_REWRITE';
-- Name spaces for identifiers
C_NS_SCHEMA_OBJS             CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_SCHEMAOBJS';
C_NS_INDEXES                 CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_INDEXES';
C_NS_CONSTRAINTS             CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_CONSTRAINTS';
C_NS_CLUSTERS                CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_CLUSTERS';
C_NS_DB_TRIGGERS             CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_DB_TRIGGERS';
C_NS_PRIVATE_DBLINKS         CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_PRIVATEDBLINKS';
C_NS_DIMENSIONS              CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_DIMENSIONS';
C_NS_USER_ROLES              CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_USERROLES';
C_NS_PUBLIC_SYNONYMS         CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_PUB_SYNONYMS';
C_NS_PUBLIC_DBLINKS          CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_PUBLICDBLINKS';
C_NS_TABLESPACES             CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_TABLESPACES';
C_NS_PROFILES                CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_PROFILES';
C_NS_DATABASE                CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_DATABASE';
C_NS_USERS                   CONSTANT MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := 'NS_USERS';
-- Constants for Filter Types
 -- Filter Types are 0-> ALL, 1->NAMELIST, 2->WHERE CLAUSE, 3->OBJECTID LIST
C_FILTERTYPE_ALL	     CONSTANT INTEGER := 0;
C_FILTERTYPE_NAMELIST	     CONSTANT INTEGER := 1;
C_FILTERTYPE_WHERECLAUSE     CONSTANT INTEGER := 2;
C_FILTERTYPE_OBJECTIDLIST    CONSTANT INTEGER := 3;
-- Constatns for TEXT INDEX TYPES
-- see http://download-west.oracle.com/docs/cd/B10501_01/text.920/a96518/csql.htm#19446
-- Use this index type when there is one CLOB or BLOB column in the index only
C_INDEXTYPE_CONTEXT	CONSTANT MD_ADDITIONAL_PROPERTIES.VALUE%TYPE := 'ctxsys.context';
-- Use this index type when the index containst a CLOB or BLOB column.
C_INDEXTYPE_CTXCAT CONSTANT  MD_ADDITIONAL_PROPERTIES.VALUE%TYPE := 'ctxsys.ctxcat';
-- Constant for LANGUAGE - Used in MD_TRIGGERS, MD_PACKAGES, MD_STORED_PROGRAMS, MD_VIEWS, and MD_CONSTRAINTS
C_LANGUAGEID_ORACLE CONSTANT MD_TRIGGERS.LANGUAGE%TYPE := 'OracleSQL';
-- Type for a generic REF CURSOR
TYPE REF_CURSOR IS REF CURSOR;
/**
 * Find a filter element from a filter list
 */
FUNCTION find_filter_for_type(p_filterSet MIGR_FILTER_SET, p_objtype MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE) RETURN MIGR_FILTER
IS
BEGIN
  IF p_filterset is NULL OR p_objtype is NULL then
    return NULL;
  END IF;
  FOR indx in p_filterset.FIRST .. p_filterset.LAST
  LOOP
    if p_filterset(indx).OBJTYPE = p_objtype THEN
      return p_filterset(indx);
    end if;
  END LOOP;
  return NULL;
END find_filter_for_type;

/**
 * Convert a name list from a filter into a condition for use in a where clause.
 * @param p_nameList the set of names that form part of the filter
 * @param p_nameField the name of the field to be compared against.
 * @return A condition that can be used in a where clause.
 */
FUNCTION namelist_to_where_clause(p_nameList NAMELIST, p_nameField VARCHAR2) RETURN VARCHAR2
IS
  v_ret VARCHAR2(4000);
BEGIN
  v_ret := p_nameField || ' IN (';
  FOR indx IN p_nameList.FIRST .. p_nameList.LAST
  LOOP
    v_ret := v_ret || '''' || p_nameList(indx) || '''';
    IF  indx != p_nameList.LAST THEN
      v_ret := v_ret || ', ';
    END IF;
  END LOOP;
  v_ret := v_ret || ')';
  return v_ret;
END namelist_to_where_clause;

/**
 * Convert an object id list from a filter into a condition for use in a where clause.
 * @param p_oidList The list of object ids taken from the filter.
 * @param p_idFIeld The field to be tested against.
 * @return A condition that can be used in a where clause.
 */
FUNCTION objectIdList_to_where_clause(p_oidList OBJECTIDLIST, p_idField VARCHAR2) RETURN VARCHAR2
IS
  v_ret VARCHAR2(4000);
BEGIN
  V_RET := p_idField || ' IN (';
  FOR indx IN p_oidList.FIRST .. p_oidList.LAST
  LOOP
    v_ret := v_ret || TO_CHAR(p_oidList(indx));
    IF indx != p_oidList.LAST THEN
      v_ret := v_ret || ', ';
    END IF;
  END LOOP;
  v_ret := v_ret || ')';
  return v_ret;
END objectIdList_to_where_clause;

/**
 * Convert a filter to a condition for use in a where clause.
 * @param p_filter The filter
 * @param p_nameFileld The name field that will be used in the names list or where clause.
 * @param p_idField The id field that will be used if the filter is an objectid list.
 * @return A condition that could be used in a where clause.  NULL if no additional filtering is required.
 */
FUNCTION where_clause_from_filter(p_filter MIGR_FILTER, p_nameField VARCHAR2, p_idField VARCHAR2) RETURN VARCHAR2
IS
BEGIN
	IF p_filter.FILTER_TYPE = C_FILTERTYPE_ALL THEN
	  RETURN NULL;
    ELSIF p_filter.FILTER_TYPE = C_FILTERTYPE_NAMELIST THEN
      RETURN namelist_to_where_clause(p_filter.NAMES, p_nameField);
    ELSIF p_filter.FILTER_TYPE = C_FILTERTYPE_WHERECLAUSE THEN
	  RETURN p_nameField || ' ' || p_filter.WHERECLAUSE;
    ELSE
	  RETURN objectidlist_to_where_clause(p_filter.OBJECTIDS, p_idField);
	END IF;
END where_clause_from_filter;

/**
 * Apply a filter to an existing select statement
 * @param p_filter_set The filter set.
 * @param p_filter_type The type of the object, for finding in the filter set.
 * @param p_name_field The name field of the table being filtered
 * @param p_id_field The id field of the table being filtered.
 * @param p_select_stmt The select statment to tag the new condition on to
 * @return The select statement with the new condition added to it (or the original statement if
 *         there is no applicable filter for this object type.
 */
FUNCTION apply_filter(p_filter_set MIGR_FILTER_SET,
                      p_filter_type MD_DERIVATIVES.SRC_TYPE%TYPE,
                      p_name_field VARCHAR2,
                      p_id_field VARCHAR2,
                      p_select_stmt VARCHAR2) RETURN VARCHAR2
IS
  v_filt MIGR_FILTER;
  v_condition VARCHAR2(4000);
BEGIN
  v_filt := find_filter_for_type(p_filter_set, p_filter_type);
  --if the filter is null, then we need to set a value that will fail always so nothing is moved.
  -- ie 1=2
  IF v_filt IS NOT NULL THEN
    v_condition := where_clause_from_filter(v_filt, p_name_field, p_id_field);
    IF v_condition IS NOT NULL THEN
      RETURN p_select_stmt || ' AND ' || v_condition;
    ELSE
     RETURN p_select_stmt;
    END IF;
  END IF;
  RETURN p_select_stmt || ' AND 1=2';
END apply_filter;
                      
                      
/**
 * Find the copy of a particular object.  This function checks for a copied object of a particular
 * type by searching the MD_DERIVATIVES table.
 * @param p_objectid The id of the object to search for.
 * @param p_objecttype The type of the object to search for.
 * @return the id of the copy object if it is present, or NULL if it is not.
 */
FUNCTION find_object_copy(p_objectid md_projects.id%TYPE, p_objecttype MD_DERIVATIVES.SRC_TYPE%TYPE, p_derivedconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS 
  v_ret MD_DERIVATIVES.DERIVED_ID%TYPE;
BEGIN
  SELECT derived_id INTO v_ret FROM MD_DERIVATIVES
    WHERE src_id = p_objectid 
     AND src_type = p_objecttype
     AND derived_type = p_objecttype 
     AND derived_connection_id_fk = p_derivedconnectionid;
  RETURN v_ret;
EXCEPTION
  WHEN NO_DATA_FOUND then
    -- Should we raise an error?
    RETURN NULL;
END find_object_copy;

/**
 * Copy additional properties. function copies the additional properties for an object.
 * @param p_refobjectid The object id whose additional properties have to be copied
 * @param p_newrefobject The id of the copied object the new properties should refer to
 * @return number of additional properties copied
 */
FUNCTION copy_additional_properties(p_refobjectid MD_ADDITIONAL_PROPERTIES.REF_ID_FK%TYPE, p_newrefobject MD_PROJECTS.ID%TYPE, p_newconnectionid MD_ADDITIONAL_PROPERTIES.CONNECTION_ID_FK%TYPE) RETURN NUMBER
IS
  CURSOR ORIGINAL_RECS IS SELECT PROPERTY_ORDER, PROP_KEY, REF_TYPE, VALUE FROM MD_ADDITIONAL_PROPERTIES WHERE REF_ID_FK=p_refobjectid;
  v_numcopied NUMBER := 0;
BEGIN
  for newrec in ORIGINAL_RECS LOOP
    INSERT INTO MD_ADDITIONAL_PROPERTIES (ref_id_fk, ref_type, property_order, prop_key, value, connection_id_fk)
      VALUES (p_newrefobject, newrec.ref_type, newrec.property_order, newrec.prop_key, newrec.value, p_newconnectionid);
    v_numcopied := v_numcopied + 1;
  END LOOP;
  commit;
  return v_numcopied;
END copy_additional_properties;

FUNCTION copy_connection(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  newrec MD_CONNECTIONS%ROWTYPE;
  newid MD_CONNECTIONS.ID%TYPE;
  origName MD_CONNECTIONS.NAME%TYPE;
BEGIN
  SELECT * INTO newrec from MD_CONNECTIONS WHERE id = p_connectionid;
  newrec.TYPE :=C_CONNECTIONTYPE_CONVERTED;
  newrec.HOST := NULL;
  newrec.PORT := NULL;
  newrec.USERNAME := NULL;
  newrec.DBURL := NULL;
  -- TODO.  Need to do this in a more i18n friendly manner.
  origName := newrec.NAME;
  newrec.NAME := 'Converted:' || newrec.NAME;
  -- Let the trigger create the new ID
  newrec.ID := NULL;
  INSERT INTO MD_CONNECTIONS VALUES newrec
  	RETURNING id into newid;
  INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, derived_connection_id_fk, original_identifier, new_identifier)
    VALUES (p_connectionid, C_OBJECTTYPE_CONNECTIONS, newid, C_OBJECTTYPE_CONNECTIONS, newid, origName, newrec.NAME);
  commit;
  return newid;
END copy_connection;

FUNCTION create_dummy_catalog(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  newid MD_CATALOGS.ID%TYPE;
BEGIN
  INSERT INTO MD_CATALOGS (CONNECTION_ID_FK, CATALOG_NAME, DUMMY_FLAG, NATIVE_SQL, NATIVE_KEY)
  VALUES (p_connectionid, ' ', C_DUMMYFLAG_TRUE, NULL, NULL)
  RETURNING ID INTO newid;
  RETURN newid;
END create_dummy_catalog;

FUNCTION find_or_create_dummy_catalog(p_connectionid MD_CONNECTIONS.ID%TYPE, p_catalogid MD_CATALOGS.ID%TYPE) RETURN NUMBER
IS
  newrec MD_CATALOGS%ROWTYPE;
  newid MD_CATALOGS.ID%TYPE;
BEGIN
  SELECT * INTO newrec from MD_CATALOGS where connection_id_fk = p_connectionid;
  return newrec.id;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
  INSERT INTO MD_CATALOGS (CONNECTION_ID_FK, CATALOG_NAME, DUMMY_FLAG, NATIVE_SQL, NATIVE_KEY)
  VALUES (p_connectionid, ' ', C_DUMMYFLAG_TRUE, NULL, NULL)
  RETURNING ID INTO newid;
  INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, derived_connection_id_fk, DERIVED_OBJECT_NAMESPACE)
    VALUES (p_catalogid, C_OBJECTTYPE_CATALOGS, newid, C_OBJECTTYPE_CATALOGS, p_connectionid, C_NS_DATABASE);
  commit;
  return newid;
END find_or_create_dummy_catalog;

FUNCTION copy_individual_catalog(p_catalogid MD_CATALOGS.ID%TYPE) RETURN NUMBER
IS
  newrec MD_CATALOGS%ROWTYPE;
  newconnectionid MD_CATALOGS.CONNECTION_ID_FK%TYPE;
  dummycatalogid MD_CATALOGS.ID%TYPE;
  originalconnectionid MD_CATALOGS.CONNECTION_ID_FK%TYPE;
BEGIN
  -- Catalogs aren't copied as such. Instead, we make a single DUMMY catalog
  -- Within the new connection
  -- So..first see if one exists for the copied connection
  SELECT CONNECTION_ID_FK INTO originalconnectionid FROM MD_CATALOGS WHERE ID = p_catalogid;
  -- For connections, we have a special case.  We can't store the new connection, but 0 is ok.
  newconnectionid := find_object_copy(originalconnectionid, C_OBJECTTYPE_CONNECTIONS, 0);
  IF newconnectionid IS NULL THEN
    newconnectionid := copy_connection(originalconnectionid);
  END IF;
  dummycatalogid := find_or_create_dummy_catalog(newconnectionid, p_catalogid);
  RETURN dummycatalogid;  
END copy_individual_catalog;

FUNCTION copy_individual_schema(p_schemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  newid MD_SCHEMAS.ID%TYPE;
  newrec MD_SCHEMAS%ROWTYPE;
  newcatalogid MD_CATALOGS.ID%TYPE;
  originalcatalogname MD_CATALOGS.CATALOG_NAME%TYPE;
  originalcatalogid MD_SCHEMAS.CATALOG_ID_FK%TYPE;
  originalschemaname MD_SCHEMAS.NAME%TYPE;
  originalisdummy CHAR;
BEGIN
  SELECT * INTO newrec FROM md_schemas WHERE id = p_schemaid;
  newcatalogid := find_object_copy(newrec.catalog_id_fk,   C_OBJECTTYPE_CATALOGS, p_newconnectionid);
  originalcatalogid := newrec.catalog_id_fk;
  originalschemaname := newrec.NAME;
  select CATALOG_NAME, DUMMY_FLAG into originalcatalogname, originalisdummy from MD_CATALOGS WHERE ID = originalcatalogid;
  IF newcatalogid IS NULL THEN
    newcatalogid := copy_individual_catalog(newrec.catalog_id_fk);
  END IF;

  newrec.catalog_id_fk := newcatalogid;
  if originalisdummy <> C_DUMMYFLAG_TRUE THEN
    newrec.name := originalcatalogname || '_' || newrec.name;
  end if;
  -- Let the trigger work out the new id
  newrec.ID := NULL;
  INSERT INTO MD_SCHEMAS VALUES newrec RETURNING ID INTO newid;
  INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, original_identifier, new_identifier, DERIVED_OBJECT_NAMESPACE)
    VALUES (p_schemaid, C_OBJECTTYPE_SCHEMAS, newid, C_OBJECTTYPE_SCHEMAS, originalschemaname, newrec.name, C_NS_DATABASE);
  INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type)
    VALUES (originalcatalogid, C_OBJECTTYPE_CATALOGS, newid, C_OBJECTTYPE_SCHEMAS);
  COMMIT;
  return newid;
END copy_individual_schema;

FUNCTION copy_individual_table(p_tableid MD_TABLES.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  newrec MD_TABLES%rowtype;
  newid MD_TABLES.ID%TYPE;
  newschemaid MD_SCHEMAS.ID%TYPE;
BEGIN
  SELECT * INTO newrec FROM MD_tables WHERE id = p_tableid;
  newschemaid := find_object_copy(newrec.schema_id_fk,   C_OBJECTTYPE_SCHEMAS, p_newconnectionid);
  IF newschemaid IS NULL THEN
    newschemaid := copy_individual_schema(newrec.schema_id_fk, p_newconnectionid);
  END IF;

  newrec.schema_id_fk := newschemaid;
  -- Let the trigger work out the new id
  newrec.ID := NULL;
  INSERT INTO MD_TABLES VALUES newrec RETURNING ID INTO newid;
  INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, derived_connection_id_fk, original_identifier, new_identifier, DERIVED_OBJECT_NAMESPACE)
    VALUES(p_tableid,   C_OBJECTTYPE_TABLES,   newid,   C_OBJECTTYPE_TABLES, p_newconnectionid, newrec.table_name, newrec.table_name, C_NS_SCHEMA_OBJS || TO_CHAR(newschemaid));
  COMMIT;
  RETURN newid;
END copy_individual_table;

FUNCTION copy_individual_column(p_columnid MD_COLUMNS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  newid MD_COLUMNS.ID%TYPE;
  newrec MD_COLUMNS%rowtype;
  newtableid MD_TABLES.ID%TYPE;
BEGIN
  SELECT * INTO newrec FROM md_columns WHERE id = p_columnid;
  -- TODO: How do I check if this worked?
  -- OK. We need to fix up table id
  newtableid := find_object_copy(newrec.table_id_fk,   C_OBJECTTYPE_TABLES, p_newconnectionid);

  IF newtableid IS NULL THEN
    newtableid := copy_individual_table(newrec.table_id_fk, p_newconnectionid);
  END IF;

  newrec.table_id_fk := newtableid;
  -- Let the trigger work out the new id
  newrec.ID := NULL;
  INSERT INTO md_columns VALUES newrec RETURNING ID INTO newid;
  -- Columns have their own namespace.  They must be unique within the given table.  So..we'll use the table id as the namespace
  INSERT INTO md_derivatives(src_id,   src_type,   derived_id,   derived_type, derived_connection_id_fk, original_identifier, new_identifier, DERIVED_OBJECT_NAMESPACE)
    VALUES(p_columnid,   C_OBJECTTYPE_COLUMNS,   newid,   C_OBJECTTYPE_COLUMNS, p_newconnectionid, newrec.column_name, newrec.column_name, C_OBJECTTYPE_COLUMNS || TO_CHAR(newtableid));
  COMMIT;
  RETURN newid;
END copy_individual_column;

FUNCTION copy_all_tables(p_connectionid MD_CONNECTIONS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR all_tables_cursor is select table_id from mgv_all_tables where connection_id = p_connectionid;
  v_count NUMBER := 0;
  newid MD_TABLES.ID%TYPE;
BEGIN
  FOR v_tableid IN all_tables_cursor LOOP
    newid := copy_individual_table(v_tableid.table_id, p_newconnectionid);
    v_count := v_count + 1;
  END LOOP;
  RETURN v_count;
END copy_all_tables;

FUNCTION copy_all_columns(p_connectionid MD_CONNECTIONS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR all_columns_cursor is select id from MD_COLUMNS where table_id_fk in 
    (select table_id from MGV_ALL_TABLES where connection_id = p_connectionid);
  v_count NUMBER :=0;
  newid MD_COLUMNS.ID%TYPE;
BEGIN
  FOR v_columnid IN all_columns_cursor LOOP
    newid := copy_individual_column(v_columnid.id, p_newconnectionid);
    v_count := v_count + 1;
  END LOOP;
  return v_count;
END copy_all_columns;

FUNCTION copy_constraint_details(p_oldconsid MD_CONSTRAINTS.ID%TYPE, p_newconsid MD_CONSTRAINTS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR curs is SELECT * FROM MD_CONSTRAINT_DETAILS WHERE CONSTRAINT_ID_FK = p_oldconsid;
  v_newid MD_CONSTRAINT_DETAILS.ID%TYPE;
  v_count NUMBER := 0;
  v_originalid MD_CONSTRAINT_DETAILS.ID%TYPE;
  v_ret NUMBER;
BEGIN
  FOR v_row IN curs LOOP
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.COLUMN_ID_FK := find_object_copy(v_row.COLUMN_ID_FK , C_OBJECTTYPE_COLUMNS, p_newconnectionid);
    v_row.CONSTRAINT_ID_FK := p_newconsid;
    INSERT INTO MD_CONSTRAINT_DETAILS values v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
	-- Constraint details don't have an identifier, so don't need a namespace.
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK)
      VALUES(v_originalid, C_OBJECTTYPE_CNSTRNT_DETAILS, v_newid, C_OBJECTTYPE_CNSTRNT_DETAILS, p_newconnectionid);
  END LOOP;
  return v_count;
END copy_constraint_details;

FUNCTION copy_all_constraints_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
   v_selectStmt VARCHAR2(4000) :=     
  'SELECT * FROM MD_CONSTRAINTS WHERE TABLE_ID_FK IN       
    (SELECT SRC_ID FROM MD_DERIVATIVES WHERE SRC_TYPE = ''' || C_OBJECTTYPE_TABLES ||''' AND DERIVED_TYPE = '''
    || C_OBJECTTYPE_TABLES || ''' AND DERIVED_ID IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE SCHEMA_ID = ' || p_newschemaid || '))';
  v_count NUMBER := 0;
  v_newid MD_CONSTRAINTS.ID%TYPE;
  v_originalid MD_CONSTRAINTS.ID%TYPE;
  v_ret NUMBER;
  v_row MD_CONSTRAINTS%ROWTYPE;
  v_storeRefTableId MD_TABLES.ID%TYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_CONSTRAINTS, 'NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.TABLE_ID_FK := find_object_copy(v_row.TABLE_ID_FK , C_OBJECTTYPE_TABLES, p_newconnectionid);
    if v_row.REFTABLE_ID_FK IS NOT NULL THEN
      v_storeRefTableId := v_row.REFTABLE_ID_FK;
      v_row.REFTABLE_ID_FK := find_object_copy(v_row.REFTABLE_ID_FK , C_OBJECTTYPE_TABLES, p_newconnectionid);
    END IF;
    INSERT INTO MD_CONSTRAINTS values v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid, C_OBJECTTYPE_CONSTRAINTS, v_newid, C_OBJECTTYPE_CONSTRAINTS, p_newconnectionid, v_row.NAME, v_row.NAME, C_NS_CONSTRAINTS|| TO_CHAR(p_newschemaid));
    v_ret := copy_constraint_details(v_originalid, v_newid, p_newconnectionid);
  END LOOP;
  CLOSE cv_curs;
  return v_count;    
END copy_all_constraints_cascade;

FUNCTION copy_all_columns_cascade(p_oldtableid MD_TABLES.ID%TYPE, p_newtableid MD_TABLES.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_COLUMNS WHERE TABLE_ID_FK = ' || p_oldtableid;
  v_originalId MD_COLUMNS.ID%TYPE;
  v_newid MD_COLUMNS.ID%TYPE;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_COLUMNS%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_COLUMNS, 'COLUMN_NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.TABLE_ID_FK := p_newtableid;
    INSERT INTO MD_COLUMNS values  v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
	-- Columns don't need a namespace as such, they must not clash within the table.  We'll handle this
	-- As a special case.
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, original_identifier, new_identifier, DERIVED_OBJECT_NAMESPACE)
    VALUES(v_originalid, C_OBJECTTYPE_COLUMNS, v_newid, C_OBJECTTYPE_COLUMNS, p_newconnectionid, v_row.column_name, v_row.column_name, C_OBJECTTYPE_COLUMNS || TO_CHAR(p_newtableid));
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_columns_cascade;

FUNCTION copy_index_details(p_oldindexid MD_INDEXES.ID%TYPE, p_newindexid MD_INDEXES.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR curs is SELECT * FROM MD_INDEX_DETAILS WHERE MD_INDEX_DETAILS.INDEX_ID_FK = p_oldindexid;
  v_originalid MD_INDEX_DETAILS.ID%TYPE;
  v_newid MD_INDEX_DETAILS.ID%TYPE;
  v_count NUMBER := 0;
  v_ret NUMBER;
BEGIN
  FOR v_row IN CURS LOOP
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.INDEX_ID_FK := p_newindexid;
    v_row.COLUMN_ID_FK := find_object_copy(v_row.COLUMN_ID_FK, C_OBJECTTYPE_COLUMNS, p_newconnectionid);
    INSERT INTO MD_INDEX_DETAILS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
	-- Index details don't have identifiers, so don't need a namespace.
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK)
    VALUES(v_originalid, C_OBJECTTYPE_INDEX_DETAILS, v_newid, C_OBJECTTYPE_INDEX_DETAILS, p_newconnectionid);
  END LOOP;
  RETURN v_count;
END copy_index_details;

FUNCTION copy_all_indexes(p_oldtableid MD_TABLES.ID%TYPE, p_newtableid MD_TABLES.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_filter_set MIGR_FILTER_SET) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_INDEXES WHERE MD_INDEXES.TABLE_ID_FK = ' || p_oldtableid;
  v_originalid MD_INDEXES.ID%TYPE;
  v_newid MD_INDEXES.ID%TYPE;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_INDEXES%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_INDEXES, 'INDEX_NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    
    v_row.ID := NULL;
    v_row.TABLE_ID_FK := p_newtableid;
    INSERT INTO MD_INDEXES values v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
    VALUES(v_originalid, C_OBJECTTYPE_INDEXES, v_newid, C_OBJECTTYPE_INDEXES, p_newconnectionid, v_row.INDEX_NAME, v_row.INDEX_NAME, C_NS_INDEXES || p_newschemaid);
    v_ret := copy_index_details(v_originalid, v_newid, p_newconnectionid);
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_indexes;

FUNCTION copy_all_table_triggers(p_oldtableid MD_TABLES.ID%TYPE, p_newtableid MD_TABLES.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = ' || p_oldtableid;
  v_originalid MD_TRIGGERS.ID%TYPE;
  v_newid MD_TRIGGERS.ID%TYPE;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_TRIGGERS%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_TRIGGERS, 'TRIGGER_NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.TABLE_OR_VIEW_ID_FK := p_newtableid;
    INSERT INTO MD_TRIGGERS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
    VALUES(v_originalid, C_OBJECTTYPE_TRIGGERS, v_newid, C_OBJECTTYPE_TRIGGERS, p_newconnectionid, v_row.TRIGGER_NAME, v_row.TRIGGER_NAME, C_NS_DB_TRIGGERS);
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_table_triggers;

FUNCTION copy_all_tables_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET :=NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  /*CURSOR curs IS SELECT * FROM MD_TABLES where SCHEMA_ID_FK = p_oldschemaid; */
  v_newid MD_TABLES.ID%TYPE := NULL;
  v_originalid MD_TABLES.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_TABLES%ROWTYPE;
  v_filt MIGR_FILTER;
  v_condition VARCHAR2(4000);
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_TABLES where SCHEMA_ID_FK = ' || p_oldschemaid;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_TABLES, 'TABLE_NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_TABLES values v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid, C_OBJECTTYPE_TABLES, v_newid, C_OBJECTTYPE_TABLES, p_newconnectionid, v_row.TABLE_NAME, v_row.TABLE_NAME,  C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid));
    v_ret := copy_all_columns_cascade(v_originalid, v_newid, p_newconnectionid, p_filter_set);
    v_ret := copy_all_indexes(v_originalid, v_newid, p_newconnectionid, p_newschemaid, p_filter_set);
    v_ret := copy_all_table_triggers(v_originalid, v_newid, p_newconnectionid, p_filter_set);
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_tables_cascade;

FUNCTION copy_all_view_triggers(p_oldviewid MD_VIEWS.ID%TYPE, p_newviewid MD_VIEWS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR curs IS SELECT * FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = p_oldviewid;
  v_originalid MD_TRIGGERS.ID%TYPE;
  v_newid MD_TRIGGERS.ID%TYPE;
  v_count NUMBER := 0;
  v_ret NUMBER;
BEGIN
  FOR v_row IN curs LOOP
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.TABLE_OR_VIEW_ID_FK := p_newviewid;
    INSERT INTO MD_TRIGGERS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
    VALUES(v_originalid, C_OBJECTTYPE_TRIGGERS, v_newid, C_OBJECTTYPE_TRIGGERS, p_newconnectionid, v_row.TRIGGER_NAME, v_row.TRIGGER_NAME, C_NS_DB_TRIGGERS);
  END LOOP;
  return v_count;
END copy_all_view_triggers;

FUNCTION copy_all_views_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_VIEWS WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_VIEWS.ID%TYPE := NULL;
  v_originalid MD_VIEWS.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_VIEWS%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_VIEWS, 'VIEW_NAME' ,'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs into v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_VIEWS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid,   C_OBJECTTYPE_VIEWS,   v_newid,   C_OBJECTTYPE_VIEWS, p_newconnectionid, v_row.VIEW_NAME, v_row.VIEW_NAME, C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid));
    v_ret := copy_all_view_triggers(v_originalid, v_newid, p_newconnectionid);
  END LOOP;
  CLOSE cv_curs;
  RETURN v_count;
END copy_all_views_cascade;

FUNCTION copy_group_members(p_oldgroupid MD_GROUPS.ID%TYPE, p_newgroupid MD_GROUPS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR curs IS SELECT * FROM MD_GROUP_MEMBERS WHERE GROUP_ID_FK = p_oldgroupid;
  v_newid MD_GROUP_MEMBERS.ID%TYPE := NULL;
  v_originalid MD_GROUP_MEMBERS.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
BEGIN
  FOR v_row IN curs LOOP
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.GROUP_ID_FK := p_newgroupid;
    v_row.USER_ID_FK := find_object_copy(v_row.USER_ID_FK, C_OBJECTTYPE_USERS, p_newconnectionid);
    INSERT INTO MD_GROUP_MEMBERS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
	-- Group members do not have identifiers, so don't need a namespace
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK)
      VALUES(v_originalid,   C_OBJECTTYPE_GROUP_MEMBERS,   v_newid,   C_OBJECTTYPE_GROUP_MEMBERS, p_newconnectionid);
  END LOOP;
  return v_count;
END copy_group_members;

FUNCTION copy_all_groups_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_GROUPS WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_GROUPS.ID%TYPE := NULL;
  v_originalid MD_GROUPS.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_namespace MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE := NULL;
  v_row MD_GROUPS%ROWTYPE;
  v_catalogname MD_CATALOGS.CATALOG_NAME%TYPE;
  v_catalogdummy MD_CATALOGS.DUMMY_FLAG%TYPE;
  v_oldname MD_GROUPS.GROUP_NAME%TYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_GROUPS, 'GROUP_NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    SELECT CATALOG_NAME, DUMMY_FLAG INTO v_catalogname, v_catalogdummy
      FROM MD_CATALOGS, MD_SCHEMAS WHERE MD_CATALOGS.ID = MD_SCHEMAS.CATALOG_ID_FK 
      AND MD_SCHEMAS.ID = p_oldschemaid;
    v_oldname := v_row.GROUP_NAME;
    if v_catalogdummy <> C_DUMMYFLAG_TRUE then
      v_row.GROUP_NAME := v_row.GROUP_NAME || '_' || v_catalogname;
    END IF;
    INSERT INTO MD_GROUPS values v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
	IF v_row.GROUP_FLAG = C_ROLE_FLAG THEN
		v_namespace := C_NS_USER_ROLES;
	ELSE
		v_namespace := C_NS_DATABASE;
	END IF;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid, C_OBJECTTYPE_GROUPS, v_newid, C_OBJECTTYPE_GROUPS, p_newconnectionid, v_oldname, v_row.GROUP_NAME, v_namespace);
    v_ret := copy_group_members(v_originalid, v_newid, p_newconnectionid);   
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_groups_cascade;

FUNCTION copy_all_users_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_USERS WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_USERS.ID%TYPE := NULL;
  v_originalid MD_USERS.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_USERS%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_USERS, 'USERNAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_USERS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid,   C_OBJECTTYPE_USERS,   v_newid,   C_OBJECTTYPE_USERS, p_newconnectionid, v_row.USERNAME, v_row.USERNAME, C_NS_USERS);
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_users_cascade;

FUNCTION copy_all_other_objects_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_OTHER_OBJECTS WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_OTHER_OBJECTS.ID%TYPE := NULL;
  v_originalid MD_OTHER_OBJECTS.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_OTHER_OBJECTS%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_OTHER_OBJECTS, 'NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_OTHER_OBJECTS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid,   C_OBJECTTYPE_OTHER_OBJECTS,   v_newid,   C_OBJECTTYPE_OTHER_OBJECTS, p_newconnectionid, v_row.NAME, v_row.NAME, C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid));
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_other_objects_cascade;

FUNCTION copy_all_tablespaces_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_TABLESPACES WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_TABLESPACES.ID%TYPE := NULL;
  v_originalid MD_TABLESPACES.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_TABLESPACES%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_TABLESPACES, 'TABLESPACE_NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_TABLESPACES VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid,   C_OBJECTTYPE_TABLESPACES,   v_newid,   C_OBJECTTYPE_TABLESPACES, p_newconnectionid, v_row.TABLESPACE_NAME, v_row.TABLESPACE_NAME, C_NS_TABLESPACES);
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_tablespaces_cascade;

FUNCTION copy_all_udds_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_USER_DEFINED_DATA_TYPES WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_USER_DEFINED_DATA_TYPES.ID%TYPE := NULL;
  v_originalid MD_USER_DEFINED_DATA_TYPES.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_USER_DEFINED_DATA_TYPES%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_UDDT, 'DATA_TYPE_NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_USER_DEFINED_DATA_TYPES VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid,   C_OBJECTTYPE_UDDT,   v_newid,   C_OBJECTTYPE_UDDT, p_newconnectionid, v_row.DATA_TYPE_NAME, v_row.DATA_TYPE_NAME, C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid));
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_udds_cascade;

FUNCTION copy_child_procedures(p_oldpackageid MD_PACKAGES.ID%TYPE, p_newpackageid MD_PACKAGES.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_STORED_PROGRAMS WHERE PACKAGE_ID_FK = ' || p_oldpackageid;
  v_newid MD_STORED_PROGRAMS.ID%TYPE := NULL;
  v_originalid MD_STORED_PROGRAMS.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_STORED_PROGRAMS%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_STORED_PROGRAMS, 'NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.PACKAGE_ID_FK := p_newpackageid;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_STORED_PROGRAMS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
	-- No need for namespace here, the namespace is the package itself.
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER)
      VALUES(v_originalid,   C_OBJECTTYPE_STORED_PROGRAMS,   v_newid,   C_OBJECTTYPE_STORED_PROGRAMS, p_newconnectionid, v_row.NAME, v_row.NAME);
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_child_procedures;
  
FUNCTION copy_all_packages_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_PACKAGES WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_PACKAGES.ID%TYPE := NULL;
  v_originalid MD_PACKAGES.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_PACKAGES%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_PACKAGES, 'NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_PACKAGES VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid,   C_OBJECTTYPE_PACKAGES,   v_newid,   C_OBJECTTYPE_PACKAGES, p_newconnectionid, v_row.NAME, v_row.NAME, C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid));
    v_ret := copy_child_procedures(v_originalid, v_newid, p_newschemaid, p_newconnectionid, p_filter_set);
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_packages_cascade;

FUNCTION copy_all_unpackaged_sps(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_STORED_PROGRAMS WHERE SCHEMA_ID_FK = ' || p_oldschemaid ||' AND PACKAGE_ID_FK IS NULL';
  v_newid MD_STORED_PROGRAMS.ID%TYPE := NULL;
  v_originalid MD_STORED_PROGRAMS.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_STORED_PROGRAMS%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_STORED_PROGRAMS, 'NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.schema_id_fk := p_newschemaid;
    INSERT INTO MD_STORED_PROGRAMS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
	-- Non-packaged procedures belong in the schema objects namespace.
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid, C_OBJECTTYPE_STORED_PROGRAMS, v_newid, C_OBJECTTYPE_STORED_PROGRAMS, p_newconnectionid, v_row.NAME, v_row.NAME, C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid));
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_unpackaged_sps;

FUNCTION copy_all_synonyms_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_SYNONYMS WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_SYNONYMS.ID%TYPE := NULL;
  v_originalid MD_SYNONYMS.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_namespace MD_DERIVATIVES.DERIVED_OBJECT_NAMESPACE%TYPE;
  v_row MD_SYNONYMS%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_SYNONYMS, 'NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.SYNONYM_FOR_ID := find_object_copy(v_row.SYNONYM_FOR_ID, v_row.FOR_OBJECT_TYPE, p_newconnectionid);
    INSERT INTO MD_SYNONYMS VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
	-- Synonyms have two potential name spaces:  Private synonyms belong in the schema objects, while public 
	-- synonyms belong in their own namespace.
	IF v_row.PRIVATE_VISIBILITY = C_SYNONYM_PRIVATE THEN
		v_namespace := C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid);
	ELSE
		v_namespace := C_NS_PUBLIC_SYNONYMS;
        END IF;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid, C_OBJECTTYPE_SYNONYMS, v_newid, C_OBJECTTYPE_SYNONYMS, p_newconnectionid, v_row.NAME, v_row.NAME, v_namespace);
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_synonyms_cascade;

FUNCTION copy_all_sequences_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_SEQUENCES WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_SEQUENCES.ID%TYPE := NULL;
  v_originalid MD_SEQUENCES.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_SEQUENCES%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_SEQUENCES, 'NAME', 'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    INSERT INTO MD_SEQUENCES VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, derived_connection_id_fk, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid, C_OBJECTTYPE_SEQUENCES, v_newid, C_OBJECTTYPE_SEQUENCES, p_newconnectionid, v_row.NAME, v_row.NAME, C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid));
  END LOOP;
  CLOSE cv_curs;
  return v_count;
END copy_all_sequences_cascade;

FUNCTION copy_user_privileges(p_olduserid MD_PRIVILEGES.ID%TYPE, p_newuserid MD_PRIVILEGES.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR curs is SELECT * FROM MD_USER_PRIVILEGES WHERE PRIVILEGE_ID_FK = p_olduserid;
  v_newid MD_USER_PRIVILEGES.ID%TYPE;
  v_count NUMBER := 0;
  v_originalid MD_USER_PRIVILEGES.ID%TYPE;
  v_ret NUMBER;
BEGIN
  FOR v_row IN curs LOOP
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.USER_ID_FK := find_object_copy(v_row.USER_ID_FK , C_OBJECTTYPE_USERS, p_newconnectionid);
    v_row.PRIVILEGE_ID_FK := p_newuserid;
    INSERT INTO MD_USER_PRIVILEGES values v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK)
      VALUES(v_originalid, C_OBJECTTYPE_USER_PRIVILEGES, v_newid, C_OBJECTTYPE_USER_PRIVILEGES, p_newconnectionid);
  END LOOP;
  return v_count;
END copy_user_privileges;

FUNCTION copy_all_privileges_cascade(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_selectStmt VARCHAR2(4000) := 'SELECT * FROM MD_PRIVILEGES WHERE SCHEMA_ID_FK = ' || p_oldschemaid;
  v_newid MD_PRIVILEGES.ID%TYPE := NULL;
  v_originalid MD_PRIVILEGES.ID%TYPE := NULL;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_row MD_PRIVILEGES%ROWTYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_PRIVILEGES, 'PRIVILEGE_NAME' ,'ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs into v_row;
    EXIT WHEN cv_curs%NOTFOUND;
    v_originalid := v_row.ID;
    v_row.ID := NULL;
    v_row.PRIVELEGE_OBJECT_ID := find_object_copy(v_row.PRIVELEGE_OBJECT_ID , v_row.PRIVELEGEOBJECTTYPE, p_newconnectionid);
    v_row.SCHEMA_ID_FK := p_newschemaid;
    INSERT INTO MD_PRIVILEGES VALUES v_row RETURNING ID INTO v_newid;
    v_ret := copy_additional_properties(v_originalid, v_newid, p_newconnectionid);
    v_count := v_count + 1;
    -- No need to pass on the identifiers to the derivatives as no need to worry about the clashes for the same.
    INSERT INTO MD_DERIVATIVES(src_id, src_type, derived_id, derived_type, DERIVED_CONNECTION_ID_FK, DERIVED_OBJECT_NAMESPACE)
      VALUES(v_originalid,   C_OBJECTTYPE_PRIVILEGES,   v_newid,   C_OBJECTTYPE_PRIVILEGES, p_newconnectionid, C_NS_SCHEMA_OBJS || TO_CHAR(p_newschemaid));
    v_ret := copy_user_privileges(v_originalid, v_newid, p_newconnectionid);
  END LOOP;
  CLOSE cv_curs;
  RETURN v_count;
END copy_all_privileges_cascade;

FUNCTION copy_all_cross_schema_objects(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  v_ret NUMBER;
BEGIN
-- DD; Can't do this until all schema tables are done
-- There may be foreign keys between schema
  v_ret := copy_all_constraints_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_groups_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_other_objects_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_privileges_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  -- Do synonyms last: This way, we can be sure that the oject for which it is a synonym
  -- has already been copied.
  v_ret := copy_all_synonyms_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  return v_ret;
END copy_all_cross_schema_objects;

FUNCTION copy_all_schema_objects(p_oldschemaid MD_SCHEMAS.ID%TYPE, p_newschemaid MD_SCHEMAS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  v_ret NUMBER;
BEGIN
  v_ret := copy_all_tables_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_views_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_users_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_tablespaces_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_udds_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_packages_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_unpackaged_sps(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  v_ret := copy_all_sequences_cascade(p_oldschemaid, p_newschemaid, p_newconnectionid, p_filter_set);
  -- TODO: Roles are wrong in the model right now.  I need to fix these up.
  --v_ret := copy_all_roles_cascade(p_oldschemaid, p_newschemaid);
  return v_ret;  
END copy_all_schema_objects;

FUNCTION copy_catalogs_cascade(p_connectionid MD_CONNECTIONS.ID%TYPE, p_catalogid MD_CATALOGS.ID%TYPE, p_newconnectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET :=NULL) RETURN NUMBER
IS
  cv_curs REF_CURSOR;
  v_newid NUMBER;
  v_count NUMBER := 0;
  v_ret NUMBER;
  v_newName MD_SCHEMAS.NAME%TYPE;
  v_filt MIGR_FILTER;
  v_selectStmt VARCHAR2(4000) := 'SELECT a.id schema_id, A.name schema_name, b.id catalog_id, B.CATALOG_NAME, B.DUMMY_FLAG, A.type, A.character_set, A.version_tag 
      FROM MD_SCHEMAS A, MD_CATALOGS B
      WHERE 
      	A.CATALOG_ID_FK = B.ID
        AND
        A.catalog_id_fk in
        ( SELECT id from md_catalogs where CONNECTION_ID_FK = ' || p_connectionid || ')';
  v_schemaid MD_SCHEMAS.ID%TYPE;
  v_schemaname MD_SCHEMAS.NAME%TYPE;
  v_catalogid MD_CATALOGS.ID%TYPE;
  v_catalogname MD_CATALOGS.CATALOG_NAME%TYPE;
  v_catalogdummy MD_CATALOGS.DUMMY_FLAG%TYPE;
  v_schematype MD_SCHEMAS.TYPE%TYPE;
  v_schemacharset MD_SCHEMAS.CHARACTER_SET%TYPE;
  v_schemaversiontag MD_SCHEMAS.VERSION_TAG%TYPE;
BEGIN
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_CATALOGS, 'B.CATALOG_NAME', 'B.ID', v_selectStmt);
  -- NOTE: May need to apply a schema filter here too
  v_selectStmt := apply_filter(p_filter_set, C_OBJECTTYPE_SCHEMAS, 'A.NAME', 'A.ID', v_selectStmt);
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs INTO v_schemaid, v_schemaname, v_catalogid, v_catalogname, v_catalogdummy, v_schematype, v_schemacharset, v_schemaversiontag;
    EXIT WHEN cv_curs%NOTFOUND;
    -- TODO: Handle wrapping here.
    if v_catalogdummy <> C_DUMMYFLAG_TRUE then
      v_newName := v_schemaname|| '_' || v_catalogname;
	else
	  v_newName := v_schemaname;
	end if;
    INSERT INTO MD_SCHEMAS(CATALOG_ID_FK, NAME, TYPE, CHARACTER_SET, VERSION_TAG)
    VALUES (p_catalogid, v_newName, v_schematype, v_schemacharset, v_schemaversiontag)
    RETURNING ID INTO v_newid;
    -- Here's and interesting situation.  What will we do with the additional properties?
    -- I can coalesce them such that they are in the condensed catalog/schema pair
    -- But their order could (will) contain duplicates.....
    v_ret := copy_additional_properties(p_catalogid, v_newid, p_newconnectionid);
    v_ret := copy_additional_properties(v_schemaid, v_newid, p_newconnectionid);
	-- No Need for namespace stuff for catalogs.
    INSERT INTO MD_DERIVATIVES(SRC_ID, SRC_TYPE, DERIVED_ID, DERIVED_TYPE, DERIVED_CONNECTION_ID_FK,
      ORIGINAL_IDENTIFIER, NEW_IDENTIFIER)
    VALUES (v_schemaid, C_OBJECTTYPE_SCHEMAS, v_newid, C_OBJECTTYPE_SCHEMAS, p_newconnectionid, v_schemaname, v_newName);
    INSERT INTO MD_DERIVATIVES(SRC_ID, SRC_TYPE, DERIVED_ID, DERIVED_TYPE, DERIVED_CONNECTION_ID_FK, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER)
    VALUES (v_catalogid, C_OBJECTTYPE_CATALOGS, v_newid, C_OBJECTTYPE_SCHEMAS, p_newconnectionid, v_catalogname, v_newName);
    -- TODO: ADD THE FILTER TO THE PARAMETERS BELOW
    v_ret := copy_all_schema_objects(v_schemaid, v_newid, p_newconnectionid, p_filter_set);
    v_count := v_count + 1;
  END LOOP;
  CLOSE cv_curs;
  -- Now...Once all of the schema objects have been done, we have to copy all of those objects that could cross
  -- schema boundaries.  So we need to loop through them again
 v_selectStmt := 'SELECT SRC_ID, DERIVED_ID FROM MD_DERIVATIVES WHERE SRC_TYPE = ' 
  					|| '''' || C_OBJECTTYPE_SCHEMAS || ''' AND DERIVED_TYPE = ''' || C_OBJECTTYPE_SCHEMAS ||''''
  					|| ' AND DERIVED_CONNECTION_ID_FK = ' || p_newconnectionid;
  OPEN cv_curs FOR v_selectStmt;
  LOOP
    FETCH cv_curs into v_schemaid, v_newid;
    EXIT when cv_curs%NOTFOUND;
    v_ret := copy_all_cross_schema_objects(v_schemaid, v_newid, p_newconnectionid, p_filter_set);
  END LOOP;
  CLOSE cv_curs;  					
  return v_count;
END copy_catalogs_cascade;

FUNCTION remove_duplicate_indexes(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR v_curs IS select  index_id_fk, sum(md_index_details.column_id_fk * md_index_details.detail_order) simplehash from md_index_details 
    where index_id_fk in (select id from md_indexes where table_id_fk in (select table_id from mgv_all_tables where connection_id = p_connectionid)) 
    group by index_id_fk
    order by simplehash, index_id_fk;
  v_lasthash NUMBER :=0;
  v_currenthash NUMBER :=0;
  v_currentid MD_INDEX_DETAILS.INDEX_ID_FK%TYPE;
  v_lastid MD_INDEX_DETAILS.INDEX_ID_FK%TYPE;
  v_count NUMBER := 0;
  v_sql VARCHAR(255);
BEGIN
  OPEN v_curs;
  LOOP
    FETCH v_curs into v_currentid, v_currenthash;
    EXIT WHEN v_curs%NOTFOUND;
    if v_currenthash = v_lasthash THEN
      -- dbms_output.put_line('Index ' || TO_CHAR(v_currentid) || ' is a duplicate');
      v_sql := 'DELETE FROM MD_INDEXES WHERE ID = ' || v_currentid;
      EXECUTE IMMEDIATE v_sql;
      --dbms_output.put_line('DELETE FROM MD_INDEXES WHERE ID = ' || v_currentid);
      v_sql := 'UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = ''DUPIND'', DERIVED_ID = ' || TO_CHAR(v_lastid)  || ' WHERE DERIVED_ID = ' || TO_CHAR(v_currentid);
      EXECUTE IMMEDIATE v_sql;
      -- dbms_output.put_line('UPDATE MD_DERIVATIVES SET DERIVED_ID = ' || TO_CHAR(v_lastid)  || ' WHERE DERIVED_ID = ' || TO_CHAR(v_currentid));
      v_count := v_count + 1;
    else
      v_lasthash := v_currenthash;
      v_lastid := v_currentid;
    end if;
  END LOOP;
  CLOSE v_curs;
  return v_count;    
END remove_duplicate_indexes;

FUNCTION remove_indexes_used_elsewhere(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR v_curs IS
    select INDEX_ID_FK from 
      (select  index_id_fk, sum(md_index_details.column_id_fk * md_index_details.detail_order) simplehash from md_index_details 
       where index_id_fk in (select id from md_indexes where table_id_fk in (select table_id from mgv_all_tables where connection_id = p_connectionid)) 
       group by index_id_fk
       order by simplehash) a
    WHERE A.SIMPLEHASH 
    IN
    (
      SELECT b.simplehash FROM 
      (
        SELECT SUM(MD_CONSTRAINT_DETAILS.COLUMN_ID_FK * MD_CONSTRAINT_DETAILS.DETAIL_ORDER) simplehash from md_constraint_details
        where constraint_id_fk in (select id from md_constraints where table_id_fk in (select table_id from mgv_all_tables where connection_id = p_connectionid))
        group by constraint_id_fk
        order by simplehash
      ) b
     );
  v_currentId MD_INDEX_DETAILS.INDEX_ID_FK%TYPE;     
  v_sql VARCHAR2(255);
  v_count NUMBER := 0;
BEGIN
  OPEN v_curs;
  LOOP
    FETCH v_curs into v_currentid;
    EXIT WHEN v_curs%NOTFOUND;
      v_sql := 'DELETE FROM MD_INDEXES WHERE ID = ' || v_currentid;
      EXECUTE IMMEDIATE v_sql;
      --dbms_output.put_line('DELETE FROM MD_INDEXES WHERE ID = ' || v_currentid);
      v_sql := 'DELETE FROM MD_DERIVATIVES WHERE DERIVED_ID = ' || TO_CHAR(v_currentid);
      EXECUTE IMMEDIATE v_sql;
      -- dbms_output.put_line('UPDATE MD_DERIVATIVES SET DERIVED_ID = ' || TO_CHAR(v_lastid)  || ' WHERE DERIVED_ID = ' || TO_CHAR(v_currentid));
      v_count := v_count + 1;
  END LOOP;
  CLOSE v_curs;
  RETURN v_count;
END remove_indexes_used_elsewhere;    

PROCEDURE cut_lob_indexes_to_25(p_connectionId MD_CONNECTIONS.ID%TYPE)
IS
  CURSOR v_curs (context MD_ADDITIONAL_PROPERTIES.VALUE%TYPE, ctxcat MD_ADDITIONAL_PROPERTIES.VALUE%TYPE) is 
    SELECT * FROM MD_INDEXES WHERE 
    TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid)
    AND LENGTH(INDEX_NAME) > 25 AND  
    ( EXISTS (SELECT 1 FROM MD_ADDITIONAL_PROPERTIES WHERE ( VALUE = context 
    OR VALUE = ctxcat ) AND REF_ID_FK = MD_INDEXES.ID ) )
    FOR UPDATE OF INDEX_NAME;
  v_numIndexCount INTEGER := 1;
  v_newName MD_INDEXES.INDEX_NAME%TYPE;
  v_row MD_INDEXES%ROWTYPE;
BEGIN
-- totierne: for each lob index cut to 23 or 22 or 21 to put _XXX up to 25 chars (should be bytes)
  OPEN v_curs (C_INDEXTYPE_CONTEXT, C_INDEXTYPE_CTXCAT);
  LOOP
    FETCH v_curs INTO v_row;
    EXIT WHEN v_curs%NOTFOUND;
    v_newName := MIGRATION_TRANSFORMER.add_suffix(v_row.INDEX_NAME, '_' || TO_CHAR(v_numIndexCount), 25);
    update MD_INDEXES SET index_name = v_newName where current of v_curs;
    v_numIndexCount := v_numIndexCount + 1;
  END LOOP;
  CLOSE v_curs;
  commit;
END cut_lob_indexes_to_25;

FUNCTION fixupTextIndexes(p_connectionId MD_CONNECTIONS.ID%TYPE) return NUMBER
IS
  CURSOR v_curs is
    select index_id_fk, count(*) numcols from md_index_details where
    index_id_fk in (
      select c.id
      from md_columns a, md_index_details b, md_indexes c
      where b.column_id_fk = a.id
      and column_type in ('BLOB', 'CLOB')
      and b.index_id_fk = c.id
      and c.table_id_fk in (select table_id from mgv_all_tables where connection_id = p_connectionid)
    ) group by index_id_fk;
  v_indexId MD_INDEXES.ID%TYPE;
  v_numCols INTEGER;
  v_extendedIndexType MD_ADDITIONAL_PROPERTIES.VALUE%TYPE;
BEGIN        
  OPEN v_curs;
  LOOP
    FETCH v_curs into v_indexId, v_numCols;
    EXIT WHEN v_curs%NOTFOUND;
    IF v_numCols = 1 THEN
      v_extendedIndexType := C_INDEXTYPE_CONTEXT;
    ELSE
      v_extendedIndexType := C_INDEXTYPE_CTXCAT;
    END IF;
    INSERT INTO MD_ADDITIONAL_PROPERTIES(CONNECTION_ID_FK ,REF_ID_FK, REF_TYPE, PROP_KEY, VALUE)
    VALUES (p_connectionId, v_indexId, C_OBJECTTYPE_INDEXES, C_PROPKEY_EXTENDEDINDEXTYPE, v_extendedIndexType);
    COMMIT;
  END LOOP;
  -- NCLOBs cannot be indexed.  They aren't allowed in normal indexes, and they aren't allowed in TEXT 
  -- indexes.   The only thing to do here is to remove it.
  -- TODO: We can't just do this silently.
   -- Mark THE derivative RECORD AS DELETEd.
  UPDATE md_derivatives SET DERIVATIVE_REASON = 'NCLOBIND' WHERE DERIVED_TYPE = 'MD_INDEXES' AND DERIVED_CONNECTION_ID_FK = p_connectionid
      AND  DERIVED_ID IN 
             (SELECT C.ID   FROM MD_COLUMNS A, MD_INDEX_DETAILS B, MD_INDEXES C, MGV_ALL_TABLES D
                 WHERE B.COLUMN_ID_FK = A.ID AND COLUMN_TYPE ='NCLOB' AND B.INDEX_ID_FK = C.ID
                  AND C.TABLE_ID_FK = D.TABLE_ID AND D.CONNECTION_ID = p_connectionid);
  DELETE FROM MD_INDEXES WHERE ID IN
             (SELECT C.ID   FROM MD_COLUMNS A, MD_INDEX_DETAILS B, MD_INDEXES C, MGV_ALL_TABLES D
                 WHERE B.COLUMN_ID_FK = A.ID AND COLUMN_TYPE ='NCLOB' AND B.INDEX_ID_FK = C.ID
                  AND C.TABLE_ID_FK = D.TABLE_ID AND D.CONNECTION_ID = p_connectionid);
  -- cut blob/clob index string to 25 characters with _nn incrementing marker
  cut_lob_indexes_to_25(p_connectionId);
  return 0;
END fixupTextIndexes;

FUNCTION copy_connection_cascade(p_connectionid MD_CONNECTIONS.ID%TYPE, p_filter_set MIGR_FILTER_SET := NULL) RETURN NUMBER
IS
  v_newConnectionId MD_CONNECTIONS.ID%TYPE;
  v_numProps NUMBER;
  v_catalogId MD_CATALOGS.ID%TYPE;
  v_numCatalogs NUMBER;
  v_numDuplicateIndexes NUMBER;
BEGIN
  -- The connection doesn't use the filter, because it is called for a single connection.
  v_newConnectionId := copy_connection(p_connectionid);
  -- Don't forget its additional props
  v_numProps := copy_additional_properties(p_connectionid, v_newConnectionId, v_newConnectionId);
  -- OK - Next coalesce the schema/catalogs
  v_catalogId := create_dummy_catalog(v_newConnectionId);
  v_numCatalogs := copy_catalogs_cascade(p_connectionid, v_catalogid, v_newConnectionId, p_filter_set);
  v_numDuplicateIndexes := remove_duplicate_indexes(v_newConnectionId);
  v_numDuplicateIndexes := v_numDuplicateIndexes + remove_indexes_used_elsewhere(v_newConnectionId);
  return v_newConnectionId;
END copy_connection_cascade;

PROCEDURE update_derivative_record(p_orig VARCHAR2, p_new VARCHAR2, p_derivedid MD_DERIVATIVES.DERIVED_ID%TYPE,
p_derivedtype MD_DERIVATIVES.DERIVED_TYPE%TYPE, p_connectionid MD_DERIVATIVES.DERIVED_CONNECTION_ID_FK%TYPE)
IS	
BEGIN
    UPDATE MD_DERIVATIVES SET TRANSFORMED = C_TRANSFORMED_TRUE, ORIGINAL_IDENTIFIER = p_orig, NEW_IDENTIFIER = p_new
      WHERE DERIVED_ID = p_derivedid
      AND DERIVED_TYPE = p_derivedtype
      AND DERIVED_CONNECTION_ID_FK = p_connectionid;
END update_derivative_record;

/*
 * This procedure is like update_derivative_record except it should be used at name clash stage
 * basically, this will work the same as update_derivative_record except in those cases where
 * there is already a derivative record.  In this latter case, we want ORIGINAL_IDENTIFIER preserved
 * (this is called when there is a possiblity that we've carried out a second transformation
 */
PROCEDURE second_update_derivative(p_orig VARCHAR2, p_new VARCHAR2, p_derivedid MD_DERIVATIVES.DERIVED_ID%TYPE,
p_derivedtype MD_DERIVATIVES.DERIVED_TYPE%TYPE, p_connectionid MD_DERIVATIVES.DERIVED_CONNECTION_ID_FK%TYPE)
IS
  v_firstOriginal MD_DERIVATIVES.ORIGINAL_IDENTIFIER%TYPE;
BEGIN
  -- see if p_orig is already the new identifier
  select ORIGINAL_IDENTIFIER INTO v_firstOriginal FROM MD_DERIVATIVES
      WHERE DERIVED_ID = p_derivedid
      AND DERIVED_TYPE = p_derivedtype
      AND NEW_IDENTIFIER = p_orig
      AND DERIVED_CONNECTION_ID_FK = p_connectionid;
  if v_firstOriginal IS NULL then
    update_derivative_record(p_orig, p_new, p_derivedid, p_derivedtype, p_connectionid);
  else
    update_derivative_record(v_firstOriginal, p_new, p_derivedid, p_derivedtype, p_connectionid);
  end if;
EXCEPTION
  when NO_DATA_FOUND THEN
    update_derivative_record(p_orig, p_new, p_derivedid, p_derivedtype, p_connectionid);
  WHEN TOO_MANY_ROWS THEN
    dbms_output.put_line(TO_CHAR(p_derivedid) || ' ' || TO_CHAR(p_derivedtype) || ' '|| TO_CHAR(p_connectionid));
  
END second_update_derivative;

FUNCTION transform_column_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
    SELECT * FROM MD_COLUMNS
    WHERE TABLE_ID_FK IN
    (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = connid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(COLUMN_NAME) != COLUMN_NAME 
    FOR UPDATE OF COLUMN_NAME;
  v_rec MD_COLUMNS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_rec.COLUMN_NAME);
    UPDATE MD_COLUMNS SET COLUMN_NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.COLUMN_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_COLUMNS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_COLUMNS, v_count);
  --return v_count;
END transform_column_identifiers;

FUNCTION transform_constraint_idents(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_CONSTRAINTS
  WHERE TABLE_ID_FK IN
    (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = connid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(NAME) != NAME
    FOR UPDATE OF NAME;
  v_rec MD_CONSTRAINTS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_rec.NAME);
    UPDATE MD_CONSTRAINTS SET NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.NAME, v_newName, v_rec.ID, C_OBJECTTYPE_CONSTRAINTS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_CONSTRAINTS, v_count);
END transform_constraint_idents;

FUNCTION transform_group_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_GROUPS WHERE
   SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(GROUP_NAME) != GROUP_NAME
    FOR UPDATE OF GROUP_NAME;
  v_rec MD_GROUPS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_rec.GROUP_NAME);
    UPDATE MD_GROUPS SET GROUP_NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.GROUP_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_GROUPS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_GROUPS, v_count);
END transform_group_identifiers;

FUNCTION transform_index_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_INDEXES WHERE TABLE_ID_FK IN
    (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||INDEX_NAME) != INDEX_NAME
    FOR UPDATE OF INDEX_NAME;
  v_rec MD_INDEXES%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.INDEX_NAME);
    UPDATE MD_INDEXES SET INDEX_NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.INDEX_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_INDEXES, p_connectionid);
  END LOOP;
  commit;
  CLOSE v_curs;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_INDEXES, v_count);
END transform_index_identifiers;

FUNCTION transform_othobj_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_OTHER_OBJECTS  WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||NAME) != NAME
    FOR UPDATE OF NAME;
  v_rec MD_OTHER_OBJECTS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.NAME);
    UPDATE MD_OTHER_OBJECTS SET NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.NAME, v_newName, v_rec.ID, C_OBJECTTYPE_OTHER_OBJECTS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_OTHER_OBJECTS, v_count);
END transform_othobj_identifiers;

FUNCTION transform_package_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_PACKAGES  WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||NAME) != NAME
    FOR UPDATE OF NAME;
  v_rec MD_PACKAGES%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.NAME);
    UPDATE MD_PACKAGES SET NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.NAME, v_newName, v_rec.ID, C_OBJECTTYPE_PACKAGES, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_PACKAGES, v_count);
END transform_package_identifiers;

FUNCTION transform_schema_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_SCHEMAS WHERE ID IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(NAME) != NAME
    FOR UPDATE OF NAME;
  v_rec MD_SCHEMAS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName:= MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_rec.NAME);
    UPDATE MD_SCHEMAS SET NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.NAME, v_newName, v_rec.ID, C_OBJECTTYPE_SCHEMAS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_SCHEMAS, v_count);
END transform_schema_identifiers;

FUNCTION transform_sequence_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_SEQUENCES WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||NAME) != NAME
    FOR UPDATE OF NAME;
  v_rec MD_SEQUENCES%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.NAME);
    UPDATE MD_SEQUENCES SET NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.NAME, v_newName, v_rec.ID, C_OBJECTTYPE_SEQUENCES, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_SEQUENCES, v_count);
END transform_sequence_identifiers;

FUNCTION transform_sproc_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_STORED_PROGRAMS WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||NAME) != NAME
    FOR UPDATE OF NAME;
  v_rec MD_STORED_PROGRAMS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.NAME);
    UPDATE MD_STORED_PROGRAMS SET NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.NAME, v_newName, v_rec.ID, C_OBJECTTYPE_STORED_PROGRAMS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_STORED_PROGRAMS, v_count);
END transform_sproc_identifiers;

FUNCTION transform_synonym_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_SYNONYMS WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||NAME) != NAME
    FOR UPDATE OF NAME;
  v_rec MD_SYNONYMS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.NAME);
    UPDATE MD_SYNONYMS SET NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.NAME, v_newName, v_rec.ID, C_OBJECTTYPE_SYNONYMS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_SYNONYMS, v_count);
END transform_synonym_identifiers;

FUNCTION transform_table_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_TABLES WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||TABLE_NAME) != TABLE_NAME
    FOR UPDATE OF TABLE_NAME;
  v_rec MD_TABLES%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.TABLE_NAME);
    UPDATE MD_TABLES SET TABLE_NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.TABLE_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_TABLES, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_TABLES, v_count);
END transform_table_identifiers;

FUNCTION transform_view_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_VIEWS WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||VIEW_NAME) != VIEW_NAME
    FOR UPDATE OF VIEW_NAME;
  v_rec MD_VIEWS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.VIEW_NAME);
    UPDATE MD_VIEWS SET VIEW_NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.VIEW_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_VIEWS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_VIEWS, v_count);
END transform_view_identifiers;

FUNCTION transform_tablespace_idents(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_TABLESPACES WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(TABLESPACE_NAME) != TABLESPACE_NAME
    FOR UPDATE OF TABLESPACE_NAME;
  v_rec MD_TABLESPACES%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_rec.TABLESPACE_NAME);
    UPDATE MD_TABLESPACES SET TABLESPACE_NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.TABLESPACE_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_TABLESPACES, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_TABLESPACES, v_count);
END transform_tablespace_idents;

FUNCTION transform_trigger_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs IS 
  SELECT * FROM MD_TRIGGERS  WHERE TABLE_OR_VIEW_ID_FK IN
    (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||TRIGGER_NAME) != TRIGGER_NAME
    FOR UPDATE OF TRIGGER_NAME;
  CURSOR v_view_trigger_curs IS 
    SELECT * FROM MD_TRIGGERS  WHERE TABLE_OR_VIEW_ID_FK IN
    (SELECT VIEW_ID FROM MGV_ALL_VIEWS WHERE CONNECTION_ID =  p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||TRIGGER_NAME) != TRIGGER_NAME
    FOR UPDATE OF TRIGGER_NAME;
  v_rec MD_TRIGGERS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs;
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.TRIGGER_NAME);
    UPDATE MD_TRIGGERS SET TRIGGER_NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.TRIGGER_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_TRIGGERS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  OPEN v_view_trigger_curs;
  LOOP
    FETCH v_view_trigger_curs INTO v_rec;
    EXIT WHEN v_view_trigger_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.TRIGGER_NAME);
    UPDATE MD_TRIGGERS SET TRIGGER_NAME = v_newName WHERE CURRENT OF v_view_trigger_curs;
    update_derivative_record(v_rec.TRIGGER_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_TRIGGERS, p_connectionid);
  END LOOP;
  CLOSE v_view_trigger_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_TRIGGERS, v_count);
END transform_trigger_identifiers;

FUNCTION transform_uddt_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_USER_DEFINED_DATA_TYPES WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||DATA_TYPE_NAME) != DATA_TYPE_NAME
    FOR UPDATE OF DATA_TYPE_NAME;
  v_rec MD_USER_DEFINED_DATA_TYPES%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_prefixName||v_rec.DATA_TYPE_NAME);
    UPDATE MD_USER_DEFINED_DATA_TYPES SET DATA_TYPE_NAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.DATA_TYPE_NAME, v_newName, v_rec.ID, C_OBJECTTYPE_UDDT, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_UDDT, v_count);
END transform_uddt_identifiers;

FUNCTION transform_user_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_T
IS
  CURSOR v_curs(connid MD_CONNECTIONS.ID%TYPE) IS 
  SELECT * FROM MD_USERS WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(USERNAME) != USERNAME
    FOR UPDATE OF USERNAME;
  v_rec MD_USERS%ROWTYPE;
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_T;
  v_newName MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
BEGIN
  OPEN v_curs(p_connectionid);
  LOOP
    FETCH v_curs INTO v_rec;
    EXIT WHEN v_curs%NOTFOUND;
    v_count := v_count + 1;
    v_newName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_rec.USERNAME);
    UPDATE MD_USERS SET USERNAME = v_newName WHERE CURRENT OF v_curs;
    update_derivative_record(v_rec.USERNAME, v_newName, v_rec.ID, C_OBJECTTYPE_USERS, p_connectionid);
  END LOOP;
  CLOSE v_curs;
  commit;
  return NAME_AND_COUNT_T(C_OBJECTTYPE_USERS, v_count);
END transform_user_identifiers;

PROCEDURE rename_duplicate_index_names(p_connectionid MD_CONNECTIONS.ID%TYPE)
IS
  CURSOR v_curs is 
    SELECT * FROM MD_INDEXES WHERE 
    TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid)
    AND UPPER(INDEX_NAME) IN 
    ( SELECT ui FROM 
      (SELECT B.SCHEMA_ID, UPPER(INDEX_NAME) ui, COUNT(*) from md_indexes a, mgv_all_tables b where 
       a.table_id_fk = b.table_id 
       and b.connection_id = p_connectionid
       GROUP BY SCHEMA_ID, UPPER(INDEX_NAME)
       having COUNT(*) > 1
      )
    )
    ORDER BY Upper(INDEX_NAME)
    FOR UPDATE OF INDEX_NAME;
  v_row MD_INDEXES%ROWTYPE;
  v_newName MD_INDEXES.INDEX_NAME%TYPE;
  v_id MD_INDEXES.ID%TYPE;
  v_curName MD_INDEXES.INDEX_NAME%TYPE;
  v_count NUMBER := 1;
BEGIN
  v_curName := 'dsa;lkjsd;alskj;';
  OPEN v_curs;
  LOOP
    FETCH v_curs INTO v_row;
    EXIT WHEN v_curs%NOTFOUND;
    IF UPPER(v_row.INDEX_NAME) = UPPER(v_curName) THEN
      v_newName := MIGRATION_TRANSFORMER.ADD_SUFFIX(v_row.INDEX_NAME, '_' || TO_CHAR(v_count), 30);
      v_count := v_count + 1;
      update MD_INDEXES SET index_name = v_newName where current of v_curs;
      second_update_derivative(v_row.index_name, v_newName, v_row.ID, C_OBJECTTYPE_INDEXES, p_connectionid);
    else
      v_curName := v_row.INDEX_NAME;
      v_count := 1;
    END IF;
  END LOOP;
  commit;
END rename_duplicate_index_names;

PROCEDURE fixup_duplicate_identifier(p_connectionid MD_CONNECTIONS.ID%TYPE, 
                                      p_mdrec_id MD_DERIVATIVES.ID%TYPE,
                                      p_derived_type MD_DERIVATIVES.DERIVED_TYPE%TYPE,
                                      p_derived_id MD_DERIVATIVES.DERIVED_ID%TYPE,
                                      p_new_identifier MD_DERIVATIVES.NEW_IDENTIFIER%TYPE,
                                      p_suffix INTEGER)
IS
	v_transform_identifier MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
	v_did_a_transform CHAR(1) := 'Y';
	--v_underscoresuffixsize NUMBER;
	--v_underscoresuffix VARCHAR2(100);
  --v_sizebeforeprefix NUMBER;
BEGIN
  --v_underscoresuffix := '_' || TO_CHAR(p_suffix);
  --v_underscoresuffixsize := LENGTH(v_underscoresuffix);
  --v_sizebeforeprefix := 30 - v_underscoresuffixsize;
  v_transform_identifier := MIGRATION_TRANSFORMER.ADD_SUFFIX(p_new_identifier, '_' || TO_CHAR(p_suffix) ,30);
 CASE p_derived_type
	WHEN C_OBJECTTYPE_CONNECTIONS THEN
		UPDATE MD_CONNECTIONS SET NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_CATALOGS THEN
		UPDATE MD_CATALOGS SET CATALOG_NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_SCHEMAS THEN
		UPDATE MD_SCHEMAS SET NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_TABLES THEN
		UPDATE MD_TABLES SET TABLE_NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_CONSTRAINTS THEN
		UPDATE MD_CONSTRAINTS SET NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_INDEXES THEN
		UPDATE MD_INDEXES SET INDEX_NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_TRIGGERS THEN
		UPDATE MD_TRIGGERS SET TRIGGER_NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_VIEWS THEN
		UPDATE MD_VIEWS SET VIEW_NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_USERS THEN
		UPDATE MD_USERS SET USERNAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_GROUPS THEN
		UPDATE MD_GROUPS SET GROUP_NAME  = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_OTHER_OBJECTS THEN
		UPDATE MD_OTHER_OBJECTS SET NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_TABLESPACES THEN
		UPDATE MD_TABLESPACES SET TABLESPACE_NAME  = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_UDDT THEN
		UPDATE MD_USER_DEFINED_DATA_TYPES SET DATA_TYPE_NAME  = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_STORED_PROGRAMS THEN
		UPDATE MD_STORED_PROGRAMS SET NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_PACKAGES THEN
		UPDATE MD_PACKAGES SET NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_SYNONYMS THEN
		UPDATE MD_SYNONYMS SET NAME = v_transform_identifier WHERE ID = p_derived_id;
	WHEN C_OBJECTTYPE_SEQUENCES THEN
		UPDATE MD_SEQUENCES SET NAME = v_transform_identifier WHERE ID = p_derived_id;
	ELSE
		-- Handle column namespace here.
		IF SUBSTR(P_DERIVED_TYPE,1, LENGTH(C_OBJECTTYPE_COLUMNS)) = C_OBJECTTYPE_COLUMNS THEN
			UPDATE MD_COLUMNS SET COLUMN_NAME = v_transform_identifier WHERE ID = p_derived_id;
		ELSE
			v_did_a_transform := 'N';
		END IF;
	END CASE;
	IF v_did_a_transform = 'Y' THEN
	  UPDATE MD_DERIVATIVES SET NEW_IDENTIFIER = v_transform_identifier WHERE ID = p_mdrec_id;
	  commit;
    END IF;
    commit;
END fixup_duplicate_identifier;

FUNCTION getClashCount(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN INTEGER 
IS
  v_clashCount INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_clashCount FROM md_derivatives a
    where rowid > (
      select min(rowid) from md_derivatives b
      where
        b.derived_connection_id_fk = p_connectionid
        AND b.derived_connection_id_fk = a.derived_connection_id_fk
        AND UPPER(b.new_identifier) = UPPER(a.new_identifier)--  Uppercasing the name so that case sensitve names are caught (see bug 6922052)
        AND b.derived_object_namespace = a.derived_object_namespace);
  RETURN v_clashCount;
END getClashCount;

PROCEDURE transform_clashes(p_connectionid MD_CONNECTIONS.ID%TYPE)
IS
  CURSOR v_curs IS
    select id,derived_type, derived_id, UPPER(new_identifier) --  Uppercasing the name so that case sensitve names are caught (see bug 6922052)
    from md_derivatives a
    where rowid > (
      select min(rowid) from md_derivatives b
      where
        b.derived_connection_id_fk = p_connectionid
        AND b.derived_connection_id_fk = a.derived_connection_id_fk
        AND UPPER(b.new_identifier) = UPPER(a.new_identifier) --  Uppercasing the name so that case sensitve names are caught (see bug 6922052)
        AND b.derived_object_namespace = a.derived_object_namespace)
        ORDER BY new_identifier, derived_type;
  v_derived_type MD_DERIVATIVES.DERIVED_TYPE%TYPE;
  v_curr_type v_derived_type%TYPE := '~~dasdddfl;';
  v_derived_id MD_DERIVATIVES.DERIVED_ID%TYPE;
  v_new_identifier MD_DERIVATIVES.NEW_IDENTIFIER%TYPE;
  v_curr_identifier v_new_identifier%TYPE := '~~~~asdasnc';
  v_suffix INTEGER := 0;
  v_innerSuffix INTEGER;
  v_clashCount INTEGER;
  v_mdrec_id MD_DERIVATIVES.ID%TYPE;
BEGIN
  rename_duplicate_index_names(p_connectionid);
  v_clashCount := getClashCount(p_connectionid);
  WHILE v_clashCount > 0 
  LOOP
	v_suffix := v_suffix + 1;
	v_innerSuffix := v_suffix; 
    -- Now lets see if there are any identifier clashes
    OPEN v_curs;
    LOOP 
      FETCH v_curs into v_mdrec_id, v_derived_type, v_derived_id, v_new_identifier;
      EXIT WHEN v_curs%NOTFOUND;
 	  IF v_derived_type = v_curr_type AND v_new_identifier = v_curr_identifier THEN
		  v_innerSuffix := v_innerSuffix + 1;
	  else
		  v_curr_type := v_derived_type;
		  v_curr_identifier := v_new_identifier;
	  END IF;
      -- We have to fix up all of these identifiers
      fixup_duplicate_identifier(p_connectionid, v_mdrec_id, v_derived_type, v_derived_id, v_new_identifier, v_innerSuffix);
    END LOOP;
	CLOSE v_curs;
    v_clashCount := getClashCount(p_connectionid);
  END LOOP;
END transform_clashes;

FUNCTION transform_all_identifiers_x(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NAME_AND_COUNT_ARRAY
IS
  v_count INTEGER := 0;
  v_ret NAME_AND_COUNT_ARRAY;
  v_rec NAME_AND_COUNT_T;
BEGIN
  v_ret := NAME_AND_COUNT_ARRAY();
  -- We need to update identifiers on pretty much the whole schema
  -- MD_COLUMNS
  v_rec := transform_column_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  
  -- MD_CONSTRAINTS
  v_rec := transform_constraint_idents(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_GROUPS
  v_rec := transform_group_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_INDEXES
  v_rec := transform_index_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_OTHER_OBJECTS
  v_rec := transform_othobj_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_PACKAGES
  v_rec := transform_package_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_SCHEMAS
  v_rec := transform_schema_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_SEQUENCES
  v_rec := transform_sequence_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_STORED_PROGRAMS
  v_rec := transform_sproc_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_SYNONYMS
  v_rec := transform_synonym_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_TABLES
  v_rec := transform_table_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_TABLESPACES
  v_rec := transform_tablespace_idents(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_TRIGGERS
  v_rec := transform_trigger_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_USER_DEFINED_DATA_TYPES
  v_rec := transform_uddt_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  -- MD_USERS
  v_rec := transform_user_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  /*
  UPDATE MD_USERS SET USERNAME = MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(USERNAME) WHERE SCHEMA_ID_FK IN
    (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionid)
    AND MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(USERNAME) != USERNAME;
  dbms_output.put_line(SQL%ROWCOUNT || ' USER names updated');
  */
  -- MD_VIEWS
  v_rec := transform_view_identifiers(p_connectionid);
  v_ret.EXTEND;
  v_ret(v_ret.count) := v_rec;
  dbms_output.put_line(v_rec.UPDATE_COUNT || v_rec.OBJECT_NAME || ' names udpates');
  transform_clashes(p_connectionid);
  -- TODO: Something meaningful if all goes wrong
  return v_ret;
  COMMIT;
END transform_all_identifiers_x;

FUNCTION transform_all_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE, p_prefixName VARCHAR2) RETURN NAME_AND_COUNT_ARRAY
IS
BEGIN
v_prefixName := p_prefixName;
RETURN  transform_all_identifiers_x(p_connectionid);
END transform_all_identifiers;

FUNCTION rule_specificity(p_precision MIGR_DATATYPE_TRANSFORM_RULE.SOURCE_PRECISION%TYPE, p_scale MIGR_DATATYPE_TRANSFORM_RULE.SOURCE_SCALE%TYPE) RETURN INTEGER
IS
BEGIN
  IF p_precision is NULL then 
    return 1;
  END IF;
  IF p_scale is NULL then
    return 2;
  END IF;
  return 3;
END rule_specificity;

FUNCTION addToWhereClause(p_whereclause VARCHAR2, p_toAdd VARCHAR2) return VARCHAR2
IS
BEGIN
  IF p_whereclause is NULL then
    return p_toAdd;
  else
    return p_whereclause || ' AND ' || p_toAdd;
  END IF;
END addToWhereClause;

FUNCTION precision_val(p_srcPrecision MD_COLUMNS.PRECISION%TYPE, p_newDataType VARCHAR2) RETURN VARCHAR2
IS
  v_newDataType VARCHAR2(255);
  v_ret VARCHAR2(255);
BEGIN
  v_newDataType := UPPER(to_char(p_newDataType));
  -- Assume that no precision should be present
  v_ret := 'NULL';
  -- No see what the new data type is and ensure that a precision is required
  IF v_newDataType = 'VARCHAR2' OR
     v_newDataType = 'NVARCHAR2' OR
     v_newDataType = 'NUMBER' OR
     v_newDataType = 'TIMESTAMP' OR
     v_newDataType = 'INTERVAL YEAR' OR
     v_newDataType = 'INTERVAL DAY' OR
     v_newDataType = 'UROWID' OR
     v_newDataType = 'CHAR' OR
     v_newDataType = 'RAW' OR
     v_newDataType = 'NCHAR' THEN
     v_ret := p_srcPrecision;
  END IF;
  return v_ret;
END precision_val;

FUNCTION scale_val(p_srcPrecision MD_COLUMNS.SCALE%TYPE, p_newDataType VARCHAR2) RETURN VARCHAR2
IS
  v_newDataType VARCHAR2(255);
  v_ret VARCHAR2(255);
BEGIN
  v_newDataType := UPPER(to_char(p_newDataType));
  v_ret := 'NULL';
  IF v_newDataType = 'NUMBER' THEN
    v_ret := p_srcPrecision;
  END IF;
  return v_ret;
END scale_val;


FUNCTION check_for_invalid_data_types(p_connectionid MD_CONNECTIONS.ID%TYPE, p_numbytesperchar INTEGER) RETURN NUMBER
IS
BEGIN
    -- First, for char(n) columns, drop back to varchar2 - this could go up to 4k.
    -- If its even greater than this, it will be caught later on and made into a CLOB.
    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
        AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'CHAR' AND PRECISION > 2000
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET COLUMN_TYPE = 'VARCHAR2' WHERE COLUMN_TYPE = 'CHAR' AND PRECISION > 2000
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    -- We'll do something similar for NCHARs
    IF p_numbytesperchar = 1 THEN
        UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
          AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'NCHAR' AND PRECISION > 2000 
            AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
        UPDATE MD_COLUMNS SET COLUMN_TYPE = 'NVARCHAR2' WHERE COLUMN_TYPE = 'NCHAR' AND PRECISION > 2000 
            AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    ELSE   
        -- 2 bytes per char - max is actually 1k          
        UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
          AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'NCHAR' AND PRECISION > 1000 
            AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
        UPDATE MD_COLUMNS SET COLUMN_TYPE = 'NVARCHAR2' WHERE COLUMN_TYPE = 'NCHAR' AND PRECISION > 1000 
            AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    END IF;            
    -- VARCHAR or VARCHAR2 can't go above 4000.  If they do, they need to fallback to a CLOB
    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'VARCHAR' AND PRECISION > 4000 
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET COLUMN_TYPE = 'CLOB', PRECISION = NULL, SCALE = NULL WHERE COLUMN_TYPE = 'VARCHAR' AND PRECISION > 4000 
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS  WHERE COLUMN_TYPE = 'VARCHAR2' AND PRECISION > 4000 
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET COLUMN_TYPE = 'CLOB', PRECISION = NULL, SCALE = NULL WHERE COLUMN_TYPE = 'VARCHAR2' AND PRECISION > 4000 
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    -- NUMBER has a max precision of 38, and scale must be between -84 and 127
    -- We can only narrow this.  

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'NUMBER' AND PRECISION > 38
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET PRECISION = 38 WHERE COLUMN_TYPE = 'NUMBER' AND PRECISION > 38
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'NUMBER' AND SCALE < -84
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET SCALE = -84 WHERE COLUMN_TYPE = 'NUMBER' AND SCALE < -84
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'NUMBER' AND SCALE > 127
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET SCALE = 127 WHERE COLUMN_TYPE = 'NUMBER' AND SCALE > 127
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    -- NVARCHAR has a max of 4000 bytes.  But its definition depends on the character set in use.
    IF  p_numbytesperchar = 1 THEN
        UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
          AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'NVARCHAR2' AND PRECISION > 4000 
            AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
        UPDATE MD_COLUMNS SET COLUMN_TYPE = 'NCLOB', PRECISION = NULL, SCALE = NULL WHERE COLUMN_TYPE = 'NVARCHAR2' AND PRECISION > 4000 
            AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    ELSE
        UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
          AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'NVARCHAR2' AND PRECISION > 2000 
            AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
        UPDATE MD_COLUMNS SET COLUMN_TYPE = 'NCLOB', PRECISION = NULL, SCALE = NULL WHERE COLUMN_TYPE = 'NVARCHAR2' AND PRECISION > 2000 
            AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    END IF;            
    -- TIMESTAMP has a max size of 9

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'TIMESTAMP' AND PRECISION > 9
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET PRECISION = 9 WHERE COLUMN_TYPE = 'TIMESTAMP' AND PRECISION > 9
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'INTERVAL YEAR' AND PRECISION > 9
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET PRECISION = 9 WHERE COLUMN_TYPE = 'INTERVAL YEAR' AND PRECISION > 9
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'INTERVAL DAY' AND PRECISION > 9
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET PRECISION = 9 WHERE COLUMN_TYPE = 'INTERVAL DAY' AND PRECISION > 9
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'INTERVAL DAY' AND SCALE > 9
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET SCALE = 9 WHERE COLUMN_TYPE = 'INTERVAL DAY' AND SCALE > 9
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'UROWID' AND PRECISION > 4000
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET PRECISION = 4000 WHERE COLUMN_TYPE = 'UROWID' AND PRECISION > 4000
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    -- Too large RAW?  Make it a CLOB        

    UPDATE MD_DERIVATIVES SET DERIVATIVE_REASON = 'INVDTTYPE' WHERE DERIVED_CONNECTION_ID_FK = p_connectionid
      AND DERIVED_TYPE = 'MD_COLUMNS' AND DERIVED_ID IN (SELECT ID FROM MD_COLUMNS WHERE COLUMN_TYPE = 'RAW' AND PRECISION > 2000
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid));
    UPDATE MD_COLUMNS SET COLUMN_TYPE = 'BLOB', PRECISION = NULL WHERE COLUMN_TYPE = 'RAW' AND PRECISION > 2000
        AND TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionid);
    commit;
    RETURN 0;        
END check_for_invalid_data_types;

FUNCTION transform_datatypes(p_connectionid MD_CONNECTIONS.ID%TYPE, p_mapid MIGR_DATATYPE_TRANSFORM_MAP.ID%TYPE, p_numbytesperchar INTEGER) RETURN NUMBER
IS
  v_projectid MD_PROJECTS.ID%TYPE;
  v_mapProjectid MD_PROJECTS.ID%TYPE;
  CURSOR v_curs(mapid MIGR_DATATYPE_TRANSFORM_MAP.ID%TYPE) IS
    SELECT * FROM MIGR_DATATYPE_TRANSFORM_RULE WHERE map_ID_fk = mapid
    ORDER BY     DECODE(source_precision,
            NULL, 0,
            1) +
    DECODE(source_scale,
            NULL, 0,
            1)  DESC;
  v_rule MIGR_DATATYPE_TRANSFORM_RULE%ROWTYPE;
  v_whereClause VARCHAR2(4000);
  v_updateClause VARCHAR2(4000);
  v_count NUMBER := 0;
  v_ret NUMBER;
BEGIN
  -- We should only work with our "own" maps.  I.e. The map should be part of this project.
  SELECT project_id_fk into v_projectid from MD_CONNECTIONS where id = p_connectionid;
  SELECT project_id_fk into v_mapProjectid from MIGR_DATATYPE_TRANSFORM_MAP where id = p_mapid;
  IF v_projectid != v_mapProjectid then 
    -- TODO.  Some nice RAISE_APPLICATION_ERROR stuff here.
    return 0;
  END IF;
  -- OK We can work with our map
  OPEN v_curs(p_mapid);
  LOOP
    fetch v_curs INTO v_rule;
    EXIT WHEN v_curs%NOTFOUND;
    v_whereClause := 'UPPER(COLUMN_TYPE) = ''' || UPPER(v_rule.SOURCE_DATA_TYPE_NAME) || '''';
    if v_rule.SOURCE_PRECISION is not NULL then
      v_whereClause := addToWhereClause(v_whereClause, 'PRECISION = ' || to_char(v_rule.source_precision));
      IF v_rule.SOURCE_SCALE is not NULL then
        v_whereClause := addToWhereClause(v_whereClause, 'SCALE = ' || to_char(v_rule.source_scale));
      end IF;
    END IF;
    v_whereClause := addToWhereClause(v_whereClause, 'table_id_fk in (SELECT table_id from MGV_ALL_TABLES WHERE connection_id = ' || to_char(p_connectionid) || ')');
    v_whereClause := addTowhereclause(v_whereClause, 'DATATYPE_TRANSFORMED_FLAG IS NULL');
    v_updateClause := 'UPDATE MD_COLUMNS SET COLUMN_TYPE = ''' || v_rule.TARGET_DATA_TYPE_NAME || ''', DATATYPE_TRANSFORMED_FLAG=''Y''';
    IF v_rule.TARGET_PRECISION is not NULL then
      v_updateClause := v_updateClause || ', PRECISION = ' || precision_val(v_rule.TARGET_PRECISION, v_rule.TARGET_DATA_TYPE_NAME);
      IF v_rule.TARGET_SCALE is not NULL then
        -- The rule says change it to a specific scale, but we may override this is the data type shouldn't have a scale
        v_updateClause := v_updateClause || ', SCALE = ' || scale_val(v_rule.TARGET_SCALE, v_rule.TARGET_DATA_TYPE_NAME);
      ELSE
        -- There was no mention on the rule to touch the scale, so we should leave it alone...
        -- ..unless of course the data type forbids having it.
        IF scale_val(1, v_rule.TARGET_DATA_TYPE_NAME) = 'NULL' THEN
          v_updateClause := v_updateClause || ', SCALE = NULL';
        END IF;
      END IF;
    ELSE
      -- There was no metion on the rul to touch the precision, so we should leave it alone...
      -- ..unless of course the data type forbids having it.
      IF precision_val(1, v_rule.TARGET_DATA_TYPE_NAME) = 'NULL' THEN
        v_updateClause := v_updateClause || ', PRECISION = NULL';
      END IF;
      IF scale_val(1, v_rule.TARGET_DATA_TYPE_NAME) = 'NULL' THEN
        v_updateClause := v_updateClause || ', SCALE = NULL';
      END IF;
    END IF;
    v_updateClause := v_updateClause || ' WHERE ' || v_whereClause;
    dbms_output.put_line(v_updateClause);
    EXECUTE IMMEDIATE v_updateClause;
    v_count := v_count + SQL%ROWCOUNT;
  END LOOP;
  COMMIT;
  -- OK.  Lets see if we've made any columns invalid.
  v_ret := check_for_invalid_data_types(p_connectionid, p_numbytesperchar);  
  -- Now that we know the data types of the index columns, we may have flag some of the indexes
  -- as text indexes.
  v_ret := fixupTextIndexes(p_connectionid);

  RETURN v_count;
END transform_datatypes;

FUNCTION GET_IDENTITY_TRIGGER(v_triggerName VARCHAR2 , v_tableName VARCHAR2  , 
v_ColumnName VARCHAR2  ,v_seqName VARCHAR2 ,v_emulationPkgNamePrefix VARCHAR2 ) RETURN VARCHAR2
AS
BEGIN
return 'CREATE OR REPLACE TRIGGER ' || v_triggerName || ' BEFORE INSERT OR UPDATE ON ' || v_tableName || CHR(10) ||
       'FOR EACH ROW' || CHR(10) ||
       'DECLARE ' || CHR(10)||
       'v_newVal NUMBER(12) := 0;' ||CHR(10) ||
	   'v_incval NUMBER(12) := 0;'||CHR(10) ||
       'BEGIN' || CHR(10) ||
       '  IF INSERTING AND :new.' || v_ColumnName || ' IS NULL THEN' || CHR(10) ||
       '    SELECT  ' || v_seqName || '.NEXTVAL INTO v_newVal FROM DUAL;' || CHR(10) ||
	   '    -- If this is the first time this table have been inserted into (sequence == 1)' || CHR(10) ||
	   '    IF v_newVal = 1 THEN ' || CHR(10) ||
	   '      --get the max indentity value from the table' || CHR(10) ||
	   '      SELECT max(' || v_ColumnName || ') INTO v_newVal FROM ' || v_tableName || ';'|| CHR(10) || 
	   '      v_newVal := v_newVal + 1;' || CHR(10) || 
	   '      --set the sequence to that value'|| CHR(10) || 
	   '      LOOP'|| CHR(10) || 
	   '           EXIT WHEN v_incval>=v_newVal;'|| CHR(10) || 
	   '           SELECT ' || v_seqName || '.nextval INTO v_incval FROM dual;'|| CHR(10) || 
       '      END LOOP;'|| CHR(10) || 
       '    END IF;'|| CHR(10) ||    
       '    -- save this to emulate @@identity'|| CHR(10) || 
       '   '||v_emulationPkgNamePrefix || 'identity := v_newVal; '|| CHR(10) || 
       '   -- assign the value from the sequence to emulate the identity column'|| CHR(10) || 
       '   :new.' || v_ColumnName || ' := v_newVal;'|| CHR(10) || 
       '  END IF;' || CHR(10) ||
       'END;' || CHR(10);
END GET_IDENTITY_TRIGGER;

FUNCTION transform_identity_columns(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR v_curs IS SELECT a.schema_id_fk, a.id tableid, a.TABLE_NAME, b.id, b.column_name
                   FROM md_tables a, md_columns b WHERE b.id IN
                     (SELECT ref_id_fk FROM md_additional_properties WHERE prop_key = C_PROPKEY_SEEDVALUE)
                   AND table_id_fk IN (SELECT table_id FROM mgv_all_tables WHERE connection_id = p_connectionid)
                   AND a.id = b.table_id_fk
                   AND b.id NOT IN (SELECT SRC_ID FROM MD_DERIVATIVES WHERE SRC_TYPE = C_OBJECTTYPE_COLUMNS AND DERIVED_TYPE = C_OBJECTTYPE_SEQUENCES AND 
                                    DERIVED_CONNECTION_ID_FK = p_connectionid);
  CURSOR v_projectNameCurs 
  IS
  SELECT project_name FROM mgv_all_connections WHERE connection_id = p_connectionid;
  
  	v_schemaId MD_SCHEMAS.ID%TYPE;
	v_tableId MD_TABLES.ID%TYPE;
        v_tableName MD_TABLES.TABLE_NAME%TYPE;
	v_columnId MD_COLUMNS.ID%TYPE;
	v_columnName MD_COLUMNS.COLUMN_NAME%TYPE;
	v_row MD_ADDITIONAL_PROPERTIES%ROWTYPE;
	v_seedValue NUMBER;
	-- Default the increment to 1 if it is not supplied.
	v_increment NUMBER := 1;
	v_lastVal NUMBER := NULL;
	v_retId MD_SEQUENCES.ID%TYPE;
	v_retSeqId MD_SEQUENCES.ID%TYPE;
	v_seqName MD_SEQUENCES.NAME%TYPE;
        v_trgName MD_TRIGGERS.TRIGGER_NAME%TYPE;
	v_triggerText VARCHAR2(4000);
        v_lob CLOB;
	v_transRet NAME_AND_COUNT_T;
	v_projectName VARCHAR2(1000);
	v_emulationPkgNamePrefix VARCHAR2(100) := '';
BEGIN
  -- Auxillary, get the emulation package name
  OPEN v_projectNameCurs;
  FETCH v_projectNameCurs INTO v_projectName;
  CLOSE v_projectNameCurs;
  
  IF INSTR(LOWER(v_projectName), 'sql server') <> 0 THEN
  	v_emulationPkgNamePrefix := 'sqlserver_utilities.';
  ELSIF INSTR(LOWER(v_projectName), 'sqlserver') <> 0 THEN
  	v_emulationPkgNamePrefix := 'sqlserver_utilities.'; 	
  ELSIF INSTR(LOWER(v_projectName), 'access') <> 0 THEN
    v_emulationPkgNamePrefix := 'msaccess_utilities.';
  ELSIF INSTR(LOWER(v_projectName), 'sybase') <> 0 THEN
    v_emulationPkgNamePrefix := 'sybase_utilities.';
  ELSIF INSTR(LOWER(v_projectName), 'ase') <> 0 THEN
    v_emulationPkgNamePrefix := 'sybase_utilities.';  
  ELSIF INSTR(LOWER(v_projectName), 'mysql') <> 0 THEN
    v_emulationPkgNamePrefix := 'mysql_utilities.';  
  END IF;
  
  OPEN v_curs;
  LOOP
  	FETCH v_curs into v_schemaId, v_tableId, v_tableName, v_columnId, v_columnName;
  	EXIT WHEN v_curs%NOTFOUND;
  	-- The above query excludes already created sequences, so we should be ok.
  	-- create the sequence:
  	-- 1. Get the seedvalue, increment, lastvalue if present
  	FOR v_row in (SELECT * FROM MD_ADDITIONAL_PROPERTIES WHERE REF_ID_FK = v_columnId)
  	LOOP
  	  IF v_row.PROP_KEY = C_PROPKEY_SEEDVALUE THEN
  	    v_seedValue := TO_NUMBER(v_row.VALUE);
          END IF;
  	  IF v_row.PROP_KEY = C_PROPKEY_INCREMENT THEN
  	    v_increment := TO_NUMBER(v_row.VALUE);
          END IF;
  	  IF v_row.PROP_KEY = C_PROPKEY_LASTVALUE THEN
  	    v_lastVal := TO_NUMBER(v_row.VALUE);
  	  END IF;
  	END LOOP;
  	-- Note: We'll start our sequence where the source left off.
  	IF v_lastVal IS NOT NULL THEN
  	  v_seedValue := v_lastVal;
  	END IF;
      
  	-- 2. Create the sequence
  	-- Note: I'm adding _SEQ to the column name for now. We'll have to use the collision manager in the
  	-- future.
  	v_seqName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_tableName || '_' || v_columnName || '_SEQ');
  	INSERT INTO MD_SEQUENCES(SCHEMA_ID_FK, NAME, SEQ_START, INCR)
  	  VALUES (v_schemaId, v_seqName, v_seedValue, v_increment)
  	  RETURNING ID INTO v_retId;
  	v_retSeqId := v_retId;
  	-- And of course a new derivative record
  	INSERT INTO MD_DERIVATIVES(SRC_ID, SRC_TYPE, DERIVED_ID, DERIVED_TYPE, DERIVED_CONNECTION_ID_FK, TRANSFORMED, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
  	  VALUES(v_columnId, C_OBJECTTYPE_COLUMNS, v_retId, C_OBJECTTYPE_SEQUENCES, p_connectionId, C_TRANSFORMED_TRUE, NULL, v_seqName, C_NS_SCHEMA_OBJS || TO_CHAR(v_schemaId));
  	-- Create the trigger
        v_trgName := MIGRATION_TRANSFORMER.TRANSFORM_IDENTIFIER(v_tableName || '_' || v_columnName || '_TRG');
  	v_triggerText := GET_IDENTITY_TRIGGER(v_trgName, v_tableName , v_ColumnName ,v_seqName ,v_emulationPkgNamePrefix);
  	-- Note: I'm adding _TRG to the column name for now.We'll have to use the collsion manager in the futre.
  	INSERT INTO MD_TRIGGERS(TABLE_OR_VIEW_ID_FK, TRIGGER_ON_FLAG, TRIGGER_NAME, TRIGGER_TIMING, TRIGGER_OPERATION, NATIVE_SQL, LANGUAGE)
  	  VALUES(v_tableId, 'T', v_trgName, 'BEFORE', 'INSERT OR UPDATE', EMPTY_CLOB(), C_LANGUAGEID_ORACLE)
  	  RETURNING ID INTO v_retId;
  	INSERT INTO MD_ADDITIONAL_PROPERTIES ( CONNECTION_ID_FK, REF_ID_FK, REF_TYPE, PROP_KEY, VALUE )
       VALUES (p_connectionid, v_retId, C_OBJECTTYPE_TRIGGERS, C_PROPKEY_TRIGGER_REWRITE, '');
    INSERT INTO MD_ADDITIONAL_PROPERTIES ( CONNECTION_ID_FK, REF_ID_FK, REF_TYPE, PROP_KEY, VALUE )
       VALUES (p_connectionid, v_retId, C_OBJECTTYPE_TRIGGERS, C_PROPKEY_SEQUENCEID, TO_CHAR(v_retSeqId));	
  	INSERT INTO MD_DERIVATIVES(SRC_ID, SRC_TYPE, DERIVED_ID, DERIVED_TYPE, DERIVED_CONNECTION_ID_FK, TRANSFORMED, ORIGINAL_IDENTIFIER, NEW_IDENTIFIER, DERIVED_OBJECT_NAMESPACE)
  	  VALUES(v_columnId, C_OBJECTTYPE_COLUMNS, v_retId, C_OBJECTTYPE_TRIGGERS, p_connectionId, C_TRANSFORMED_TRUE, NULL, v_trgName, C_NS_SCHEMA_OBJS || TO_CHAR(v_schemaId));
        SELECT NATIVE_SQL INTO v_lob FROM MD_TRIGGERS WHERE ID = v_retId;          
        DBMS_LOB.OPEN(v_lob, DBMS_LOB.LOB_READWRITE);
        DBMS_LOB.WRITE(v_lob, LENGTH(v_triggerText), 1, v_triggerText);
        DBMS_LOB.CLOSE(v_lob);
  END LOOP;
  COMMIT;
  CLOSE v_curs;
  RETURN 0;
END transform_identity_columns;




FUNCTION transform_rewrite_trigger(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  CURSOR v_curs is SELECT ID, TABLE_OR_VIEW_ID_FK, TRIGGER_ON_FLAG, TRIGGER_NAME,
    TRIGGER_TIMING, TRIGGER_OPERATION, TRIGGER_EVENT, NATIVE_SQL, NATIVE_KEY,
    LANGUAGE, COMMENTS from MD_TRIGGERS where ID in
    (SELECT REF_ID_FK from MD_ADDITIONAL_PROPERTIES
    WHERE CONNECTION_ID_FK = p_connectionid and PROP_KEY = C_PROPKEY_TRIGGER_REWRITE);
  CURSOR v_projectNameCurs 
  	IS
  	SELECT project_name FROM mgv_all_connections WHERE connection_id = p_connectionid;
  
  v_rowTriggers MD_TRIGGERS%ROWTYPE;
  v_tableName MD_TABLES.TABLE_NAME%TYPE;
	v_columnName MD_COLUMNS.COLUMN_NAME%TYPE;
	v_retId MD_SEQUENCES.ID%TYPE;
  v_retSeqId MD_SEQUENCES.ID%TYPE;
	v_seqName MD_SEQUENCES.NAME%TYPE;
  v_seqName2 MD_SEQUENCES.NAME%TYPE;
	v_triggerText VARCHAR2(4000);
  v_lob CLOB;
  v_projectName VARCHAR2(100);
  v_emulationPkgNamePrefix VARCHAR2(100) := '';
BEGIN
  -- Auxillary, get the emulation package name
  OPEN v_projectNameCurs;
  FETCH v_projectNameCurs INTO v_projectName;
  CLOSE v_projectNameCurs;
  
  IF INSTR(LOWER(v_projectName), 'sql server') <> 0 THEN
  	v_emulationPkgNamePrefix := 'sqlserver_utilities.';
  ELSIF INSTR(LOWER(v_projectName), 'sqlserver') <> 0 THEN
  	v_emulationPkgNamePrefix := 'sqlserver_utilities.';
  ELSIF INSTR(LOWER(v_projectName), 'access') <> 0 THEN
    v_emulationPkgNamePrefix := 'msaccess_utilities.';
  ELSIF INSTR(LOWER(v_projectName), 'sybase') <> 0 THEN
    v_emulationPkgNamePrefix := 'sybase_utilities.';
  ELSIF INSTR(LOWER(v_projectName), 'ase') <> 0 THEN
    v_emulationPkgNamePrefix := 'sybase_utilities.';  
  ELSIF INSTR(LOWER(v_projectName), 'mysql') <> 0 THEN
    v_emulationPkgNamePrefix := 'mysql_utilities.';
  END IF;
  
  open v_curs;
  loop
    fetch v_curs into v_rowTriggers.ID, v_rowTriggers.TABLE_OR_VIEW_ID_FK, v_rowTriggers.TRIGGER_ON_FLAG, v_rowTriggers.TRIGGER_NAME,
    v_rowTriggers.TRIGGER_TIMING, v_rowTriggers.TRIGGER_OPERATION, v_rowTriggers.TRIGGER_EVENT, v_rowTriggers.NATIVE_SQL, v_rowTriggers.NATIVE_KEY,
    v_rowTriggers.LANGUAGE, v_rowTriggers.COMMENTS ;
    EXIT WHEN v_curs%NOTFOUND;
    update MD_TRIGGERS set native_sql = empty_clob() where id = v_rowTriggers.ID;

    -- get table and column name from the derivative of this trigger
    select T.TABLE_NAME, C.COLUMN_NAME into v_tableName, v_columnName from MD_TABLES T,
      MD_COLUMNS C where C.TABLE_ID_FK = T.ID and C.ID =
      (select SRC_ID from MD_DERIVATIVES where DERIVED_ID =  v_rowTriggers.ID and SRC_TYPE =
      C_OBJECTTYPE_COLUMNS and DERIVED_CONNECTION_ID_FK = p_connectionid);
    -- get sequence name from id got from additional property
    select s.NAME into v_seqName from MD_SEQUENCES s where s.ID =
      (select TO_NUMBER(VALUE) from MD_ADDITIONAL_PROPERTIES where CONNECTION_ID_FK = p_connectionid
      AND REF_ID_FK = v_rowTriggers.ID and PROP_KEY = C_PROPKEY_SEQUENCEID);
      v_triggerText := GET_IDENTITY_TRIGGER(v_rowTriggers.TRIGGER_NAME, v_tableName , v_ColumnName ,v_seqName ,v_emulationPkgNamePrefix);
    SELECT NATIVE_SQL INTO v_lob FROM MD_TRIGGERS WHERE ID = v_rowTriggers.ID;          
    DBMS_LOB.OPEN(v_lob, DBMS_LOB.LOB_READWRITE);
    DBMS_LOB.WRITE(v_lob, LENGTH(v_triggerText), 1, v_triggerText);
    DBMS_LOB.CLOSE(v_lob);
  END LOOP;
  COMMIT;
  CLOSE v_curs;
  return 0;
END transform_rewrite_trigger;

FUNCTION gatherConnectionStats(p_connectionId MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
	v_numCatalogs INTEGER := 0;
	v_numColumns INTEGER := 0;
	v_numConstraints INTEGER := 0;
	v_numGroups INTEGER := 0;
	v_numRoles INTEGER := 0;
	v_numIndexes INTEGER := 0;
	v_numOtherObjects INTEGER := 0;
	v_numPackages INTEGER := 0;
	v_numPrivileges INTEGER := 0;
	v_numSchemas INTEGER := 0;
	v_numSequences INTEGER := 0;
	v_numStoredPrograms INTEGER := 0;
	v_numSynonyms INTEGER := 0;
	v_numTables INTEGER := 0;
	v_numTableSpaces INTEGER := 0;
	v_numTriggers INTEGER := 0;
	v_numUserDefinedDataTypes INTEGER := 0;
	v_numUsers INTEGER := 0;
	v_numViews INTEGER := 0;
BEGIN
	SELECT COUNT(*) INTO v_numCatalogs FROM MD_CATALOGS  WHERE CONNECTION_ID_FK = p_connectionId;
	SELECT COUNT(*) INTO v_numColumns FROM MD_COLUMNS WHERE TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numConstraints FROM MD_CONSTRAINTS WHERE  TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numGroups FROM MD_GROUPS WHERE GROUP_FLAG = 'G' AND SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId); 
	SELECT COUNT(*) INTO v_numRoles FROM MD_GROUPS WHERE GROUP_FLAG = 'R' AND SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numIndexes FROM MD_INDEXES  WHERE TABLE_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numOtherObjects FROM MD_OTHER_OBJECTS WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numPackages FROM MD_PACKAGES WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);  
	SELECT COUNT(*) INTO v_numPrivileges FROM MD_PRIVILEGES WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numSchemas FROM MD_SCHEMAS WHERE CATALOG_ID_FK IN (SELECT CATALOG_ID FROM MGV_ALL_CATALOGS WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numSequences FROM MD_SEQUENCES WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numStoredPrograms FROM MD_STORED_PROGRAMS WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numSynonyms FROM MD_SYNONYMS WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numTables FROM MD_TABLES WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numTableSpaces FROM MD_TABLESPACES WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numTriggers FROM MD_TRIGGERS WHERE TABLE_OR_VIEW_ID_FK IN (SELECT TABLE_ID FROM MGV_ALL_TABLES WHERE CONNECTION_ID = p_connectionId
                                                                                          UNION SELECT VIEW_ID FROM MGV_ALL_VIEWS WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numUserDefinedDataTypes FROM MD_USER_DEFINED_DATA_TYPES WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numUsers FROM MD_USERS WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
	SELECT COUNT(*) INTO v_numViews FROM MD_VIEWS WHERE SCHEMA_ID_FK IN (SELECT SCHEMA_ID FROM MGV_ALL_SCHEMA WHERE CONNECTION_ID = p_connectionId);
  	UPDATE MD_CONNECTIONS SET  
		NUM_CATALOGS = v_numCatalogs,
		NUM_COLUMNS = v_numColumns,
		NUM_CONSTRAINTS = v_numConstraints,
		NUM_GROUPS = v_numGroups,
		NUM_ROLES = v_numRoles,
		NUM_INDEXES = v_numIndexes,
		NUM_OTHER_OBJECTS = v_numOtherObjects,
		NUM_PACKAGES = v_numPackages,
		NUM_PRIVILEGES = v_numPrivileges,
		NUM_SCHEMAS = v_numSchemas,
		NUM_SEQUENCES = v_numSequences,
		NUM_STORED_PROGRAMS = v_numStoredPrograms,
		NUM_SYNONYMS = v_numSynonyms,
		NUM_TABLES = v_numTables,
		NUM_TABLESPACES = v_numTableSpaces,
		NUM_TRIGGERS = v_numTriggers,
		NUM_USER_DEFINED_DATA_TYPES = v_numUserDefinedDataTypes,
		NUM_USERS = v_numUsers,
        	NUM_VIEWS = v_numViews
	WHERE ID = p_connectionId;
	COMMIT;
	RETURN 0;
END gatherConnectionStats;

-- One time initialisation
begin
NULL;
end;

/

--------------------------------------------------------
--  DDL for Package Body MIGRATION_REPORT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MIGRATION_REPORT" AS
--Function getCaptureStatus
FUNCTION getCaptureStatus(srcid IN NUMBER)  RETURN VARCHAR2 IS
status VARCHAR(20) default ' ';
BEGIN
  select decode((select count(*) from migrlog where ref_object_id=srcid and severity>800),0,'Passed','Failed') into status from dual;
  return status;
END getCaptureStatus;
--Function getConvertStatus
FUNCTION getConvertStatus(srcid IN NUMBER,convert_conn_id IN NUMBER)  RETURN VARCHAR2 IS
status VARCHAR(20) default ' ';
ifconvert NUMBER default 0;
BEGIN
  SELECT count(*) into ifconvert FROM md_derivatives WHERE src_id=srcid and derived_connection_id_fk=convert_conn_id;
  IF ifconvert=0 THEN
      RETURN 'NotConverted';
  ELSIF getCaptureStatus(srcid)='Failed' THEN
     RETURN 'Failed';
  ELSE
   BEGIN
    SELECT 
   decode((SELECT DISTINCT severity from migrlog 
                  WHERE  ref_object_id IN (SELECT derived_id FROM md_derivatives WHERE src_id=srcid and derived_connection_id_fk= convert_conn_id) 
                         and severity=1000
           UNION
           SELECT DISTINCT severity from migrlog 
                  WHERE ref_object_id IN (SELECT derived_id FROM md_derivatives where src_id=srcid and derived_connection_id_fk=convert_conn_id)
                  AND severity=900 
                  AND logtext like '%limitation%'),
                  null,'Passed',1000,'Failed',900,'Limitation',' ') 
  into status from dual;
  return status;
  END;
  END IF;
END getConvertStatus;
--Function getGenerateStatus
FUNCTION getGenerateStatus(srcid IN number,convert_conn_id IN NUMBER)  RETURN VARCHAR2 IS
status VARCHAR(20) default ' ';

BEGIN
   status:=getConvertStatus(srcid,convert_conn_id);   
   IF status='NotConverted' THEN
      RETURN 'NotGenerated';
   ELSIF  status='Failed'  THEN
      RETURN 'Failed';      
   ELSE
     BEGIN
        SELECT 
           decode((SELECT count(*) FROM migrlog 
                   WHERE ref_object_id IN (SELECT derived_id FROM md_derivatives WHERE src_id=srcid and derived_connection_id_fk=convert_conn_id) 
                         AND phase='Generate'
                         AND severity>800),
                    0,'Passed','Failed')
             INTO status FROM dual;
        RETURN status;
    END;
   END IF;
END getGenerateStatus;
--migration details for each objects
FUNCTION getDetails(capture_conn_id IN NUMBER,convert_conn_id IN NUMBER) RETURN migr_report_detail_table PIPELINED IS
BEGIN
FOR cur IN (
    select allobjs.ObjID captured_id,
           allobjs.ObjName captured_name,
           md.new_identifier converted_name,
           allobjs.ObjType captured_type,
           decode(md.derived_type,'MD_INDEXES', substr(md.derived_type,4, length(md.derived_type)-5),substr(md.derived_type,4, length(md.derived_type)-4)) converted_type,
           allobjs.CaptureStatus capture_status,
           allobjs.ConvertStatus convert_status,
           allobjs.GenerateStatus generate_status,
           decode(mlog.logtext,null,' ',mlog.logtext) logtext from (
 --schema
     SELECT md_schemas.id ObjID,md_schemas.name ObjName,'SCHEMA' ObjType,
          MIGRATION_REPORT.getCaptureStatus(md_schemas.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_schemas.id,convert_conn_id) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_schemas.id,convert_conn_id) GenerateStatus
       FROM md_schemas,md_catalogs
       WHERE md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=capture_conn_id
--table
UNION ALL
      SELECT md_tables.id ObjID,md_tables.table_name ObjName,'TABLE' ObjType,
          MIGRATION_REPORT.getCaptureStatus(md_tables.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_tables.id,convert_conn_id) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_tables.id,convert_conn_id) GenerateStatus
       FROM md_tables,md_schemas,md_catalogs
       WHERE md_tables.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=capture_conn_id
--view
UNION ALL
      SELECT md_views.id ObjID,md_views.view_name ObjName,'View' ObjType,
          MIGRATION_REPORT.getCaptureStatus(md_views.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_views.id,convert_conn_id) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_views.id,convert_conn_id) GenerateStatus
       FROM md_views,md_schemas,md_catalogs
       WHERE md_views.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=capture_conn_id
--storedprogram
UNION ALL
      SELECT md_stored_programs.id ObjID,md_stored_programs.name ObjName,'STORED_PROGRAM' ObjType,
          MIGRATION_REPORT.getCaptureStatus(md_stored_programs.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_stored_programs.id,convert_conn_id) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_stored_programs.id,convert_conn_id) GenerateStatus
       FROM md_stored_programs,md_schemas,md_catalogs
       WHERE md_stored_programs.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=capture_conn_id
--index
UNION ALL
      SELECT md_indexes.id ObjID,md_indexes.index_name ObjName,'INDEX' ObjType,
          MIGRATION_REPORT.getCaptureStatus(md_indexes.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_indexes.id,convert_conn_id) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_indexes.id,convert_conn_id) GenerateStatus
       FROM md_indexes, md_tables,md_schemas,md_catalogs
       WHERE md_indexes.table_id_fk= md_tables.id
            AND md_tables.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=capture_conn_id
UNION ALL
      SELECT md_constraints.id ObjID,md_constraints.name ObjName,'CONSTRAINT' ObjType,
          MIGRATION_REPORT.getCaptureStatus(md_constraints.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_constraints.id,convert_conn_id) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_constraints.id,convert_conn_id) GenerateStatus
       FROM md_constraints, md_tables,md_schemas,md_catalogs
       WHERE md_constraints.table_id_fk= md_tables.id
            AND md_tables.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=capture_conn_id  
UNION ALL
      SELECT md_triggers.id ObjID,md_triggers.trigger_name ObjName,'TRIGGER' ObjType,
          MIGRATION_REPORT.getCaptureStatus(md_triggers.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_triggers.id,convert_conn_id) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_triggers.id,convert_conn_id) GenerateStatus
       FROM md_triggers, md_tables,md_schemas,md_catalogs
       WHERE md_triggers.table_or_view_id_fk=md_tables.id
            AND md_tables.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=capture_conn_id 
UNION ALL
       SELECT md_triggers.id ObjID,md_triggers.trigger_name ObjName,'TRIGGER' ObjType,
          MIGRATION_REPORT.getCaptureStatus(md_triggers.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_triggers.id,convert_conn_id) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_triggers.id,convert_conn_id) GenerateStatus
       FROM md_triggers, md_views,md_schemas,md_catalogs
       WHERE md_triggers.table_or_view_id_fk=md_views.id
            AND md_views.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=capture_conn_id
  ) allobjs left join (select md_derivatives.src_id,migrlog.logtext 
                        from migrlog,md_derivatives 
                        where migrlog.ref_object_id = md_derivatives.derived_id or migrlog.ref_object_id=md_derivatives.src_id) mlog 
                                on allobjs.objid=mlog.src_id  left join md_derivatives md on allobjs.objid=md.src_id
    ) 
  LOOP
     PIPE ROW(MIGR_REPORT_DETAIL_ROW(cur.captured_id,
                              cur.captured_name,
                              cur.converted_name,
                              cur.captured_type,
                              cur.converted_type,
                              cur.capture_status,
                              cur.convert_status,
                              cur.generate_status,
                              cur.logtext
                              ));       
    
  END LOOP;  
  RETURN;
 END getDetails; 

--migration summary
FUNCTION getSum(capture_conn_id IN NUMBER,convert_conn_id IN NUMBER) RETURN migr_report_sum_table PIPELINED IS
--
capture_passed_schema number default 0;
capture_passed_table number default 0;
capture_passed_view number default 0;
capture_passed_sp number default 0;
capture_passed_index number default 0;
capture_passed_constraint number default 0;
capture_passed_trigger number default 0;
--
capture_failed_schema number default 0;
capture_failed_table number default 0;
capture_failed_view number default 0;
capture_failed_sp number default 0;
capture_failed_index number default 0;
capture_failed_constraint number default 0;
capture_failed_trigger number default 0;
--
convert_passed_schema number default 0;
convert_passed_table number default 0;
convert_passed_view number default 0;
convert_passed_sp number default 0;
convert_passed_index number default 0;
convert_passed_constraint number default 0;
convert_passed_trigger number default 0;
--
convert_limit_schema number default 0;
convert_limit_table number default 0;
convert_limit_view number default 0;
convert_limit_sp number default 0;
convert_limit_index number default 0;
convert_limit_constraint number default 0;
convert_limit_trigger number default 0;
--
convert_failed_schema number default 0;
convert_failed_table number default 0;
convert_failed_view number default 0;
convert_failed_sp number default 0;
convert_failed_index number default 0;
convert_failed_constraint number default 0;
convert_failed_trigger number default 0;
--
convert_not_schema number default 0;
convert_not_table number default 0;
convert_not_view number default 0;
convert_not_sp number default 0;
convert_not_index number default 0;
convert_not_constraint number default 0;
convert_not_trigger number default 0;
--
generate_passed_schema number default 0;
generate_passed_table number default 0;
generate_passed_view number default 0;
generate_passed_sp number default 0;
generate_passed_index number default 0;
generate_passed_constraint number default 0;
generate_passed_trigger number default 0;
--
generate_failed_schema number default 0;
generate_failed_table number default 0;
generate_failed_view number default 0;
generate_failed_sp number default 0;
generate_failed_index number default 0;
generate_failed_constraint number default 0;
generate_failed_trigger number default 0;
--
generate_not_schema number default 0;
generate_not_table number default 0;
generate_not_view number default 0;
generate_not_sp number default 0;
generate_not_index number default 0;
generate_not_constraint number default 0;
generate_not_trigger number default 0;
--CURSORS
--SCHEMAS CURSOR
CURSOR schema_status(cid IN NUMBER,did IN NUMBER) IS
      SELECT 
          MIGRATION_REPORT.getCaptureStatus(md_schemas.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_schemas.id,did) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_schemas.id,did) GenerateStatus
       FROM md_schemas,md_catalogs
       WHERE md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=cid;
--TABLES CURSOR
CURSOR table_status(cid IN NUMBER,did IN NUMBER) IS
      SELECT 
          MIGRATION_REPORT.getCaptureStatus(md_tables.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_tables.id,did) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_tables.id,did) GenerateStatus
       FROM md_tables,md_schemas,md_catalogs
       WHERE md_tables.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=cid;
--VIEWS CURSOR
CURSOR view_status(cid IN NUMBER,did IN NUMBER) IS
      SELECT 
          MIGRATION_REPORT.getCaptureStatus(md_views.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_views.id,did) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_views.id,did) GenerateStatus
       FROM md_views,md_schemas,md_catalogs
       WHERE md_views.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=cid;
--STORED_PROGRAMS CURSOR
CURSOR sp_status(cid IN NUMBER,did IN NUMBER) IS
      SELECT 
          MIGRATION_REPORT.getCaptureStatus(md_stored_programs.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_stored_programs.id,did) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_stored_programs.id,did) GenerateStatus
       FROM md_stored_programs,md_schemas,md_catalogs
       WHERE md_stored_programs.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=cid;
--INDEXES CURSOR
CURSOR index_status(cid IN NUMBER,did IN NUMBER) IS
      SELECT 
          MIGRATION_REPORT.getCaptureStatus(md_indexes.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_indexes.id,did) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_indexes.id,did) GenerateStatus
       FROM md_indexes, md_tables,md_schemas,md_catalogs
       WHERE md_indexes.table_id_fk= md_tables.id
            AND md_tables.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=cid;
--CONSTRAINTS CURSOR
CURSOR constraint_status(cid IN NUMBER,did IN NUMBER) IS
      SELECT 
          MIGRATION_REPORT.getCaptureStatus(md_constraints.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_constraints.id,did) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_constraints.id,did) GenerateStatus
       FROM md_constraints, md_tables,md_schemas,md_catalogs
       WHERE md_constraints.table_id_fk= md_tables.id
            AND md_tables.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=cid;  
--TRIGGERS CURSOR
CURSOR trigger_status(cid IN NUMBER,did IN NUMBER) IS
      SELECT 
          MIGRATION_REPORT.getCaptureStatus(md_triggers.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_triggers.id,did) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_triggers.id,did) GenerateStatus
       FROM md_triggers, md_tables,md_schemas,md_catalogs
       WHERE md_triggers.table_or_view_id_fk=md_tables.id
            AND md_tables.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=cid 
       UNION ALL
       SELECT 
          MIGRATION_REPORT.getCaptureStatus(md_triggers.id) CaptureStatus,
          MIGRATION_REPORT.getConvertStatus(md_triggers.id,did) ConvertStatus,
          MIGRATION_REPORT.getGenerateStatus(md_triggers.id,did) GenerateStatus
       FROM md_triggers, md_views,md_schemas,md_catalogs
       WHERE md_triggers.table_or_view_id_fk=md_views.id
            AND md_views.schema_id_fk=md_schemas.id
            AND md_schemas.catalog_id_fk= md_catalogs.id
            AND md_catalogs.connection_id_fk=cid;
BEGIN
 --count
 --schemas
 FOR cur IN schema_status(capture_conn_id,convert_conn_id)
 LOOP
                IF cur.capturestatus='Failed' 
                 THEN capture_failed_schema:=capture_failed_schema+1;
                ELSE capture_passed_schema:=capture_passed_schema+1;
                END IF;
                
                 IF cur.convertstatus='Failed' 
                    THEN convert_failed_schema:=convert_failed_schema+1;
                 ELSIF cur.convertstatus='Limitation' 
                    THEN convert_limit_schema:=convert_limit_schema+1;
                 ELSIF cur.convertstatus='Passed'
                    THEN  convert_passed_schema:=convert_passed_schema+1;
                 ELSE   convert_not_schema:=convert_not_schema+1;
                 END IF;
                
                IF cur.generatestatus='Failed' 
                 THEN generate_failed_schema:=generate_failed_schema+1;
                ELSIF cur.generatestatus='Passed' 
                 THEN generate_passed_schema:=generate_passed_schema+1;
                ELSE  generate_not_schema:=generate_not_schema+1;
                END IF;            
 END LOOP;
 --tables
 FOR cur IN table_status(capture_conn_id,convert_conn_id)
 LOOP
                IF cur.capturestatus='Failed' 
                 THEN capture_failed_table:=capture_failed_table+1;
                ELSE capture_passed_table:=capture_passed_table+1;
                END IF;
                
                 IF cur.convertstatus='Failed' 
                    THEN convert_failed_table:=convert_failed_table+1;
                 ELSIF cur.convertstatus='Limitation' 
                    THEN convert_limit_table:=convert_limit_table+1;
                 ELSIF cur.convertstatus='Passed'
                    THEN  convert_passed_table:=convert_passed_table+1;
                 ELSE   convert_not_table:=convert_not_table+1;
                 END IF;
                
                IF cur.generatestatus='Failed' 
                 THEN generate_failed_table:=generate_failed_table+1;
                ELSIF cur.generatestatus='Passed' 
                 THEN generate_passed_table:=generate_passed_table+1;
                ELSE  generate_not_table:=generate_not_table+1;
                END IF;            
 END LOOP;
 --views
 FOR cur IN view_status(capture_conn_id,convert_conn_id)
 LOOP
                IF cur.capturestatus='Failed' 
                 THEN capture_failed_view:=capture_failed_view+1;
                ELSE capture_passed_view:=capture_passed_view+1;
                END IF;
                
                 IF cur.convertstatus='Failed' 
                    THEN convert_failed_view:=convert_failed_view+1;
                 ELSIF cur.convertstatus='Limitation' 
                    THEN convert_limit_view:=convert_limit_view+1;
                 ELSIF cur.convertstatus='Passed'
                    THEN  convert_passed_view:=convert_passed_view+1;
                 ELSE   convert_not_view:=convert_not_view+1;
                 END IF;
                
                IF cur.generatestatus='Failed' 
                 THEN generate_failed_view:=generate_failed_view+1;
                ELSIF cur.generatestatus='Passed' 
                 THEN generate_passed_view:=generate_passed_view+1;
                ELSE  generate_not_view:=generate_not_view+1;
                END IF;            
 END LOOP;
 --stored programs
 FOR cur IN sp_status(capture_conn_id,convert_conn_id)
 LOOP
                IF cur.capturestatus='Failed' 
                 THEN capture_failed_sp:=capture_failed_sp+1;
                ELSE capture_passed_sp:=capture_passed_sp+1;
                END IF;
                
                 IF cur.convertstatus='Failed' 
                    THEN convert_failed_sp:=convert_failed_sp+1;
                 ELSIF cur.convertstatus='Limitation' 
                    THEN convert_limit_sp:=convert_limit_sp+1;
                 ELSIF cur.convertstatus='Passed'
                    THEN  convert_passed_sp:=convert_passed_sp+1;
                 ELSE   convert_not_sp:=convert_not_sp+1;
                 END IF;
                
                IF cur.generatestatus='Failed' 
                 THEN generate_failed_sp:=generate_failed_sp+1;
                ELSIF cur.generatestatus='Passed' 
                 THEN generate_passed_sp:=generate_passed_sp+1;
                ELSE  generate_not_sp:=generate_not_sp+1;
                END IF;            
 END LOOP;
 --index
 FOR cur IN index_status(capture_conn_id,convert_conn_id)
 LOOP
                IF cur.capturestatus='Failed' 
                 THEN capture_failed_index:=capture_failed_index+1;
                ELSE capture_passed_index:=capture_passed_index+1;
                END IF;
                
                 IF cur.convertstatus='Failed' 
                    THEN convert_failed_index:=convert_failed_index+1;
                 ELSIF cur.convertstatus='Limitation' 
                    THEN convert_limit_index:=convert_limit_index+1;
                 ELSIF cur.convertstatus='Passed'
                    THEN  convert_passed_index:=convert_passed_index+1;
                 ELSE   convert_not_index:=convert_not_index+1;
                 END IF;
                
                IF cur.generatestatus='Failed' 
                 THEN generate_failed_index:=generate_failed_index+1;
                ELSIF cur.generatestatus='Passed' 
                 THEN generate_passed_index:=generate_passed_index+1;
                ELSE  generate_not_index:=generate_not_index+1;
                END IF;            
 END LOOP;
 --constraints
 FOR cur IN constraint_status(capture_conn_id,convert_conn_id)
 LOOP
                IF cur.capturestatus='Failed' 
                 THEN capture_failed_constraint:=capture_failed_constraint+1;
                ELSE capture_passed_constraint:=capture_passed_constraint+1;
                END IF;
                
                 IF cur.convertstatus='Failed' 
                    THEN convert_failed_constraint:=convert_failed_constraint+1;
                 ELSIF cur.convertstatus='Limitation' 
                    THEN convert_limit_constraint:=convert_limit_constraint+1;
                 ELSIF cur.convertstatus='Passed'
                    THEN  convert_passed_constraint:=convert_passed_constraint+1;
                 ELSE   convert_not_constraint:=convert_not_constraint+1;
                 END IF;
                
                IF cur.generatestatus='Failed' 
                 THEN generate_failed_constraint:=generate_failed_constraint+1;
                ELSIF cur.generatestatus='Passed' 
                 THEN generate_passed_constraint:=generate_passed_constraint+1;
                ELSE  generate_not_constraint:=generate_not_constraint+1;
                END IF;            
 END LOOP;
 --triggers
 FOR cur IN trigger_status(capture_conn_id,convert_conn_id)
 LOOP
                IF cur.capturestatus='Failed' 
                 THEN capture_failed_trigger:=capture_failed_trigger+1;
                ELSE capture_passed_trigger:=capture_passed_trigger+1;
                END IF;
                
                 IF cur.convertstatus='Failed' 
                    THEN convert_failed_trigger:=convert_failed_trigger+1;
                 ELSIF cur.convertstatus='Limitation' 
                    THEN convert_limit_trigger:=convert_limit_trigger+1;
                 ELSIF cur.convertstatus='Passed'
                    THEN  convert_passed_trigger:=convert_passed_trigger+1;
                 ELSE   convert_not_trigger:=convert_not_trigger+1;
                 END IF;
                
                IF cur.generatestatus='Failed' 
                 THEN generate_failed_trigger:=generate_failed_trigger+1;
                ELSIF cur.generatestatus='Passed' 
                 THEN generate_passed_trigger:=generate_passed_trigger+1;
                ELSE  generate_not_trigger:=generate_not_trigger+1;
                END IF;            
 END LOOP; 
 --source exists row
  FOR cur IN (  
      SELECT 
        'Source Exists' Label,
         num_schemas,
         num_tables,
         num_indexes,
         num_constraints,
         num_views,
         num_stored_programs,        
         num_triggers
         FROM  md_connections
         WHERE type IS NULL and id=capture_conn_id
 )
 LOOP
   PIPE ROW(MIGR_REPORT_SUM_ROW(
           cur.Label, 
           cur.num_schemas,
           cur.num_tables,
           cur.num_indexes,
           cur.num_constraints,
           cur.num_views,
           cur.num_triggers,
           cur.num_stored_programs
             ));
 END LOOP; 
   PIPE ROW(MIGR_REPORT_SUM_ROW(
           'Capture Passed', 
           capture_passed_schema,
           capture_passed_table,
           capture_passed_index,
           capture_passed_constraint,
           capture_passed_view,
           capture_passed_trigger,
           capture_passed_sp
             ));
  PIPE ROW(MIGR_REPORT_SUM_ROW(
           'Capture Failed', 
           capture_failed_schema,
           capture_failed_table,
           capture_failed_index,
           capture_failed_constraint,
           capture_failed_view,
           capture_failed_trigger,
           capture_failed_sp
             ));
             
  PIPE ROW(MIGR_REPORT_SUM_ROW(
           'Convert Passed', 
           convert_passed_schema,
           convert_passed_table,
           convert_passed_index,
           convert_passed_constraint,
           convert_passed_view,
           convert_passed_trigger,
           convert_passed_sp
             ));
  PIPE ROW(MIGR_REPORT_SUM_ROW(
           'Convert Limitation', 
           convert_limit_schema,
           convert_limit_table,
           convert_limit_index,
           convert_limit_constraint,
           convert_limit_view,
           convert_limit_trigger,
           convert_limit_sp
             ));
  PIPE ROW(MIGR_REPORT_SUM_ROW(
           'Convert Failed', 
           convert_failed_schema,
           convert_failed_table,
           convert_failed_index,
           convert_failed_constraint,
           convert_failed_view,
           convert_failed_trigger,
           convert_failed_sp
             ));
             
  PIPE ROW(MIGR_REPORT_SUM_ROW(
           'Generate Passed', 
           generate_passed_schema,
           generate_passed_table,
           generate_passed_index,
           generate_passed_constraint,
           generate_passed_view,
           generate_passed_trigger,
           generate_passed_sp
             ));
  PIPE ROW(MIGR_REPORT_SUM_ROW(
           'Generate Failed', 
           generate_failed_schema,
           generate_failed_table,
           generate_failed_index,
           generate_failed_constraint,
           generate_failed_view,
           generate_failed_trigger,
           generate_failed_sp
             )); 
  RETURN;
END getSum;
END MIGRATION_REPORT;

/

--------------------------------------------------------
--  DDL for Package Body MIGRATION_TRANSFORMER
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MIGRATION_TRANSFORMER" AS
  -- Maximum length of an identifier
  MAX_IDENTIFIER_LEN NUMBER:=30;
C_DISALLOWED_CHARS   CONSTANT NVARCHAR2(100) := ' #.@`!"%^&*()-+=[]{};:,.<>?/~''£';

--PRIVATE FUNCTION
FUNCTION truncateStringByteSize(p_work VARCHAR2, p_bsize NUMBER) RETURN VARCHAR2
IS
v_work VARCHAR2(4000);
v_bsize NUMBER(10);
BEGIN
 IF LENGTHB(p_work) <= p_bsize THEN
    return p_work;
  END IF;
  v_work := p_work;
  v_work := SUBSTRB(v_work, 1, p_bsize);
  WHILE INSTRC(p_work, v_work , 1, 1) <> 1 LOOP -- a character has been cut in half or in 2/3 or 3/4 by substrb (multibyte can have up to 4 bytes) 
  --note each left over corrupt byte can be a single character
   BEGIN
     v_bsize := LENGTHB(v_work);
  	 v_work := SUBSTRB(v_work, 1, v_bsize-1);
   END;
  END LOOP; 
  return v_work;
END;

FUNCTION add_suffix(p_work VARCHAR2, p_suffix VARCHAR2, p_maxlen NUMBER) RETURN VARCHAR2
IS
  v_suflen NUMBER := LENGTHB(p_suffix);
  v_truncamount NUMBER;
BEGIN
  IF LENGTHB(p_work) < p_maxlen - v_suflen THEN
    RETURN p_work || p_suffix;
  END IF;
  v_truncamount := LENGTHB(p_work) + v_suflen - p_maxlen;
  RETURN truncateStringByteSize(p_work, LENGTHB(p_work)-v_truncamount) || p_suffix;
END add_suffix;
  

FUNCTION check_identifier_length(p_ident VARCHAR2) RETURN VARCHAR2
IS
  v_work VARCHAR2(4000);
BEGIN
  return truncateStringByteSize(p_ident,  MAX_IDENTIFIER_LEN);
END;

FUNCTION check_reserved_word(p_work VARCHAR2) RETURN VARCHAR2
IS
  v_count NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_count FROM MIGRATION_RESERVED_WORDS WHERE KEYWORD = UPPER(p_work);
  IF v_count > 0 THEN
    -- It is a reserved word
    RETURN add_suffix(p_work, '_', MAX_IDENTIFIER_LEN);
  END IF;
  RETURN p_work;
END check_reserved_word;

FUNCTION sys_check(p_work VARCHAR2) RETURN VARCHAR2
IS
BEGIN
  IF LENGTH(p_work) < 4 THEN
    return p_work;
  END IF;
  IF SUBSTR(p_work, 1, 4) <> 'SYS_' THEN
    return p_work;
  END IF;
  RETURN 'SIS_' || SUBSTR(p_work, 5);
END sys_check;

FUNCTION first_char_check(p_work NVARCHAR2) RETURN NVARCHAR2
/**
 * Never want to start with anything but AlphaNumeri
 */
IS
  v_firstChar NCHAR(1);
  v_allowed NCHAR(200);
BEGIN
  v_allowed := C_DISALLOWED_CHARS || '0123456789_$';
  v_firstChar := SUBSTR(p_work,1,1);
  if INSTR(v_allowed, v_firstChar) > 0 THEN
    return 'A' ||p_work;
  END IF;
  return p_work;
END first_char_check;



FUNCTION lTrimNonAlphaNumeric(p_work NVARCHAR2) RETURN NVARCHAR2
/**
 *Remove all non alphanumeric characters from the start 
 */
IS
  v_testChar VARCHAR2(2000);
  v_index NUMBER;
  v_work NVARCHAR2(4000):=p_work;
  v_forbiddenChars VARCHAR2(100);
  v_firstgoodchar NUMBER;
BEGIN
  v_forbiddenChars := C_DISALLOWED_CHARS ||'_$';
   FOR v_index in 1..LENGTH(v_work) LOOP
    v_testChar := SUBSTR(p_work, v_index, 1);
    IF INSTR(v_forbiddenChars, v_testChar) <= 0 THEN
      v_firstgoodchar := v_index;
      EXIT;--make sure to leave loop now as first real char reached
    END IF;
  END LOOP;
  return substr(p_work,v_firstgoodchar);
END lTrimNonAlphaNumeric;

FUNCTION removeQuotes(p_work NVARCHAR2) RETURN NVARCHAR2
/**
 * Removed Quotes around a identifier name
 */
IS
  v_firstChar NCHAR(1);
  v_lastChar NCHAR(1);
  v_quote NCHAR(200):= '"[]'; -- strip these from start and end;
  v_work NVARCHAR2(4000) := p_work;
BEGIN
  v_firstChar := SUBSTR(v_work,1,1);
  v_lastChar  := SUBSTR(v_work,LENGTH(v_work),1);
  if INSTR(v_quote, v_firstChar) > 0 THEN
  	v_work := SUBSTR(v_work, 2);
  	if INSTR(v_quote, v_lastChar) > 0 THEN
  	  v_work := SUBSTR(v_work,0,LENGTH(v_work)-1);
      return v_work;
    END IF;
      return v_work;
  END IF;
  return v_work;
END removeQuotes;


FUNCTION check_allowed_chars(p_work NVARCHAR2) RETURN NVARCHAR2
/* The documentation states 
 * "Nonquoted identifiers can contain only alphanumeric characters from your database character set and the
 *  underscore (_), dollar sign ($), and pound sign (#). Database links can also contain periods (.) and "at" signs (@).
 *  Oracle strongly discourages you from using $ and # in nonquoted identifiers."
 *  Heres a couple of gotchas
 *  1) We don't know where we will be generated to, so dunno what that database character set will be
 *  2) We've now way of knowing if a character is alphanumeric on the character set.
 * So... Here's what we'll do
 *  1) given that its come from a database, we'll assume with was alphanumeric
 *  2) We'll remove any "regular" symbol characters (i.e. one's on my keyboard!)
 *  3) We'll be storing in NVARCHAR2 in the hope that this will preserve everything.
 * 
 */
IS
  v_testChar VARCHAR2(2000);
  v_index NUMBER;
  -- Folowing syntax is a workaround for a problem with wrap.  Do not change it.
  v_forbiddenChars NVARCHAR2(100) := C_DISALLOWED_CHARS;
  v_work VARCHAR2(4000) := p_work;
  v_endswithunderscore boolean := FALSE;
BEGIN
  IF INSTR('_',SUBSTR(p_work, LENGTH(p_work))) >0 THEN
    v_endswithunderscore := TRUE;
  END IF;
  FOR v_index in 1..LENGTH(v_work) LOOP
    v_testChar := SUBSTR(p_work, v_index, 1);
    IF INSTR(v_forbiddenChars, v_testChar) > 0 THEN
      v_work := SUBSTR(v_work, 1, v_index-1) || '_' || SUBSTR(v_work, v_index+1);
    END IF;
  END LOOP;
  --NOW REMOVE DOUBLE UNDERSCORES see bug 6647397
  v_work := replace(replace (replace (v_work,'__','_'),'__','_'),'__','_');--replace 2 underscores with 1 underscore
  --REMOVE THE LT CHAR IF IT IS AN UNDERSCORE
  IF v_endswithunderscore=false AND INSTR('_',SUBSTR(v_Work,LENGTH(v_work))) > 0 THEN
    v_work := SUBSTR(v_work,0,LENGTH(v_work)-1);
  END IF;
  return v_work;
END check_allowed_chars;

FUNCTION transform_identifier(p_identifier NVARCHAR2)  RETURN NVARCHAR2
IS
  v_work VARCHAR2(4000);
BEGIN
  v_work := p_identifier;
  
  -- There are 10 rules defined for identifier naming:
  -- See http://st-doc.us.oracle.com/10/102/server.102/b14200/sql_elements008.htm#i27570
 
  v_work := removeQuotes(v_work);
  v_work := lTrimNonAlphaNumeric(v_work);
  --moving this to first as we can shrink the size of the name if they have more than 1 invalid char in a row.
  --see bug 6647397
   -- 5. Must begin withan alpha character from your character set
  v_work := first_char_check(v_work);
   -- 6. Alphanumeric characters from your database charset plus '_', '$', '#' only
  v_work := check_allowed_chars(v_work);
  -- 1. Length
  v_work := check_identifier_length(v_work);
  -- 2. Reserved words
  v_work := check_reserved_word(v_work);
  -- 3. "Special words" -I've handled these in reserved words, but still have to check if it starts with SYS
  v_work := sys_check(v_work);
  -- 4. "You should use ASCII characters in database names, global database names, and database link names,
  --    because ASCII characters provide optimal compatibility across different platforms and operating systems."
  -- This doesn't apply as we are not doing anything with DB names
  -- 7. Name collisions; we'll handle this at a higher level.
  -- 8. Nonquoted identifiers are case insensitive.  This is a doubl edged sword: If we use quoted, we can possible
  --    Keep it similar to the source platform.  However this is not how it is typically done in Oracle.
  -- 9. Columns in the same table.  See point 7. above.
  -- 10. All about overloading for functions and parameters.  We don't have to handle this here either, at this
  --     Should all be done by parsing technology.
  return v_work;
END transform_identifier;
FUNCTION fix_all_schema_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  v_ret NUMBER;
BEGIN
  v_ret := 0;
  -- First, we transform all identifiers to meet our rules
  -- Then, we need to see if we've caused any collisions in the process
  -- And if so, fix them
  -- Right now, this is a dummy stub.
  return v_ret;
END fix_all_schema_identifiers;

FUNCTION fix_all_identifiers(p_connectionid MD_CONNECTIONS.ID%TYPE) RETURN NUMBER
IS
  v_ret NUMBER;
BEGIN
  v_ret := fix_all_schema_identifiers(p_connectionid);
  return v_ret;
END fix_all_identifiers;  

END;

/

--------------------------------------------------------
--  DDL for Procedure KENAIKAN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "KENAIKAN" as
  jumlah numeric;
  total numeric;
begin
  for i in 1..10 loop
    jumlah:=0;
    select count(id_transaksi) into jumlah from transaksi_sewakamar where id_petugas=i;
    if jumlah>10 then
      select sum(gaji+(gaji*0.1)) into total from petugas where id_petugas=i;
      update gaji set gaji=total where id_petugas=i;
    end if;
  end loop;
end;

/

--------------------------------------------------------
--  DDL for Procedure UPDATEDISKONKAMAR
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "UPDATEDISKONKAMAR" 
( persen in number)
IS
BEGIN
  UPDATE jenis_kamar
  SET harga=harga_awal-harga_awal*persen/100;
END;

/

--------------------------------------------------------
--  DDL for Procedure UPDATEKEHARGAAWAL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "UPDATEKEHARGAAWAL" 
IS
BEGIN
  UPDATE jenis_kamar
  SET harga=harga_awal;
END;

/

