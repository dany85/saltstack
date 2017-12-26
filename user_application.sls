create_application_user:
  user.present:
    - name: application
    - uid: 1000
    - gid: 1000
    - gid_from_name: True
    - home: /app/application
    - createhome: True
    - require:
      - mount: mount_fs_app
