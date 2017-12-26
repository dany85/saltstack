install_apache:
  pkg.installed:
    - name: httpd
  service.running:
    - name: httpd
    - require: 
      - pkg: httpd
