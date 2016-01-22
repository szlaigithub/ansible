#!/bin/bash
# 用于控制本地ansible
# 控制远端ansible操作
cd /etc/ansible && ansible-playbook -i hosts playbooks/control_R_Cont.yml
#ansible-playbook -i hosts cp.yml  && cat log/up.log
# 从远端取回执行结果文件up.log，并在本地打印出来
cd /etc/ansible && ansible-playbook -i hosts1 /etc/ansible/playbooks/get_R_C_Log.yml  && 
echo  "\033[41;37m##################################取回文件状态#################################\033[0m" &&
# more log/up.log &&
cat playbooks/log/up.log   && 
# cat log/up.log | grep  --color=auto '[a-z]'  && 
echo  "\033[41;37m###############################################################################\033[0m"
# 清空远端ansible生成的up.log文件
cd /etc/ansible  && ansible-playbook -i hosts /etc/ansible/playbooks/clean_R_C_Log.yml
# 清空本地的up.log文件
rm -rf playbooks/log/up.log
exit 0
