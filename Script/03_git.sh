echo "Input Github user name: "

read username

echo "Input Github user email: "

read useremail

git config --global user.name $username
git config --global user.email $useremail
git config --global credential.helper store
