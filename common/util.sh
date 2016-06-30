#!/bin/bash

declare sys_version_name

get_system_version_name () {
    version_name=$(lsb_release -c)
    sys_version_name=${version_name:10}
    return 1
}
