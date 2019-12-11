

# Change Nested File Permissions
sudo find '->DIR<-' -type f -exec chmod 664 {} \;


# Change Nested Directory Permissions
sudo find '->DIR<-' -type d -exec chmod 775 {} \;


# Change Owner of all Nested
sudo find '->DIR<-' -exec chown brian:brian {} \;


