echo "Input Github user name: "

read username

echo "Input Github user email: "

read useremail

git config --global user.name $username
git config --global user.email $useremail
git config --global credential.helper store

echo "Do you want to setup SSH key? (y/n)"

mkdir ~/.ssh
cd ~/.ssh
export SOCIALST="$HOME/Socialst"
cp $SOCIALST/Git/config ~/.ssh/config
echo "[Do] Type 'github' to first question and skip other questions"
ssh-keygen -t ecdsa -C "$useremail"
xclip -sel clip < ~/.ssh/github.pub

echo "[Completed] SSH key copied to clipboard"
echo "[Do] Now go to 'Add New SSH Keys' webpage"
sleep 1
echo "[Do] Paste SSH key in 'Key' field"
# Sleep for 5 seconds
sleep 5
firefox "https://github.com/settings/ssh/new"

#ssh-add ~/.ssh/github
ssh -T git@github.com
