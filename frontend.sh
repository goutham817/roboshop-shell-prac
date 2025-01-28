dnf module disable nginx -y &>>/tmp/roboshop.log
echo $?
dnf module enable nginx:1.24 -y &>>/tmp/roboshop.log
echo $?
echo -e "\e[35m install nginx \e[0m"
dnf install nginx -y &>>/tmp/roboshop.log
 if [ $? -eq 0 ]; then
  echo -e "\e[32m  SUCCESS \e[0m"
else
  echo -e "\e[31m  FAILURE \e[0m"
fi

cp nginx.conf /etc/nginx/nginx.conf &>>/tmp/roboshop.log
rm -rf /usr/share/nginx/html/*

echo -e "\e[35m downloaded content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
unzip /tmp/frontend.zip &>>/tmp/roboshop.log
echo $?

echo -e "\e[35m restart nginx \e[0m"
systemctl restart nginx &>>/tmp/roboshop.log
 echo $?

echo -e "\e[35m enable nginx \e[0m"
systemctl enable nginx
 echo $?