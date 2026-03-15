# GitHub sync!
./git.sh

# Clean up the old website build!
rm -rf _site

# Build the website again!
quarto render

# Set the appropriate file permissions! 
for i in $(find _site -type f); do chmod 644 $i; done
for i in $(find _site -type d); do chmod 755 $i; done

# Push the site to the remote server: Georgetown Domains!
read -p "Would you like to push to Georgetown Domains? (y/n): " 
read answer
if [ "$answer" != "${answer#[Yy]}" ]; then 
    rsync -av --delete _site/ pmaurerg@pmaurer.georgetown.domains:~/public_html/
    echo "Deployed successfully!"
else
    echo "Not pushing to Georgetown Domains!"
fi