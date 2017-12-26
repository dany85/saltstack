create_app_dir:
  file.directory:
    - name: /app

phisical_volume_initialization:
  lvm.pv_present:
     - name: /dev/sdb

volume_group_VGapp_creation:
   lvm.vg_present:
     - name: VGapp
     - devices: /dev/sdb
     - require:
       - lvm: phisical_volume_initialization

logical_volume_LVapp_creation:
  lvm.lv_present:
    - name: LVapp
    - vgname: VGapp
    - extents: '100%FREE'
    - require:
      - lvm: volume_group_VGapp_creation 

create_fs_on_VGapp/LVapp:
  blockdev.formatted:
    - name: /dev/VGapp/LVapp
    - fs_type: 'ext4'
    - force: True
    - require:
      - lvm: logical_volume_LVapp_creation 

mount_fs_app:
  mount.mounted:
    - name: /app
    - device: /dev/VGapp/LVapp
    - fstype: ext4
    - require:
      - blockdev: create_fs_on_VGapp/LVapp 
