#!/usr/bin/python
# Custom Ansible module: reports whether a Linux user exists.
from ansible.module_utils.basic import AnsibleModule
import pwd


def check_user(username):
    try:
        pwd.getpwnam(username)
        return True
    except KeyError:
        return False


def main():
    module = AnsibleModule(
        argument_spec=dict(
            username=dict(type='str', required=True)
        ),
        supports_check_mode=True,
    )

    username = module.params['username']
    module.exit_json(changed=False, username=username, exists=check_user(username))


if __name__ == '__main__':
    main()
