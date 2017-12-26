install_jdk:
  archive.extracted:
    - name: /app
    - source: salt://jdk-8u151-linux-x64.tar
    - require:
      - file: create_app_dir

create_symlink_jkd:
   file.symlink:
     - name: /app/java
     - target: /app/jdk1.8.0_151

install_tomcat:
  archive.extracted:
    - name: /app/application
    - source: salt://apache-tomcat-8.5.24.tar.gz
    - require:
      - mount: mount_fs_app

create_symlink_tomcat:
   file.symlink:
     - name: /app/application/tomcat
     - target: /app/application/apache-tomcat-8.5.24
     - require:  
       - archive: install_tomcat

