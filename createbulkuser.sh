#!/bin/bash
userfile=userlist

username=$(cat userlist | tr 'A-Z'  'a-z')

password=Pass

for user in $username
do
       useradd -m $user -G docker -s /bin/bash
       echo $user:$password | chpasswd
done

echo "$(wc -l new) users have been created"
tail -n$(wc -l userlist) /etc/passwd
