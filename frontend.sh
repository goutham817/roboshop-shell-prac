dnf module disable nginx -y &>>/tmp/roboshop.log
echo $?
dnf module enable nginx:1.24 -y
echo $?

echo -e "\e[35m install nginx \e[0m"
dnf install nginx -y &>>/tmp/roboshop.log
  if [ $1 -eq 0]; then
     echo -e "\e[32m sucess \e[0m"
   else
     echo -e "\e[32m failed \e[0m"
  if

cp nginx.conf /etc/nginx/nginx.conf
rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
unzip /tmp/frontend.zip

systemctl start nginx
systemctl enable nginx