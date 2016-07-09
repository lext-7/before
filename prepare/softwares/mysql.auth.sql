#!/usr/bin/env bash

use mysql;
update user set host = '%' where user ='root'  and host = 'localhost';
flush privileges;
