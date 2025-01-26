dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

cp catalogue.service /etc/catalogue/catalogue.service
cp mongodb.repo /etc/yum.repos.d/mongodb.repo

useradd roboshop

rm -rf /app
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
cd /app
unzip /tmp/catalogue.zip

npm install

dnf instal mongodb-mongosh -y
mongosh --host MONGODB-SERVER-IPADDRESS </app/db/master-data.js
systemctl daemon-reload

systemctl enable nodejs
systemctl restart nodejs