# expdp_impdp_windows_version
# function 
use windows bat to export and import oracle database files;

useable files are in expdp and impdp directories


# 导出数据库
cd expdp

exp_main.bat <user_name> <user_password> <data_dmp_dir> <size_of_perfile>

eg:

exp_main.bat test004 test004  E:/oracle/test004 5M

### 参数详解：
user_name： 导出数据库时使用的用户名

user_password： 导出数据库时使用的密码

data_dmp_dir：  导出数据文件存放的路径

size_of_perfile：限制每个导出文件的大小，单位为M，G等
n


# 导入数据库
cd impdp

imp_main.bat <user_name> <user_password> <data_dir_path> <filesize_of_dmp> <local_tablespace_name> <source_user_name> <dump_file_prefix>

eg:

imp_main.bat test005 test005 E:/oracle/test005 5G test test004 TEST005_

### 参数详解：
 user_name:导入数据库时使用的用户名

 user_password： 导入数据库时使用的密码

 data_dir_path：数据库导入的文件路径

 filesize_of_dmp：将要导入的所有数据文件的总大小，单位为M,G等

 local_tablespace_name：	使用的表空间名称

 source_user_name：	源用户（数据文件对应的导出用户名）名称

 dump_file_prefix： 数据文件前缀
