{
  "variables": {
    "ansible_roles_path": "/home/ubuntu"
  },

  "builders": [
    {
      "type": "amazon-ebs",
      "access_key": "",
      "secret_key": "",
      "region": "us-west-2",
      "source_ami": "ami-9fa761e7",
      "instance_type": "t2.nano",
      "ssh_username": "ubuntu",
      "ami_name": "packer {{timestamp}}",
      "vpc_id": "vpc-12859a74",
      "subnet_id": "subnet-24517442"
    }
  ],

  "provisioners": [
    {
      "type": "shell",
      "script": "bootstrap_ansible.sh"
    },
   
    {
      "type": "ansible",
      "ansible_env_vars": [
        "ANSIBLE_ROLES_PATH={{user `ansible_roles_path` }}"
      ],
      "user": "ubuntu",
      "playbook_file": "./playbookDockerInstall.yml"
    }
  ]
}
