# 1.1 创建Addressbook
CREATE TABLE Addressbook
(regist_no INT NOT NULL ,
name VARCHAR(128) NOT NULL ,
address VARCHAR(256) NOT NULL ,
tel_no CHAR(10) ,
mail_address CHAR(20),
PRIMARY KEY (regist_no));
# 1.2在表Addressbook添加列
ALTER TABLE Addressbook ADD COLUMN postal_code CHAR(8) NOT NULL ;
# 1.3删除表Addressbook
DROP TABLE Addressbook
# 1.4是否可以编写 SQL 语句来恢复删除掉的 Addressbook 表？
# 答：不能