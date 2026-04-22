# Pull the latest changes
git pull origin main

# Stage all changes
git add .

# Commit the changes
if [ -z "$1" ]; then
  echo "Enter commit message: "
  read commit_msg
else
  commit_msg="$1"
fi
git commit -m "$commit_msg"

# Push the changes
git push origin main